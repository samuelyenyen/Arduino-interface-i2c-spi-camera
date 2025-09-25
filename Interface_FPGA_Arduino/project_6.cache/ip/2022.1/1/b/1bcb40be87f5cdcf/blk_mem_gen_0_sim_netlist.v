// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Wed Sep 21 16:30:44 2022
// Host        : DESKTOP-0BRDT4N running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire [7:0]dina;
  wire [7:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.68455 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "192" *) 
  (* C_READ_DEPTH_B = "192" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "192" *) 
  (* C_WRITE_DEPTH_B = "192" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21600)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
