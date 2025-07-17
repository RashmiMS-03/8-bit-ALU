module decoder (
    input [2:0] sel,       
    output reg enable_add, 
    output reg enable_sub, 
    output reg enable_mul,
    output reg enable_logic  
);
    always @(*) begin
        enable_add = 1'b0;
        enable_sub = 1'b0;
        enable_mul = 1'b0;
        enable_logic = 1'b0;

        case(sel)
            3'b000: enable_add = 1'b1;  
            3'b001: enable_sub = 1'b1;  
            3'b010: enable_mul = 1'b1;  
            3'b011, 3'b100, 3'b101, 3'b110: enable_logic = 1'b1;
            default: begin
                enable_add = 1'b0;    
                enable_sub = 1'b0;
                enable_mul = 1'b0;
                enable_logic = 1'b0;
            end
        endcase
    end
endmodule