#include <SPI.h>

uint8_t myarray[256];
uint8_t temp;
uint8_t const ssFPGA = 9;
uint8_t test;
int x = 0;

void setup()
{
    pinMode(ssFPGA, OUTPUT);
    digitalWrite(ssFPGA, HIGH);
    SPI.begin();
    SPI.setClockDivider(SPI_CLOCK_DIV16);
    SPI.beginTransaction( SPISettings(2000000, MSBFIRST, SPI_MODE3 ) );    
    Serial.begin(2000000);
    for( int ii = 0; ii < 256; ii++){
      myarray[ii] = ii;
    }
}

void loop() 
{   
    int start;
    start = Serial.read();
    if(start == 'R'){
      //SPI start
      digitalWrite(ssFPGA, 0);
      Serial.println("write start");
      SPI.transfer(0xff);//write start
      for ( int jj = 0; jj < 256; jj++) {
            SPI.transfer(myarray[jj]);
      }
      Serial.println("write END");      
      digitalWrite(ssFPGA, 1);
    }
    delay(500);
}
