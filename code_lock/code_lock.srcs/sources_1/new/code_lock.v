`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 15:05:30
// Design Name: 
// Module Name: code_lock
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


module code_lock(
     input clk,              //时钟信号
     input r1,               //行
     input r2,
     input r3,
     input r4,
     input c1,              //列
     input c2,
     input c3,
     input c4,
     output reg led_red,   //红灯
     output reg led_green  //绿灯
    );
     reg[5:0]State_Next=0;
     reg[5:0]State_Current=0;
     
     wire num0=r4|c2;       //数字与行列间的联系
     wire num1=r1|c1;
     wire num2=r1|c2;
     wire num3=r1|c3;
     wire num4=r2|c1;
     wire num5=r2|c2;
     wire num6=r2|c3;
     wire num7=r3|c1;
     wire num8=r3|c2;
     wire num9=r3|c3;
     
     wire Rst=num1|num2;
     wire All_key=num0&&num1&&num2&&num3&&num4&&num5&&num6&&num7&&num8&&num9;
     //Define state, One Hot code
      parameter s0=6'b000000;
      parameter s1=6'b000001;
      parameter s2=6'b000010;
      parameter s3=6'b000100;
      parameter s4=6'b001000;
      parameter s5=6'b010000;
      parameter s6=6'b100000;
      //First paragraph, state change
      always @ (posedge clk or negedge Rst)
         begin
             if(!Rst)
                State_Current<=s0;
             else
                State_Current<=State_Next;
         end
      //The second paragraph, state judgment   
       always @ (negedge All_key)
         begin
             if(!Rst)
                State_Next=s0;
             else
               case(State_Current)
                                //密码为213691
                   s0:   State_Next=(!num2)?s1:s0;             
                   s1:   State_Next=(!num1)?s2:s0;
                   s2:   State_Next=(!num3)?s3:s0;
                   s3:   State_Next=(!num6)?s4:s0;
                   s4:   State_Next=(!num9)?s5:s0;
                   s5:   State_Next=(!num1)?s6:s0;
                   s6:   State_Next=s6;
                   default:  State_Next=6'bxxxxxx;
                endcase
         end
       //The third paragraph, state processing  
       always @ (Rst or State_Current)
         begin
            if(!Rst)
               begin
                 led_red<=1;
                 led_green<=0;
               end
            else
               case(State_Current)
                   s0:  begin   led_red<=1;led_green<=0; end
                   s1:  begin   led_red<=1;led_green<=0; end
                   s2:  begin   led_red<=1;led_green<=0; end
                   s3:  begin   led_red<=1;led_green<=0; end
                   s4:  begin   led_red<=1;led_green<=0; end
                   s5:  begin   led_red<=1;led_green<=0; end
                   s6:  begin   led_red<=0;led_green<=1; end
                   default: begin   led_red<=1;led_green<=0; end
                endcase
         end
endmodule
