module tb;
    // Signals
    reg clk;
    reg rst_n;
    reg [3:0] in1;
    reg [3:0] in2;
    reg [1:0] opcode;
    wire [7:0] out_data;

    // Instantiate the device under test (DUT)
    device dut (
        .in1(in1),
        .in2(in2),
        .opcode(opcode),
        .out_data(out_data)
    );

    // Test sequence
    initial begin
        
        in1 = 4'b0000;
        in2 = 4'b0000;
        opcode = 2'b00;

        #10 in1 = 4'd2; in2 = 4'd3; opcode = 2'b00; // Test addition
        #10 in1 = 4'd5; in2 = 4'd3; opcode = 2'b01; // Test subtraction
        #10 in1 = 4'd2; in2 = 4'd3; opcode = 2'b10; // Test multiplication
        #10 in1 = 4'd6; in2 = 4'd3; opcode = 2'b11; // Test division

        // Finish simulation
        #50;
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | in1: %d | in2: %d | opcode: %b | out_data: %d", $time, in1, in2, opcode, out_data);
    end

endmodule