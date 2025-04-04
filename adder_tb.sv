module adder_tb;

reg [3:0] in1;
reg [3:0] in2;
reg [1:0] opcode;
wire [7:0] out;

// Instantiate the device under test (DUT)
device dut (
    .in1(in1),
    .in2(in2),
    .opcode(opcode),
    .out(out)
);


// Test sequence
initial begin

    $dumpfile("waveform_adder.vcd"); // Specifies the VCD file name
    $dumpvars(0, tb);          // Dumps all variables in the testbench

    $strobe("Time: %0t | in1: %d | in2: %d | opcode: %b | out_data: %d", $time, in1, in2, opcode, out);

    in1 = 4'b0000;
    in2 = 4'b0000;
    opcode = 2'b00;

    //verilator lint_off WIDTHEXPAND

    #10 in1 = 4'd4; in2 = 4'd3; opcode = 2'b00; // Test addition
    $strobe("Time: %0t | in1: %d | in2: %d | opcode: %b | out_data: %d", $time, in1, in2, opcode, out);
    #1 if(in1+in2 != out)$error("Adder failed: %d + %d != %d", in1, in2, out);

    #10 in1 = 4'd5; in2 = 4'd3; opcode = 2'b01; // Test subtraction
    $strobe("Time: %0t | in1: %d | in2: %d | opcode: %b | out_data: %d", $time, in1, in2, opcode, out);
    #1 if(in1-in2 != out)$error("Subtract failed: %d - %d != %d", in1, in2, out);


    //verilator lint_on WIDTHEXPAND
    // Finish simulation
    #10;
    $finish;
end

endmodule
