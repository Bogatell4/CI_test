module device (
    input  logic [3:0] in1,      // 4-bit input 1
    input  logic [3:0] in2,      // 4-bit input 2
    input  logic [1:0] opcode,   // 2-bit opcode
    output logic [7:0] out       // 1-byte output
);

    always_comb begin
        case (opcode)
            //verilator lint_off WIDTHEXPAND
            2'b00: out = in1 + in2; // Add inputs
            2'b01: out = in1 - in2; // Subtract inputs
            2'b10: out = in1 * in2;        // Multiply inputs
            2'b11: out = (in2 != 0) ? (in1 / in2) : 8'b0; // Divide inputs, handle divide by zero
            //verilator lint_on WIDTHEXPAND
            default: out = 8'b0;            // Default case
        endcase
    end

endmodule
