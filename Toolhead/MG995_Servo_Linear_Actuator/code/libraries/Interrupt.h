#ifndef INTERRUPT_H
#define INTERRUPT_H

#define MAX_INTERRUPTS 20
 
#include <Arduino.h>
#include <PinChangeInterrupt.h>
#include <PinChangeInterruptBoards.h>
#include <PinChangeInterruptPins.h>
#include <PinChangeInterruptSettings.h>

 
class Interrupt {
private:
  static Interrupt* interruptTable[MAX_INTERRUPTS];
public:
  Interrupt();
  ~Interrupt();
  static void addInterrupt(int pinNum, Interrupt *thisPtr);
  static void interrupt2();
  static void interrupt3();
  static void interrupt4();
  static void interrupt5();
  static void interrupt6();
  static void interrupt7();
  static void interrupt8();
  static void interrupt9();
  static void interrupt10();
  static void interrupt11();
  static void interrupt12();
  static void interrupt13();
  static void interrupt14();
  static void interrupt15();
  static void interrupt16();
  static void interrupt17();

  virtual void handler(int pinNum) = 0;
};

Interrupt* Interrupt::interruptTable[MAX_INTERRUPTS];
Interrupt::Interrupt() {}
Interrupt::~Interrupt() {}

void Interrupt::addInterrupt(int pinNum, Interrupt *thisPtr) {
  interruptTable[pinNum] = thisPtr;
  switch(pinNum) {
    case 2:
      Serial.println("registering 2");
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(2), interrupt2, CHANGE);
      break;
    case 3:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(3), interrupt3, CHANGE);
      break;
    case 4:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(4), interrupt4, CHANGE);
      break;
    case 5:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(5), interrupt5, CHANGE);
      break;
    case 6:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(6), interrupt6, CHANGE);
      break;
    case 7:
      digitalWrite(7, HIGH); //enable pullup resistor for limit switch
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(7), interrupt7, FALLING);
      break;
    case 8:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(8), interrupt8, CHANGE);
      break;
    case 9:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(9), interrupt9, CHANGE);
      break;
    case 10:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(10), interrupt10, CHANGE);
      break;
    case 11:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(11), interrupt11, CHANGE);
      break;
    case 12:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(12), interrupt12, CHANGE);
      break;
    case 13:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(13), interrupt13, CHANGE);
      break;
    case 14:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(14), interrupt14, CHANGE);
      break;
    case 15:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(15), interrupt15, CHANGE);
      break;
    case 16:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(16), interrupt16, CHANGE);
      break;
    case 17:
      attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(17), interrupt17, CHANGE);
      break;
  }
}

void Interrupt::interrupt2() { interruptTable[2]->handler(2); }
void Interrupt::interrupt3() { interruptTable[3]->handler(3); }
void Interrupt::interrupt4() { interruptTable[4]->handler(4); }
void Interrupt::interrupt5() { interruptTable[5]->handler(5); }
void Interrupt::interrupt6() { interruptTable[6]->handler(6); }
void Interrupt::interrupt7() { interruptTable[7]->handler(7); }
void Interrupt::interrupt8() { interruptTable[8]->handler(8); }
void Interrupt::interrupt9() { interruptTable[9]->handler(9); }
void Interrupt::interrupt10() { interruptTable[10]->handler(10); }
void Interrupt::interrupt11() { interruptTable[11]->handler(11); }
void Interrupt::interrupt12() { interruptTable[12]->handler(12); }
void Interrupt::interrupt13() { interruptTable[13]->handler(13); }
void Interrupt::interrupt14() { interruptTable[14]->handler(14); }
void Interrupt::interrupt15() { interruptTable[15]->handler(15); }
void Interrupt::interrupt16() { interruptTable[16]->handler(16); }
void Interrupt::interrupt17() { interruptTable[17]->handler(17); }
#endif
