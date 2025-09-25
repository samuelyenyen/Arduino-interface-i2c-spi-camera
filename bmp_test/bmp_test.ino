// ArduCAM demo (C)2017 Lee
// Web: http://www.ArduCAM.com
// This program is a demo of how to capture image in RAW format
// 1. Capture and buffer the image to FIFO every 5 seconds 
// 2. Store the image to Micro SD/TF card with RAW format.
//3. You can change the resolution by change the "resolution = OV5642_640x480"
// This program requires the ArduCAM V4.0.0 (or above) library and ArduCAM shield V2
// and use Arduino IDE 1.6.8 compiler or above
#include <Wire.h>
#include <ArduCAM.h>
#include <SPI.h>
#include <SD.h>
#include "memorysaver.h"
#define BMPIMAGEOFFSET 66
const char bmp_header[BMPIMAGEOFFSET] PROGMEM =
{
  0x42, 0x4D, 0x36, 0x58, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x28, 0x00,
  0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00, 0x01, 0x00, 0x10, 0x00, 0x03, 0x00,
  0x00, 0x00, 0x00, 0x58, 0x02, 0x00, 0xC4, 0x0E, 0x00, 0x00, 0xC4, 0x0E, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x00, 0x00, 0xE0, 0x07, 0x00, 0x00, 0x1F, 0x00,
  0x00, 0x00
};
//This demo can only work on OV5640_MINI_5MP_PLUS or OV5642_MINI_5MP_PLUS platform.
#if !(defined (OV5642_MINI_5MP_PLUS))
#error Please select the hardware platform and camera module in the ../libraries/ArduCAM/memorysaver.h file
#endif
//#define   FRAMES_NUM    0x00
// set pin 7 as the slave select for the digital pot:
const int CS = 9;
bool is_header = false;
uint8_t start_capture = 0;
int total_time = 0;
uint32_t line,column;
  ArduCAM myCAM(OV5642, CS);

void setup() {
// put your setup code here, to run once:
uint8_t vid, pid;
uint8_t temp ;
  Wire.begin();
Serial.begin(115200);
Serial.println(F("ArduCAM Start!"));
// set the CS as an output:
pinMode(CS, OUTPUT);
digitalWrite(CS, HIGH);
// initialize SPI:
SPI.begin();
  
//Reset the CPLD
myCAM.write_reg(0x07, 0x80);
delay(100);
myCAM.write_reg(0x07, 0x00);
delay(100);  
  
while(1){
  //Check if the ArduCAM SPI bus is OK
  myCAM.write_reg(ARDUCHIP_TEST1, 0x55);
  temp = myCAM.read_reg(ARDUCHIP_TEST1);
  if(temp != 0x55)
  {
    Serial.println(F("SPI interface Error!"));
    delay(1000);continue;
  }else{
    Serial.println(F("SPI interface OK."));break;
  }
}

while(1){
  //Check if the camera module type is OV5642
  myCAM.rdSensorReg16_8(OV5642_CHIPID_HIGH, &vid);
  myCAM.rdSensorReg16_8(OV5642_CHIPID_LOW, &pid);
  if ((vid != 0x56) || (pid != 0x42)){
    Serial.println(F("Can't find OV5642 module!"));
    delay(1000);continue;
  }else{
    Serial.println(F("OV5642 detected."));break;      
  }
}
//Change to JPEG capture mode and initialize the OV5640 module
myCAM.set_format(BMP);
myCAM.InitCAM();  

myCAM.clear_bit(ARDUCHIP_TIM, VSYNC_LEVEL_MASK);
myCAM.wrSensorReg16_8(0x3818, 0x81);
myCAM.wrSensorReg16_8(0x3621, 0xA7);
}

void loop() {
  char VL,VH;
  byte r,g,b,r_temp,g_temp,b_temp;
  int start;
  start = Serial.read();
  if(start == 'R'){
// put your main code here, to run repeatedly:
  myCAM.flush_fifo();
  myCAM.clear_fifo_flag();
//Start capture
myCAM.start_capture();
Serial.println(F("start capture."));
total_time = millis();
while ( !myCAM.get_bit(ARDUCHIP_TRIG, CAP_DONE_MASK)); 
Serial.println(F("CAM Capture Done."));
total_time = millis() - total_time;
Serial.print(F("capture total_time used (in miliseconds):"));
Serial.println(total_time, DEC);
Serial.println("Saving the image,please waitting...");
total_time = millis();
myCAM.CS_LOW();
myCAM.set_fifo_burst();//Set fifo burst mode 
    for (int i = 0; i < 9600; i++){
      Wire.beginTransmission(9);
      for (int j = 0; j < 4; j++){
        VH = myCAM.read_fifo();
        VL = myCAM.read_fifo();
        r_temp = VL>>3 & 0x1F;
        g_temp = (((VH & 0xE0) >> 5) | ((VL & 0x07) << 3))&0x3F;
        b_temp = VH & 0x1F;
        if(r_temp==0){r=0;}
        else{r=(r_temp+1)*8-1;}
        if(b_temp==0){b=0;}
        else{b=(b_temp+1)*8-1;}
        if(g_temp==0){g=0;}
        else{g=((g_temp)+1)*4-1;}
  //        r = (r * 249 + 1014)>>11;
  //        g = (g * 253 + 505)>>10;
  //        b = (b * 249 + 1014)>>11;
        if (j==0 or j==2){
            Wire.write(r);
            Wire.write(g);
            Wire.write(b);
        }
      }
      Wire.endTransmission();
    }
    Serial.println("Image save OK.");
//Clear the capture done flag
    myCAM.CS_HIGH();
    myCAM.clear_fifo_flag();
  }
delay(5000);
}
