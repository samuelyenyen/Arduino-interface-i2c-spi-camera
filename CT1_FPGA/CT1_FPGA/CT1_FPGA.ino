#include <SPI.h>

uint8_t myarray[115200];
uint8_t temp;
uint8_t const ssFPGA = 10;
uint8_t test;
int32_t addr;
int x = 0;

void setup()
{
    pinMode(ssFPGA, OUTPUT);
    digitalWrite(ssFPGA, HIGH);
    SPI.begin();
    SPI.setClockDivider(SPI_CLOCK_DIV16);
    SPI.beginTransaction( SPISettings(2000000, MSBFIRST, SPI_MODE3 ) );    
    Serial.begin(2000000);
    for( int jj = 0; jj < 450; jj++){
      for( int ii = 0; ii < 256; ii++){  
        addr = 256*jj+ii;
        myarray[addr] = ii;
      }
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
      for ( int jj = 0; jj < 115200; jj++) {
            SPI.transfer(myarray[jj]);
      }
      Serial.println("write END");
      while(1){test = SPI.transfer(0x00);
            if(test==0xff){break;}};
      Serial.println("receive start");
      SPI.transfer(0xfe);//receive start
      for ( int jj = 0; jj < 115200; jj++) {
            test = SPI.transfer(0x00);
            Serial.println(test,DEC);
      }
      Serial.println("receive END");
      digitalWrite(ssFPGA, 1);
    }
    delay(500);
}
