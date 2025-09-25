`timescale 1ns / 1ps
module lab4_tb;

logic CLK100MHZ,ck_sck,ck_mosi,ck_miso,ck_ss,rst;
   // Instantiate the Unit Under Test (UUT)
spi_byte_if mytb (.sysClk(CLK100MHZ), .SCLK(ck_sck), .MOSI(ck_mosi), .MISO(ck_miso), .SS(ck_ss), .usrReset(rst));
always #5 CLK100MHZ = !CLK100MHZ;
always #20 ck_sck = !ck_sck;
   initial begin
   CLK100MHZ=0;ck_mosi=0;ck_ss=0;rst=0;
   #5
   ck_sck=1;
   #10
   rst=1;
   #20
   rst=0;
   #40
   ck_mosi=1;
   #40
   ck_mosi=0;
   #40
   ck_mosi=1;
   #40
   ck_mosi=0;
   #40
   ck_mosi=1;
   #40
   ck_mosi=0;
   #40
   ck_mosi=1;
   #40
   ck_mosi=0;
      end
endmodule
