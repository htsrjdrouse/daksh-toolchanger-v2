#include <PinChangeInterrupt.h>
#include <PinChangeInterruptBoards.h>
#include <PinChangeInterruptPins.h>
#include <PinChangeInterruptSettings.h>

#include <Interrupt.h>
#include <LinearActuator.h>
#include <Servo.h>

Servo bottomLeftActuator;
Servo bottomRightActuator;

LinearActuator topActuator(
  /*potAPin*/  2,
  /*potBPin*/  3,
  /*servoPin*/ 9,
  /*limitPin*/ 7,
  /*stopVal*/  70,
  /*rangeMax*/ 198 );

void setup() {
  Serial.begin(9600);
  topActuator.setup();
  bottomLeftActuator.attach(11);
  bottomRightActuator.attach(6);
  bottomLeftActuator.write(0);
  bottomRightActuator.write(0);

}

void loop() {

  if (Serial.available() > 0) {
    char input = Serial.read();
    if (input == '8')
      topActuator.setPotTarget(198);
    else if (input == '2' && digitalRead(7) != LOW)
      topActuator.setPotTarget(-10);
    else if (input == '5')
      topActuator.stop();
    else if (input == 'r') {
      topActuator.setPotTarget(0);
      bottomLeftActuator.write(0);
      bottomRightActuator.write(0);
    }
    else if (input == 'e') {
      bottomLeftActuator.write(180);
      bottomRightActuator.write(180);
    }
  }



  topActuator.spin();
  delay(100);
}
