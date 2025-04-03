module device (
    input  logic [3:0] in1,      // 4-bit input 1
    input  logic [3:0] in2,      // 4-bit input 2
    input  logic [1:0] opcode,   // 2-bit opcode
    output logic [7:0] out       // 1-byte output
);

    always_comb begin
        case (opcode)
            2'b00: out = {4'b0, in1 + in2}; // Add inputs
            2'b01: out = {4'b0, in1 - in2}; // Subtract inputs
            2'b10: out = in1 * in2;        // Multiply inputs
            /* verilator lint_off WIDTHEXPAND */
            2'b11: out = (in2 != 0) ? (in1 / in2) : 8'b0; // Divide inputs, handle divide by zero
            default: out = 8'b0;            // Default case
        endcase
    end
    this is a lint error
endmodule
