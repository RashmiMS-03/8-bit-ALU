`timescale 1ns / 1ps

module alu_8bit_tb;
    // Inputs
    reg [7:0] a, b;
    reg cin;
    reg [2:0] sel;

    // Outputs
    wire [15:0] result;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    alu_8bit uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sel(sel),
        .result(result),
        .carry(carry)
    );

    initial begin
        a = 8'b00000001;
        b = 8'b00000000;
        cin = 1'b0;
        sel = 3'b000; // Select addition
        #10;

        a = 8'b00000001;
        b = 8'b00000000;
        cin = 1'b0;
        sel = 3'b001; // Select subtraction
        #10;

        a = 8'b00000011;
        b = 8'b00000011;
        cin = 1'b0;
        sel = 3'b010; // Test multiplication
        #10;

        a = 8'b00000001;
        b = 8'b00000001;
        cin = 1'b0;
        sel = 3'b011; // Test AND
        #10;

        a = 8'b00000001;
        b = 8'b00000000;
        cin = 1'b0;
        sel = 3'b100; // Test OR
        #10;

        a = 8'b00000001;
        b = 8'b00000001;
        cin = 1'b0;
        sel = 3'b101; // Test XOR
        #10;

        a = 8'b00000001;
        sel = 3'b110; // Test NOT
        #10;

        $stop;
    end
endmodule
