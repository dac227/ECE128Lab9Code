module rom_8x4 (
    input wire [2:0] addr,
    output reg [3:0] read_data
);

    // 8 memory locations, each 4 bits wide
    reg [3:0] memory [0:7];

    // Initialize ROM contents from an external file
    initial begin
        $readmemh("rom_init.mem", memory);
    end

    always @(*) begin
        read_data = memory[addr];
    end

endmodule
