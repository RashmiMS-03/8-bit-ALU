module logic_operations (
    input [7:0] a, b,        
    input [2:0] sel,         
    input enable_logic,      
    output reg [15:0] result 
);
    always @(*) begin
        if (enable_logic) begin
            case (sel)
                3'b011: result = {8'b00000000, a & b}; 
                3'b100: result = {8'b00000000, a | b}; 
                3'b101: result = {8'b00000000, a ^ b}; 
                3'b110: result = {8'b00000000, ~a};    
                default: result = 16'b0;               
            endcase
        end else begin
            result = 16'b0;
        end
    end
endmodule