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
#if !(defined OV2640_MINI_2MP)
  #error Please select the hardware platform and camera module in the ../libraries/ArduCAM/memorysaver.h file
#endif
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
const int BUTTON_PIN = 2;
int buttonState = 0;
const int CS1 = 8;
const int CS2 = 9;
bool is_header = false;
uint8_t start_capture = 0;
int total_time = 0;
uint32_t line,column;
  ArduCAM myCAM1(OV2640, CS1);
  ArduCAM myCAM2(OV2640, CS2);
  
void setup() {
pinMode(BUTTON_PIN, INPUT);
// put your setup code here, to run once:
uint8_t vid, pid;
uint8_t temp1,temp2;
  Wire.begin();
Serial.begin(115200);
Serial.println(F("ArduCAM Start!"));
// set the CS as an output:
pinMode(CS1, OUTPUT);
pinMode(CS2, OUTPUT);
digitalWrite(CS1, HIGH);
digitalWrite(CS2, HIGH);
// initialize SPI:
SPI.begin();
  
//Reset the CPLD
myCAM1.write_reg(0x07, 0x80);
delay(100);
myCAM1.write_reg(0x07, 0x00);
delay(100);
myCAM2.write_reg(0x07, 0x80);
delay(100);
myCAM2.write_reg(0x07, 0x00);
delay(100);    
  
while(1){
  //Check if the ArduCAM SPI bus is OK
  myCAM1.write_reg(ARDUCHIP_TEST1, 0x55);
  temp1 = myCAM1.read_reg(ARDUCHIP_TEST1);
  if(temp1 != 0x55)
  {
    Serial.println(F("CS8 interface Error!"));
    delay(1000);continue;
  }else{
    Serial.println(F("CS8 interface OK."));break;
  }
}

while(1){
  //Check if the ArduCAM SPI bus is OK
  myCAM2.write_reg(ARDUCHIP_TEST1, 0x55);
  temp2 = myCAM2.read_reg(ARDUCHIP_TEST1);
  if(temp2 != 0x55)
  {
    Serial.println(F("CS9 interface Error!"));
    delay(1000);continue;
  }else{
    Serial.println(F("CS9 interface OK."));break;
  }
}

while(1){
    myCAM1.wrSensorReg8_8(0xff, 0x01);
    myCAM1.rdSensorReg8_8(OV2640_CHIPID_HIGH, &vid);
    myCAM1.rdSensorReg8_8(OV2640_CHIPID_LOW, &pid);
    if ((vid != 0x26 ) && (( pid != 0x41 ) || ( pid != 0x42 ))){
      Serial.println(F("ACK CMD Can't find CAM1 OV2640 module! END"));
      delay(1000);continue;
    }
    else{
      Serial.println(F("ACK CMD OV2640 detected. END"));break;
    } 
}
while(1){
    myCAM2.wrSensorReg8_8(0xff, 0x01);
    myCAM2.rdSensorReg8_8(OV2640_CHIPID_HIGH, &vid);
    myCAM2.rdSensorReg8_8(OV2640_CHIPID_LOW, &pid);
    if ((vid != 0x26 ) && (( pid != 0x41 ) || ( pid != 0x42 ))){
      Serial.println(F("ACK CMD Can't find CAM2 OV2640 module! END"));
      delay(1000);continue;
    }
    else{
      Serial.println(F("ACK CMD OV2640 detected. END"));break;
    } 
}
//Change to JPEG capture mode and initialize the OV5640 module
myCAM1.set_format(BMP);
myCAM1.InitCAM();  
myCAM1.wrSensorReg16_8(0x3818, 0x81);
myCAM1.wrSensorReg16_8(0x3621, 0xA7);

myCAM2.set_format(BMP);
myCAM2.InitCAM();  
myCAM2.wrSensorReg16_8(0x3818, 0x81);
myCAM2.wrSensorReg16_8(0x3621, 0xA7);
}

bool start = true;
void loop() {
  buttonState = digitalRead(BUTTON_PIN);
  char VL,VH;
  byte r,g,b,r_temp,g_temp,b_temp;
//  int start;
//  start = Serial.read();
//  if(start == 'R'){
//  if (start==true){
//-----------------------CAM1----------------------------
//  Wire.beginTransmission(9);
//  delay(10);
//  Wire.write(1);
//  Wire.endTransmission();
  if(buttonState == HIGH ){
  myCAM1.flush_fifo();
  myCAM1.clear_fifo_flag();
//Start capture
  myCAM1.start_capture();
  Serial.println(F("CAM1 start capture."));
  total_time = millis();
  while ( !myCAM1.get_bit(ARDUCHIP_TRIG, CAP_DONE_MASK)); 
  Serial.println(F("CAM1 Capture Done."));
  total_time = millis() - total_time;
  Serial.print(F("capture total_time used (in miliseconds):"));
  Serial.println(total_time, DEC);
  Serial.println("Saving the image,please waitting...");
  total_time = millis();
  myCAM1.CS_LOW();
  myCAM1.set_fifo_burst();//Set fifo burst mode 
     
  for (int i = 0; i < 19200; i++){
    VL = myCAM1.read_fifo();
    VH = myCAM1.read_fifo();
  }
    for (int i = 0; i < 120; i++){
      for (int k = 0; k < 320; k++){
          VH = myCAM1.read_fifo();
          VL = myCAM1.read_fifo();
          r_temp = VL>>3 & 0x1F;
          g_temp = (((VH & 0xE0) >> 5) | ((VL & 0x07) << 3))&0x3F;
          b_temp = VH & 0x1F;
          if(r_temp==0){r=0;}
          else{r=(r_temp+1)*8-1;}
          if(b_temp==0){b=0;}
          else{b=(b_temp+1)*8-1;}
          if(g_temp==0){g=0;}
          else{g=((g_temp)+1)*4-1;}
          if(k>=100&k<220){
              Wire.beginTransmission(9);
//              delay(1);
              Wire.write(r);
//              delay(1);
              Wire.write(g);
//              delay(1);
              Wire.write(b);
              Wire.endTransmission();
          }
      }
    }
    Serial.println("Image save OK.");
//Clear the capture done flag
    myCAM1.CS_HIGH();
    myCAM1.clear_fifo_flag();

//-----------------------CAM2----------------------------
  myCAM2.flush_fifo();
  myCAM2.clear_fifo_flag();
//Start capture
  myCAM2.start_capture();
  Serial.println(F("CAM2 start capture."));
  total_time = millis();
  while ( !myCAM2.get_bit(ARDUCHIP_TRIG, CAP_DONE_MASK)); 
  Serial.println(F("CAM2 Capture Done."));
  total_time = millis() - total_time;
  Serial.print(F("capture total_time used (in miliseconds):"));
  Serial.println(total_time, DEC);
  Serial.println("Saving the image,please waitting...");
  total_time = millis();
  myCAM2.CS_LOW();
  myCAM2.set_fifo_burst();//Set fifo burst mode 
  for (int i = 0; i < 19200; i++){
    VH = myCAM2.read_fifo();
    VL = myCAM2.read_fifo();
  }
    for (int i = 0; i < 120; i++){
      for (int k = 0; k < 320; k++){
          VH = myCAM2.read_fifo();
          VL = myCAM2.read_fifo();
          r_temp = VL>>3 & 0x1F;
          g_temp = (((VH & 0xE0) >> 5) | ((VL & 0x07) << 3))&0x3F;
          b_temp = VH & 0x1F;
          if(r_temp==0){r=0;}
          else{r=(r_temp+1)*8-1;}
          if(b_temp==0){b=0;}
          else{b=(b_temp+1)*8-1;}
          if(g_temp==0){g=0;}
          else{g=((g_temp)+1)*4-1;}
          if(k>=100&k<220){
              Wire.beginTransmission(9);
//              delay(1);
              Wire.write(r);
//              delay(1);
              Wire.write(g);
//              delay(1);
              Wire.write(b);
              Wire.endTransmission();
          }
      }
    }
//Clear the capture done flag
    myCAM2.CS_HIGH();
    myCAM2.clear_fifo_flag();

    Serial.println("Image save OK.");
//    start = false;
  }
delay(500);
}
