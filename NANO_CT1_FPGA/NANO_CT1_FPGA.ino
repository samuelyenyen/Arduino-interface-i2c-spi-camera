
#include <Wire.h>
#include <SPI.h>
//-----------I2c-------------
uint8_t myarray[86400];
int32_t i = 0;
bool flag = false;
bool start = false;
//-----------SPI-------------
uint8_t const ssFPGA = 10;
int32_t addr;
uint8_t test,temp;

void setup() {
  //-----------I2c-------------
  Wire.begin(9);                // join i2c bus with address #8
  Wire.onReceive(receiveEvent); // register event
  Serial.begin(115200);           // start serial for output
  Wire.setClock(10000000);
  //-----------SPI-------------
  pinMode(ssFPGA, OUTPUT);
  digitalWrite(ssFPGA, HIGH);    
}

void loop() {
  if(flag==true){
//    Serial.println("I2C received complete");
    flag=false;  i=0;  start=false;

  //-----------SPI-------------
//  int start;
//  start = Serial.read();
//  if(start == 'R'){
    delay(1000);
    SPI.begin();
    SPI.setClockDivider(SPI_CLOCK_DIV16);
    SPI.beginTransaction( SPISettings(2000000, MSBFIRST, SPI_MODE3 ) );
    digitalWrite(ssFPGA, 0);
//    Serial.println("write start");
    SPI.transfer(0xff);//write start
    for ( int32_t jj = 0; jj < 86400; jj++) {
      SPI.transfer(myarray[jj]);
    }
//    Serial.println("write END");
    while(1){test = SPI.transfer(0x00);
      if(test==0xff){break;}};
//    Serial.println("receive start");
    SPI.transfer(0xfe);//receive start
    for ( int32_t jj = 0; jj < 86400; jj++) {
      test = SPI.transfer(0x00);
      Serial.println(test);
    }
//    Serial.println("receive END");
    for ( int32_t jj = 0; jj < 86400; jj++) {
      myarray[jj] = Serial.parseInt();
    }
    for ( int32_t jj = 0; jj < 86400; jj++) {
      Serial.println(myarray[jj]);
    }
    digitalWrite(ssFPGA, 1);
  }
  delay(500);
}

//-----------I2c-------------
void receiveEvent(int howMany) {
    for (int j=0;j<howMany;j++){
    myarray[i]= Wire.read();    // receive byte as an integer
    i++;
    }
    if(i==86400){flag=true;}
}
