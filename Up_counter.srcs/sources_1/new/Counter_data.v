`timescale 1ns / 1ps


`timescale 1ns / 1ps

module Counter_data(
    input i_clk,
    input i_reset,
    output [13:0] o_value 
    );

    reg [13:0] r_value;
    assign o_value = r_value;

    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) begin
            r_value <= 0;
        end
        else begin
            r_value <= r_value + 1;
        end
    end
endmodule