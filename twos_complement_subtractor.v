module twos_complement_subtractor (
    input [7:0] a, 
    input [7:0] b, 
    input enable_sub,
    output reg [15:0] diff, 
    output reg COUT
);
    wire [7:0] b_inverted = ~b + 8'b00000001;
    wire [7:0] sum;
    wire [6:0] carry;
    wire cout;

    half_adder ha0 (.a(a[0]), .b(b_inverted[0]), .sum(sum[0]), .carry(carry[0]));
    full_adder fa1 (.a(a[1]), .b(b_inverted[1]), .cin(carry[0]), .sum(sum[1]), .cout(carry[1]));
    full_adder fa2 (.a(a[2]), .b(b_inverted[2]), .cin(carry[1]), .sum(sum[2]), .cout(carry[2]));
    full_adder fa3 (.a(a[3]), .b(b_inverted[3]), .cin(carry[2]), .sum(sum[3]), .cout(carry[3]));
    full_adder fa4 (.a(a[4]), .b(b_inverted[4]), .cin(carry[3]), .sum(sum[4]), .cout(carry[4]));
    full_adder fa5 (.a(a[5]), .b(b_inverted[5]), .cin(carry[4]), .sum(sum[5]), .cout(carry[5]));
    full_adder fa6 (.a(a[6]), .b(b_inverted[6]), .cin(carry[5]), .sum(sum[6]), .cout(carry[6]));
    full_adder fa7 (.a(a[7]), .b(b_inverted[7]), .cin(carry[6]), .sum(sum[7]), .cout(cout));

    always @(*) begin
        if (enable_sub) begin
            diff = {8'b00000000, sum};
            COUT = cout;
        end else begin
            diff = 16'b0;
            COUT = 1'b0;
        end
    end
endmodule