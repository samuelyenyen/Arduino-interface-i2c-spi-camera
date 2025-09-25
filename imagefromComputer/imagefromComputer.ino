uint8_t test[86400];
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
}
char temp;
void loop() {
//    if(Serial.available()>0 ){
      for(int32_t i=0;i<86400;i++){
        test[i]=Serial.parseInt();
      }
//    }
//pre
    //send back
    for(int32_t i=0;i<86400;i++){
      Serial.println(test[i]);
//      delayMicroseconds(us)
    }
   
  delay(100);
}
