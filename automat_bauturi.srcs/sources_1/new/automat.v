`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2021 07:24:44 AM
// Design Name: 
// Module Name: automat
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


module automat( clk, reset, bacnota_1, bacnota_5, bacnota_10, elibereaza_rest, sticla, rest_1, rest_5);
    input clk, reset, bacnota_1, bacnota_5, bacnota_10, elibereaza_rest;
    output reg sticla, rest_1, rest_5;
    reg [2:0] state;
    reg [2:0] next;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            state <= 3'b 000;
            next <= 3'b 000;
        end
        else
            state <= next;
    end
    
    always @(state or bacnota_1 or bacnota_5 or bacnota_10 or elibereaza_rest)
    begin
        case({elibereaza_rest, state, bacnota_1, bacnota_5, bacnota_10})
            7'b 0011000: begin next = 3'b 000; sticla = 1; rest_1 = 0; rest_5 = 0; end
            7'b 0111000: begin next = 3'b 000; sticla = 0; rest_1 = 1; rest_5 = 0; end //dau rest 1 leu
            7'b 0000100: begin next = 3'b 001; sticla = 0; rest_1 = 0; rest_5 = 0; end //am introdus 1 leu
            7'b 0001100: begin next = 3'b 010; sticla = 0; rest_1 = 0; rest_5 = 0; end //am introdus 2 lei
            7'b 0010100: begin next = 3'b 011; sticla = 0; rest_1 = 0; rest_5 = 0; end //am introdus 3 lei asa ca eliberez sticla
            7'b 1000100: begin next = 3'b 000; sticla = 0; rest_1 = 1; rest_5 = 0; end //am introdus 1 leu dar ma razgandesc
            7'b 1001100: begin next = 3'b 111; sticla = 0; rest_1 = 1; rest_5 = 0; end //am introdus 2 lei dar ma razgandesc
            7'b 1000000: 
            begin
            if(next == 1)
            begin
                next = 3'b 000; sticla = 0; rest_1 = 1; rest_5 = 0;
            end
            else
            begin
                next = 3'b 000; sticla = 0; rest_1 = 0; rest_5 = 0;
            end
            end //am introdus 0 leu dar ma razgandesc
            7'b 1001000: begin next = 3'b 000; sticla = 0; rest_1 = 1; rest_5 = 0; end //am introdus 1 lei dar ma razgandesc
            7'b 1010000: begin next = 3'b 111; sticla = 0; rest_1 = 1; rest_5 = 0; end
            7'b 0000010: begin next = 3'b 111; sticla = 1; rest_1 = 1; rest_5 = 0; end //am introdus 5 lei
            7'b 0000001: begin next = 3'b 111; sticla = 1; rest_1 = 1; rest_5 = 1; end //am introdus 10 lei
            default begin next = 3'b 000; sticla = 0; rest_1 = 0; rest_5 = 0; end
        endcase
    end
        
endmodule
