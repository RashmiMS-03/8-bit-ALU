module carry_lookahead_adder_8bit (
    input [7:0] a, b,
    input cin,
    input enable_add,
    output reg [15:0] SUM,
    output reg COUT
);
    wire c4;
    wire [7:0] sum;
    wire cout;

    carry_lookahead_adder_4bit cla0 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c4));
    carry_lookahead_adder_4bit cla1 (.a(a[7:4]), .b(b[7:4]), .cin(c4), .sum(sum[7:4]), .cout(cout));

    always @(*) begin
        if (enable_add) begin
            SUM = {8'b00000000, sum};
            COUT = cout;
        end else begin
            SUM = 16'b0;
            COUT = 1'b0;
        end
    end
endmodule