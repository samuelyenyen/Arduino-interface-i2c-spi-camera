// Wire Slave Receiver
// by Nicholas Zambetti <http://www.zambetti.com>

// Demonstrates use of the Wire library
// Receives data as an I2C/TWI slave device
// Refer to the "Wire Master Writer" example for use with this

// Created 29 March 2006

// This example code is in the public domain.

#include <Wire.h>
uint8_t myarray[86400];
int32_t i = 0;
bool flag = false;

void setup() {
  Wire.begin(9);                // join i2c bus with address #8
  Wire.onReceive(receiveEvent); // register event
  Serial.begin(115200);           // start serial for output
  Wire.setClock(3400000);
}

void loop() {
  if(flag==true){
    Serial.println("Begin array");  
    for(int32_t ii=0;ii<86400;ii++){
      Serial.println(myarray[ii]);
    }
    Serial.println("END array");
    flag=false;  i=0;  
  }
  delay(100);
}

// function that executes whenever data is received from master
// this function is registered as an event, see setup()
void receiveEvent(int howMany) {
    for (int j=0;j<howMany;j++){
      myarray[i]= Wire.read();    // receive byte as an integer
      i++;
    }
    if(i==86400){flag=true;}
}
