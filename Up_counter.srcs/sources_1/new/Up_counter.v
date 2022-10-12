`timescale 1ns / 1ps

module Up_counter(
    input i_clk,
    input i_reset,
    output [3:0] o_digit,
    output [7:0] o_font
    );

    wire r_digit_clk;
    wire r_data_clk;
    wire [1:0] r_digit_select;
    wire [13:0] r_value;
    wire [3:0] r_1000, r_100, r_10, r_1;
    wire [3:0] r_valuetwo;

    // digit
    Clock_divider divider_digit(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(r_digit_clk)
    );

    Counter_FND count_FND(
    .i_clk(r_digit_clk),
    .i_reset(i_reset),
    .o_counter(r_digit_select)
    );

    Decoder2to4 decoder24(
    .i_digitselect(r_digit_select),
    .o_digit(o_digit)
    );

    // data
    Clock_divider_data c_divider_data(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(r_data_clk)
    );

    Counter_data count_data(
    .i_clk(r_data_clk),
    .i_reset(i_reset),
    .o_value(r_value)
    );

    Digit_divider dde(
    .i_value(r_value),
    .o_1000(r_1000),
    .o_100(r_100),
    .o_10(r_10),
    .o_1(r_1)
    );

    MUX_4to1 Mux(
    .i_1000(r_1000),
    .i_100(r_100),
    .i_10(r_10),
    .i_1(r_1),
    .i_digitselect(r_digit_select),
    .o_value(r_valuetwo)
    );

    BCDtoFNDdecoder tofnddecoder(
    .i_value(r_valuetwo),
    .o_font(o_font)
    );






endmodule
