#ifndef LINEAR_ACTUATOR_H
#define LINEAR_ACTUATOR_H
 
#include <Servo.h>
#include <Arduino.h>
 
class LinearActuator : public Interrupt {
private:
  Servo mServo;
  int mPotPos = 0;
  int mPotAPin;
  int mPotBPin;
  int mServoPin;
  int mLimitPin;
  int mCleanA;
  int mLastCleanA = -1;
  int mCleanB;
  int mLastCleanB = -1;
  int mStopVal;
  int mPotTarget = 0;
  int mRangeMax;




public:
  LinearActuator(int potAPin, int potBPin, int servoPin, int limitPin, int stopVal, int rangeMax);
  ~LinearActuator();
  void setup();
  void potAISR();
  void potBISR();
  void limitISR();
  void stop();
  void spin();
  void setPotTarget(int potTarget);
  void handler(int pinNum); // override virtual method

};

LinearActuator::LinearActuator(int potAPin, int potBPin, int servoPin, int limitPin, int stopVal, int rangeMax) {
  mPotAPin = potAPin;
  mPotBPin = potBPin;
  mServoPin = servoPin;
  mLimitPin = limitPin;
  mStopVal = stopVal;
  mRangeMax = rangeMax;
}

LinearActuator::~LinearActuator() {}

void LinearActuator::spin() {

  if (mPotTarget == mPotPos)
    mServo.write(mStopVal);
  else if (mPotTarget < mPotPos)
    if ((mPotPos - mPotTarget) > 20)
      mServo.write(mStopVal+30); // retract fast
    else 
      mServo.write(mStopVal+10); // slow
  else if (mPotTarget > mPotPos)
    if ((mPotTarget - mPotPos) > 20 && (mRangeMax - mPotPos) > 10)
      mServo.write(mStopVal-30); // extend fast
    else
      mServo.write(mStopVal-10); // slow
}

void LinearActuator::stop() {
  mPotTarget = mPotPos;
}

void LinearActuator::setPotTarget(int potTarget) {
  mPotTarget = potTarget;
}

void LinearActuator::potAISR() {

  mCleanA = digitalRead(mPotBPin);
  if (mCleanA > mLastCleanA && mLastCleanA != -1) // rising a
    if (mCleanB == 1)
      mPotPos--;
    else if (mCleanB == 0)
      mPotPos++;

  mLastCleanA = mCleanA;
  Serial.println(mPotPos);

}

void LinearActuator::potBISR() {

  mCleanB = digitalRead(mPotAPin);
  if (mCleanB > mLastCleanB && mLastCleanB != -1) // rising b
    if (mCleanA == 1)
      mPotPos++;
    else if (mCleanA == 0)
      mPotPos--;

  mLastCleanB = mCleanB;
  Serial.println(mPotPos);

}

void LinearActuator::limitISR() {
  mPotPos = -5;
  setPotTarget(0);
  Serial.println("limitISR()");
}

void LinearActuator::handler(int pinNum) {
  if (pinNum == mPotAPin)
    potAISR();
  else if (pinNum == mPotBPin)
    potBISR();
  else if (pinNum == mLimitPin)
    limitISR();
}

void LinearActuator::setup() {

  pinMode(mPotAPin, INPUT);
  pinMode(mPotBPin, INPUT);
  addInterrupt(mPotAPin, this);
  addInterrupt(mPotBPin, this);
  addInterrupt(mLimitPin, this);
  mServo.attach(mServoPin);

  while (digitalRead(mLimitPin) != 0)
    mServo.write(mStopVal+30);


  
}
 
#endif
