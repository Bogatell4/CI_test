module multiplier_tb;
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

    $dumpfile("waveform_multiplier.vcd"); // Specifies the VCD file name
    $dumpvars(0, tb);          // Dumps all variables in the testbench

    $strobe("Time: %0t | in1: %d | in2: %d | opcode: %b | out_data: %d", $time, in1, in2, opcode, out);



    in1 = 4'b0000;
    in2 = 4'b0000;
    opcode = 2'b00;


    #10 in1 = 4'd2; in2 = 4'd3; opcode = 2'b10; // Test multiplication
    $strobe("Time: %0t | in1: %d | in2: %d | opcode: %b | out_data: %d", $time, in1, in2, opcode, out);
    #1 if(in1*in2 != out)$error("Multiplier failed: %d * %d != %d", in1, in2, out);
        
        //verilator lint_off WIDTHEXPAND
    
    #10 in1 = 4'd6; in2 = 4'd3; opcode = 2'b11; // Test division
    $strobe("Time: %0t | in1: %d | in2: %d | opcode: %b | out_data: %d", $time, in1, in2, opcode, out);
    #1 if(in1/in2 != out)$error("Division failed: %d / %d != %d", in1, in2, out);

        //verilator lint_on WIDTHEXPAND

    // Finish simulation
    #10;
    $finish;
end

endmodule
