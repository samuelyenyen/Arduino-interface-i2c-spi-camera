module spi_byte( input wire CLK100MHZ,    // FPGA system clock (must be several times faster as SCLK, e.g. 66MHz)
                 input wire [1:0] btn,  // FPGA user reset button
					  input wire ck_sck,      // SPI clock (e.g. 4 MHz)
					  input wire ck_mosi,      // SPI master out, slave in
					  output wire ck_miso,     // SPI slave in, master out
					  input wire ck_ss,
					  output wire [3:0] led);    // output bit
    ///////////////////////////// SPI module					
   wire rxValid;
   wire [7:0] rx; reg [7:0] tx;
   spi_byte_if byte_if( .sysClk  (CLK100MHZ),
								.usrReset(btn[0]),
	                     .SCLK    (ck_sck),
								.MOSI    (ck_mosi),
								.MISO    (ck_miso),
								.SS      (ck_ss),
								.rxValid (rxValid),
								.rx      (rx),
								.tx      (tx) );
	
	///////////////////////////// storage
    reg [16:0] count; parameter RESOLUTION=86400;parameter START_RX=8'hff;parameter START_TX=8'hfe;
    reg [2:0] curr_state, next_state; parameter IDLE = 3'b000, RX = 3'b001, CAL = 3'b010, TX = 3'b011, TX_RD = 3'b100;
    //state machine
    always @(posedge CLK100MHZ) curr_state <= (btn[0])? IDLE: next_state;      
    always @(*)begin case (curr_state) IDLE : next_state = (rx==START_RX)? RX: IDLE;
                                       RX   : next_state = (count==RESOLUTION)? CAL: RX;
                                       CAL  : next_state = TX_RD;
                                       TX_RD: next_state = (rx==START_TX)? TX: TX_RD;
                                       TX   : next_state = (count==RESOLUTION)? IDLE: TX; 
                                       default : next_state = IDLE ; endcase end
    //BRAM
    wire ena,wea,enb;wire [7:0] doutb;
    assign ena = (next_state==RX)? 1: 0;
    assign wea = (next_state==RX)? 1: 0;
    assign enb = (next_state==TX)? 1: 0; 
    blk_mem_gen_0  mybram(.addra(count), .clka(CLK100MHZ), .dina(rx), .ena(ena), .wea(wea), .addrb(count), .clkb(CLK100MHZ), .doutb(doutb), .enb(enb));
    //counter                                   
    always @(posedge CLK100MHZ) count <= (curr_state==IDLE && next_state==RX)? 0: (next_state==TX && curr_state==TX_RD)? 0: (rxValid)? count+1: count;
//    always @(posedge CLK100MHZ) temp[count] <= (next_state==RX && rxValid)? rx: temp[count];
    always @(posedge CLK100MHZ) tx <=  (next_state==CAL)? 8'd0: (next_state==TX_RD)? 8'd255: (next_state==TX)? doutb: tx;
    
    // led indicator
    assign led[0] = (next_state == IDLE)? 1: (next_state == TX_RD)? 1: 0;
    assign led[1] = (next_state == RX)? 1 :(next_state == TX_RD)? 1: 0;
    assign led[2] = (next_state == CAL)? 1:0;
    assign led[3] = (next_state == TX)? 1:0;

    // nick's calculation
    
endmodule