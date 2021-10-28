`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2021 08:07:30 AM
// Design Name: 
// Module Name: sim_automat
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


module sim_automat();
    reg cclk, reset, bacnota_1, bacnota_5, bacnota_10, elibereaza_rest;
    wire sticla, rest_1, rest_5;
    
    automat aut(cclk, reset, bacnota_1, bacnota_5, bacnota_10, elibereaza_rest, sticla, rest_1, rest_5);
    
    initial
    begin
        reset = 1; cclk = 0; bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        #10 reset = 0; bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 1; elibereaza_rest = 0;
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        
        #10 bacnota_1 = 0; bacnota_5 = 1; bacnota_10 = 0; elibereaza_rest = 0;//sticla si rest 2 lei
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 1;
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        
        #10 bacnota_1 = 1; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        #10 bacnota_1 = 1; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 1;
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        
        #10 bacnota_1 = 1; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 1;
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        
        #10 bacnota_1 = 1; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        #10 bacnota_1 = 1; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        #10 bacnota_1 = 1; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
        #10 bacnota_1 = 0; bacnota_5 = 0; bacnota_10 = 0; elibereaza_rest = 0;
    end
    
    always
    begin
        #5 cclk = !cclk;
    end
endmodule
