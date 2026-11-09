`timescale 1ns / 1ps

module tb_ram_8x8;

    reg clk;
    reg write_en;
    reg [2:0] addr;
    reg [7:0] write_data;
    wire [7:0] read_data;

    // Instantiate RAM
    ram_8x8 uut (
        .clk(clk),
        .write_en(write_en),
        .addr(addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation (100MHz)
    always #5 clk = ~clk;

    integer i;

    initial begin
        clk = 0;
        write_en = 0;
        addr = 0;
        write_data = 8'h00;

        #10;

        // Write new data into RAM
        $display("\n--- Writing New Values ---");
        write_en = 1;
        for (i = 0; i < 8; i = i + 1) begin
            addr = i;
            write_data = (i + 1) * 8'h11;
            #10;
        end

        // Read updated contents
        write_en = 0;
        $display("\n--- Reading Updated RAM Contents ---");
        for (i = 0; i < 8; i = i + 1) begin
            addr = i;
            #10;
            $display("Addr %d: 0x%h", addr, read_data);
        end

        #20;
        $finish;
    end

endmodule




