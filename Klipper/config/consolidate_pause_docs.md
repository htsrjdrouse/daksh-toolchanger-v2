

[gcode_macro CONSOLIDATE_PAUSE]
description: Pause the actual running print
#rename_existing: PAUSE_BASE
gcode:
  ##### get user parameters or use default #####
  {% set client = printer['gcode_macro _CLIENT_VARIABLE'] | default({}) %}
  {% set idle_timeout = client.idle_timeout | default(43200) %}
  {% set temp = printer[printer.toolhead.extruder].target if printer.toolhead.extruder != '' else 0 %}
  {% set restore = False if printer.toolhead.extruder == ''
              else True  if params.RESTORE | default(1) | int == 1 else False %}
  ##### end of definitions #####

  # Check if already paused
  {% if printer['pause_resume'].is_paused|int == 0 %}
    # Save current state and set variables for resuming
    SAVE_GCODE_STATE NAME=PAUSE_state
    SET_GCODE_VARIABLE MACRO=RESUME VARIABLE=zhop VALUE=5
    SET_GCODE_VARIABLE MACRO=RESUME VARIABLE=last_extruder_temp VALUE="{{'restore': restore, 'temp': temp}}"

    # Set new idle timeout
    SET_GCODE_VARIABLE MACRO=RESUME VARIABLE=restore_idle_timeout VALUE={printer.configfile.settings.idle_timeout.timeout}
    SET_IDLE_TIMEOUT TIMEOUT={idle_timeout}

    # Retract filament 
    G91
    G1 E-1 F2700
    G90


    # Perform pause actions
    PAUSE_BASE
    G91
    G1 Z5 F900
    G90

    # Handle filament sensor (if applicable)
    {% if params.T|int > 0 and params.T|int < 5 %}
      SET_FILAMENT_SENSOR SENSOR=encoder_t{params.T} ENABLE=0
    {% endif %}

    # Turn off heaters and fan (optional, commented out)
    #TURN_OFF_HEATERS
    #M106 S0 

    # Custom actions
    RSCS_off
    {client.user_pause_macro | default("")}
    _TOOLHEAD_PARK_PAUSE_CANCEL {rawparams}

    # Display appropriate message
    {% if params.ERROR|default(0)|int == 1 %}
      M117 Print paused due to sensor error
    {% else %}
      M117 Print paused manually
    {% endif %}
  {% else %}
    M118 "Print Already Paused"
  {% endif %}



[gcode_macro CONSOLIDATE_RESUME]
description: Resume the actual running print
#rename_existing: RESUME_BASE
variable_last_extruder_temp: {'restore': False, 'temp': 0}
variable_restore_idle_timeout: 0
variable_idle_state: False
variable_zhop: 5
gcode:
  ##### get user parameters or use default #####
  {% set client = printer['gcode_macro _CLIENT_VARIABLE'] | default({}) %}
  {% set velocity = printer.configfile.settings.pause_resume.recover_velocity %}
  {% set sp_move = client.speed_move | default(velocity) %}
  {% set runout_resume = True if client.runout_sensor | default("") == ""   # no runout
                    else True if not printer[client.runout_sensor].enabled  # sensor is disabled
                    else printer[client.runout_sensor].filament_detected %} # sensor status
  {% set can_extrude = True if printer.toolhead.extruder == ''           # no extruder defined in config
                  else printer[printer.toolhead.extruder].can_extrude %} # status of active extruder
  {% set do_resume = False %}
  {% set prompt_txt = [] %}
  ##### end of definitions #####
  {% if printer.pause_resume.is_paused %}
    {% if printer["gcode_macro VARIABLES_LIST"].tc_state == 0 %}
      #### Printer coming from timeout idle state ####
      {% if printer.idle_timeout.state | upper == "IDLE" or idle_state %}
        SET_GCODE_VARIABLE MACRO=RESUME VARIABLE=idle_state VALUE=False
        {% if last_extruder_temp.restore %}
          RESPOND TYPE=echo MSG='{"Restoring \"%s\" temperature to %3.1f\u00B0C, this may take some time" % (printer.toolhead.extruder, last_extruder_temp.temp) }'
          TEMPERATURE_WAIT SENSOR=extruder minimum={last_extruder_temp.temp-2} maximum={last_extruder_temp.temp+2}
          {% set do_resume = True %}
        {% elif can_extrude %}
          {% set do_resume = True %}
        {% else %}
          RESPOND TYPE=error MSG='{"Resume aborted !!! \"%s\" not hot enough, please heat up again and press RESUME" % printer.toolhead.extruder}'
          {% set _d = prompt_txt.append("\"%s\" not hot enough, please heat up again and press RESUME" % printer.toolhead.extruder) %}
        {% endif %}
      #### Printer coming out of regular PAUSE state ####
      {% elif can_extrude %}
        {% set do_resume = True %}
      {% else %}
        RESPOND TYPE=error MSG='{"Resume aborted !!! \"%s\" not hot enough, please heat up again and press RESUME" % printer.toolhead.extruder}'
        {% set _d = prompt_txt.append("\"%s\" not hot enough, please heat up again and press RESUME" % printer.toolhead.extruder) %}
      {% endif %}

      {% if runout_resume %}
        {% if do_resume %}
          {% if restore_idle_timeout > 0 %} SET_IDLE_TIMEOUT TIMEOUT={restore_idle_timeout} {% endif %}
          {client.user_resume_macro | default("")}
          _CLIENT_EXTRUDE
          G91
          G1 Z-{zhop} F900  # Move Z back down by zhop amount
          G90
          #  Prime the nozzle
          G91
    	  G1 E1 F2700
    	  G90

          {% if printer["gcode_macro VARIABLES_LIST"]["print_status"]|int == 1 %}
            {% if printer["gcode_macro VARIABLES_LIST"]["pause_type"]|int == 1%}
              PREPARE_TOOL_BEFORE_RESUME
            {% endif %}
          {% endif %}
          RESTORE_GCODE_STATE NAME=PAUSE_state
          RESUME_BASE VELOCITY={params.VELOCITY | default(sp_move)}
          VERIFY_TOOLCHANGE_DURING_PRINT DURATION=5 FORCE=1
          SAVE_GCODE_STATE NAME=PAUSE_state
          RSCS_LAYER_CHECK LAYER={printer["gcode_macro VARIABLES_LIST"].current_layer}
          RESET_PAUSE_TYPE
          {% if printer["gcode_macro VARIABLES_LIST"].active_tool|int > -1 %}
            SET_STATUS_LED_LOCK T={printer["gcode_macro VARIABLES_LIST"].active_tool}
          {% endif %}
          SET_ENCLOSURE_DEFAULT
          UPDATE_DELAYED_GCODE ID=SETFILAMENTSENSOR_ON DURATION=5
        {% endif %}
      {% else %}
        RESPOND TYPE=error MSG='{"Resume aborted !!! \"%s\" detects no filament, please load filament and press RESUME" % (client.runout_sensor.split(" "))[1]}'
        {% set _d = prompt_txt.append("\"%s\" detects no filament, please load filament and press RESUME" % (client.runout_sensor.split(" "))[1]) %}
      {% endif %}

      ##### Generate User Information box in case of abort #####
      {% if not (runout_resume and do_resume) %}
        RESPOND TYPE=command MSG="action:prompt_begin RESUME aborted !!!"
        {% for element in prompt_txt %}
          RESPOND TYPE=command MSG='{"action:prompt_text %s" % element}'
        {% endfor %}
        RESPOND TYPE=command MSG="action:prompt_footer_button Ok|RESPOND TYPE=command MSG=action:prompt_end|info"
        RESPOND TYPE=command MSG="action:prompt_show"
      {% endif %}
    {% else %}
      M118 "Printer in Error State - Cannot Resume Print"
    {% endif %}
  {% endif %}
  RESTORE_GCODE_STATE NAME=PAUSE_state MOVE=1
  RESUME_BASE VELOCITY={params.VELOCITY | default(sp_move)}

