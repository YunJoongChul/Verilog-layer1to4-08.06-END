`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/04 14:24:26
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(clk, rst, start, dout);

input clk, rst, start;
output signed [47:0] dout;

wire signed [63:0] dout_layer1;
wire layer1_done, layer2_done, layer3_done;
wire [11:0] addr_layer1;
wire [10:0] addr_layer2;
wire [9:0]  addr_layer3; 
wire signed [31:0] dout_layer2;
wire done;
wire signed [95:0] dout_layer3;
layer1 u0(.clk(clk), .rst(rst), .start(start), .addr_layer1(addr_layer1), .dout(dout_layer1), .done(layer1_done)); 
layer2 u1(.clk(clk), .rst(rst), .start(layer1_done), .dout_layer1(dout_layer1), .addr_layer1(addr_layer1), .addr_layer2(addr_layer2),.dout(dout_layer2), .done(layer2_done));
layer3 u2(.clk(clk), .rst(rst), .start(layer2_done), .dout_layer2(dout_layer2), .addr_layer2(addr_layer2), .addr_layer3(addr_layer3),.dout(dout_layer3), .done(layer3_done));
layer4 u3(.clk(clk), .rst(rst), .start(layer3_done), .dout_layer3(dout_layer3), .addr_layer3(addr_layer3), .dout(dout), .done(done));


endmodule
