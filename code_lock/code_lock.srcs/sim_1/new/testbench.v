`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 15:45:43
// Design Name: 
// Module Name: testbench
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


module testbench();
     reg r1;
     reg r2;
     reg r3;
     reg r4;
     reg c1;
     reg c2;
     reg c3;
     reg c4;
     reg clk;
     wire led_red;
     wire led_green;
     code_lock test(
           .r1(r1),
           .r2(r2),
           .r3(r3),
           .r4(r4),
           .c1(c1),
           .c2(c2),
           .c3(c3),
           .c4(c4),
           .clk(clk),
           .led_red(led_red),
           .led_green(led_green)    
     );
     initial             //ÃÜÂëÎª213691
     begin
        clk=0;
        #50;
        r1=1;r2=1;r3=1;r4=1;c1=1;c2=1;c3=1;c4=1;
        #100;
        r1=0;c2=0;
        #20;
        r1=1;c2=1;
        #100;
        r1=0;c1=0;
        #20;
        r1=1;c1=1;
        #100;
        r1=0;c3=0;
        #20;
        r1=1;c3=1;
        #100;
        r2=0;c3=0;
        #20;
        r2=1;c3=1;
        #100;
        r3=0;c3=0;
        #20;
        r3=1;c3=1;
        #100;
        r1=0;c1=0;
        #20;
        r1=1;c1=1;
        #1000   $stop;
     end
      always
             begin
                #10 clk=~clk;
             end
endmodule
