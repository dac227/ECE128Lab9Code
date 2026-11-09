`timescale 1ns / 1ps

module tb_rom_8x4;

    reg [2:0] addr;
    wire [3:0] read_data;

    // Instantiate ROM
    rom_8x4 uut (
        .addr(addr),
        .read_data(read_data)
    );

    integer i;

    initial begin
        addr = 0;
        #10;

        $display("--- Reading ROM Contents (from file) ---");
        for (i = 0; i < 8; i = i + 1) begin
            addr = i;
            #10;
            $display("Address %d -> ROM Data: %b (0x%h)", addr, read_data, read_data);
        end

        #10;
        $finish;
    end

endmodule




