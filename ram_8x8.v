module ram_8x8 (
    input wire clk,
    input wire write_en,
    input wire [2:0] addr,
    input wire [7:0] write_data,
    output reg [7:0] read_data
);

    // 8 memory locations, each 8 bits wide
    reg [7:0] memory [0:7];

    // Initialize memory contents from an external file
    initial begin
        $readmemh("ram_init.mem", memory);
    end

    always @(posedge clk) begin
        if (write_en) begin
            memory[addr] <= write_data;
        end
        read_data <= memory[addr];
    end

endmodule




