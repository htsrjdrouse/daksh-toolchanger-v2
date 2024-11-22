import logging
from dataclasses import dataclass
from typing import Optional, Callable
from collections import deque

from gcode_macro import GCodeMacro
from pause_resume import PauseResume


# Constants
DEFAULT_PAUSE_DELAY = 0.5
DEFAULT_EVENT_DELAY = 3.0
INITIALIZATION_DELAY = 2.0

@dataclass
class Config:
    name: str
    printer: object
    reactor: object
    gcode: object
    runout_pause: bool
    runout_gcode: Optional[str]
    insert_gcode: Optional[str]
    pause_delay: float
    event_delay: float
    debounce_time: float
    sample_time: float
    samples: int
    sensitivity: float

class RunoutHelper:
    def __init__(self, config: Config):
        self.config = config
        self.min_event_systime = self.config.reactor.NEVER
        self.filament_present = False
        self.sensor_enabled = True
        self.readings: Deque[bool] = deque(maxlen=config.samples)
        self.last_reading_time = 0
        self.consecutive_runout_count = 0
        self.consecutive_insert_count = 0

        self._setup_commands()
        self._setup_event_handlers()

    def _setup_commands(self):
        self.config.gcode.register_mux_command(
            "QUERY_FILAMENT_SENSOR", "SENSOR", self.config.name,
            self.cmd_QUERY_FILAMENT_SENSOR,
            desc=self.cmd_QUERY_FILAMENT_SENSOR_help)
        self.config.gcode.register_mux_command(
            "SET_FILAMENT_SENSOR", "SENSOR", self.config.name,
            self.cmd_SET_FILAMENT_SENSOR,
            desc=self.cmd_SET_FILAMENT_SENSOR_help)

    def _setup_event_handlers(self):
        self.config.printer.register_event_handler("klippy:ready", self._handle_ready)

    def _handle_ready(self):
        self.min_event_systime = self.config.reactor.monotonic() + INITIALIZATION_DELAY

    def _runout_event_handler(self, eventtime: float):
        if self.config.runout_pause:
            pause_resume: PauseResume = self.config.printer.lookup_object('pause_resume')
            pause_resume.send_pause_command()
            self.config.printer.get_reactor().pause(eventtime + self.config.pause_delay)
            prefix = "PAUSE\n"
        else:
            prefix = ""
        self._exec_gcode(prefix, self.config.runout_gcode)

    def _insert_event_handler(self, eventtime: float):
        self._exec_gcode("", self.config.insert_gcode)

    def _exec_gcode(self, prefix: str, template: Optional[Callable]):
        try:
            if template:
                self.config.gcode.run_script(f"{prefix}{template.render()}\nM400")
        except Exception:
            logging.exception("Script running error")
        self.min_event_systime = self.config.reactor.monotonic() + self.config.event_delay


    def note_filament_present(self, is_filament_present: bool):
        if not self.sensor_enabled:
            return
        current_time = self.config.reactor.monotonic()
        # Debounce check
        if current_time - self.last_reading_time < self.config.debounce_time:
            return
        
        self.last_reading_time = current_time
        self.readings.append(is_filament_present)
        
        # Calculate rolling average
        avg_presence = sum(self.readings) / len(self.readings)
        
        # Determine filament state based on sensitivity
        new_filament_present = avg_presence >= self.config.sensitivity
        
        if new_filament_present != self.filament_present:
            # State change detected, increment consecutive count
            if new_filament_present:
                self.consecutive_insert_count += 1
                self.consecutive_runout_count = 0
            else:
                self.consecutive_runout_count += 1
                self.consecutive_insert_count = 0
            
            # Check if we have enough consecutive readings to confirm state change
            if (new_filament_present and self.consecutive_insert_count >= self.config.samples) or \
               (not new_filament_present and self.consecutive_runout_count >= self.config.samples):
                self.filament_present = new_filament_present
                self._handle_state_change(current_time)
        else:
            # Reset consecutive counts if no change
            self.consecutive_insert_count = 0
            self.consecutive_runout_count = 0

    def _handle_state_change(self, eventtime: float):
        if eventtime < self.min_event_systime or not self.sensor_enabled:
            return

        idle_timeout = self.config.printer.lookup_object("idle_timeout")
        is_printing = idle_timeout.get_status(eventtime)["state"] == "Printing"

        if self.filament_present:
            if not is_printing and self.config.insert_gcode is not None:
                self.min_event_systime = self.config.reactor.NEVER
                logging.info(f"Filament Sensor {self.config.name}: insert event detected, Time {eventtime:.2f}")
                self.config.reactor.register_callback(self._insert_event_handler)
        elif is_printing and self.config.runout_gcode is not None:
            self.min_event_systime = self.config.reactor.NEVER
            logging.info(f"Filament Sensor {self.config.name}: runout event detected, Time {eventtime:.2f}")
            self.config.reactor.register_callback(self._runout_event_handler)


    def get_status(self, eventtime: float):
        return {
            "filament_detected": bool(self.filament_present),
            "enabled": bool(self.sensor_enabled)
        }

    cmd_QUERY_FILAMENT_SENSOR_help = "Query the status of the Filament Sensor"
    def cmd_QUERY_FILAMENT_SENSOR(self, gcmd):
        status = "detected" if self.filament_present else "not detected"
        gcmd.respond_info(f"Filament Sensor {self.config.name}: filament {status}")

    cmd_SET_FILAMENT_SENSOR_help = "Sets the filament sensor on/off"
    def cmd_SET_FILAMENT_SENSOR(self, gcmd):
        enable = gcmd.get_int("ENABLE", 1)
        self.sensor_enabled = bool(enable)
        state = "enabled" if self.sensor_enabled else "disabled"
        gcmd.respond_info(f"Filament sensor {self.config.name} has been {state}")
        logging.info(f"Filament sensor {self.config.name} {state}")



class SwitchSensor:
    def __init__(self, config):
        printer = config.get_printer()
        buttons = printer.load_object(config, 'buttons')
        switch_pin = config.get('switch_pin')
        buttons.register_buttons([switch_pin], self._button_handler)

        runout_config = Config(
            name=config.get_name().split()[-1],
            printer=printer,
            reactor=printer.get_reactor(),
            gcode=printer.lookup_object('gcode'),
            runout_pause=config.getboolean('pause_on_runout', True),
            runout_gcode=self._load_gcode_macro(config, 'runout_gcode'),
            insert_gcode=self._load_gcode_macro(config, 'insert_gcode'),
            pause_delay=config.getfloat('pause_delay', DEFAULT_PAUSE_DELAY, above=0.0),
            event_delay=config.getfloat('event_delay', DEFAULT_EVENT_DELAY, above=0.0),
            debounce_time=config.getfloat('debounce_time', 0.001, above=0),
            sample_time=config.getfloat('sample_time', 0.001, above=0),
            samples=config.getint('samples', 5, minval=1),
            sensitivity=config.getfloat('sensitivity', 0.8, above=0, maxval=1)
        )

        self.runout_helper = RunoutHelper(runout_config)
        self.get_status = self.runout_helper.get_status

    def _load_gcode_macro(self, config, option):
        gcode_macro = printer.load_object(config, 'gcode_macro')
        if config.get(option, None) is not None:
            return gcode_macro.load_template(config, option)
        return None

    def _button_handler(self, eventtime, state):
        self.runout_helper.note_filament_present(state)

def load_config_prefix(config):
    return SwitchSensor(config)

