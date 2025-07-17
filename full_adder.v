module full_adder (
    input a, b, cin,   
    output sum, cout   
);
    wire sum_half, carry_half1, carry_half2;

    half_adder ha1 (.a(a), .b(b), .sum(sum_half), .carry(carry_half1));
    half_adder ha2 (.a(sum_half), .b(cin), .sum(sum), .carry(carry_half2));
    assign cout = carry_half1 | carry_half2;
endmodule