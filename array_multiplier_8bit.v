module array_multiplier_8bit(
    input [7:0] a, b,
    input enable_mul,
    output reg[15:0] product
);
    wire [15:0] z;
    wire [7:0] p[7:0];
    wire [54:0] c;
    wire [47:0] s;

    genvar g, h;
    generate
        for (g = 0; g < 8; g = g + 1) begin
            for (h = 0; h < 8; h = h + 1) begin
                and and_gate(p[g][h], a[g], b[h]);
            end
        end
    endgenerate

    assign z[0] = p[0][0];

    half_adder h0(p[0][1], p[1][0], z[1], c[0]);
    half_adder h1(p[1][1], p[2][0], s[0], c[1]);
    half_adder h2(p[2][1], p[3][0], s[1], c[2]);
    half_adder h3(p[3][1], p[4][0], s[2], c[3]);
    half_adder h4(p[4][1], p[5][0], s[3], c[4]);
    half_adder h5(p[5][1], p[6][0], s[4], c[5]);
    half_adder h6(p[6][1], p[7][0], s[5], c[6]);

    full_adder f0(p[0][2], c[0], s[0], z[2], c[7]);
    full_adder f1(p[1][2], c[1], s[1], s[6], c[8]);
    full_adder f2(p[2][2], c[2], s[2], s[7], c[9]);
    full_adder f3(p[3][2], c[3], s[3], s[8], c[10]);
    full_adder f4(p[4][2], c[4], s[4], s[9], c[11]);
    full_adder f5(p[5][2], c[5], s[5], s[10], c[12]);
    full_adder f6(p[6][2], c[6], p[7][1], s[11], c[13]);

    full_adder f7(p[0][3], c[7], s[6], z[3], c[14]);
    full_adder f8(p[1][3], c[8], s[7], s[12], c[15]);
    full_adder f9(p[2][3], c[9], s[8], s[13], c[16]);
    full_adder f10(p[3][3], c[10], s[9], s[14], c[17]);
    full_adder f11(p[4][3], c[11], s[10], s[15], c[18]);
    full_adder f12(p[5][3], c[12], s[11], s[16], c[19]);
    full_adder f13(p[6][3], c[13], p[7][2], s[17], c[20]);

    full_adder f14(p[0][4], c[14], s[12], z[4], c[21]);
    full_adder f15(p[1][4], c[15], s[13], s[18], c[22]);
    full_adder f16(p[2][4], c[16], s[14], s[19], c[23]);
    full_adder f17(p[3][4], c[17], s[15], s[20], c[24]);
    full_adder f18(p[4][4], c[18], s[16], s[21], c[25]);
    full_adder f19(p[5][4], c[19], s[17], s[22], c[26]);
    full_adder f20(p[6][4], c[20], p[7][3], s[23], c[27]);

    full_adder f21(p[0][5], c[21], s[18], z[5], c[28]);
    full_adder f22(p[1][5], c[22], s[19], s[24], c[29]);
    full_adder f23(p[2][5], c[23], s[20], s[25], c[30]);
    full_adder f24(p[3][5], c[24], s[21], s[26], c[31]);
    full_adder f25(p[4][5], c[25], s[22], s[27], c[32]);
    full_adder f26(p[5][5], c[26], s[23], s[28], c[33]);
    full_adder f27(p[6][5], c[27], p[7][4], s[29], c[34]);

    full_adder f28(p[0][6], c[28], s[24], z[6], c[35]);
    full_adder f29(p[1][6], c[29], s[25], s[30], c[36]);
    full_adder f30(p[2][6], c[30], s[26], s[31], c[37]);
    full_adder f31(p[3][6], c[31], s[27], s[32], c[38]);
    full_adder f32(p[4][6], c[32], s[28], s[33], c[39]);
    full_adder f33(p[5][6], c[33], s[29], s[34], c[40]);
    full_adder f34(p[6][6], c[34], p[7][5], s[35], c[41]);

    full_adder f35(p[0][7], c[35], s[30], z[7], c[42]);
    full_adder f36(p[1][7], c[36], s[31], s[36], c[43]);
    full_adder f37(p[2][7], c[37], s[32], s[37], c[44]);
    full_adder f38(p[3][7], c[38], s[33], s[38], c[45]);
    full_adder f39(p[4][7], c[39], s[34], s[39], c[46]);
    full_adder f40(p[5][7], c[40], s[35], s[40], c[47]);
    full_adder f41(p[6][7], c[41], p[7][6], s[41], c[48]);

    full_adder f42(c[42], s[36], s[41], z[8], c[49]);
    full_adder f43(c[43], s[37], s[42], z[9], c[50]);
    full_adder f44(c[44], s[38], s[43], z[10], c[51]);
    full_adder f45(c[45], s[39], s[44], z[11], c[52]);
    full_adder f46(c[46], s[40], s[45], z[12], c[53]);
    full_adder f47(c[47], p[7][7], s[46], z[13], c[54]);

    always @(*) begin
        if (enable_mul)
            product = {8'b00000000, z};
        else
            product = 16'b0;
    end
endmodule