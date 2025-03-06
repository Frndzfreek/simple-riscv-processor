module instruction_memory (
    input [3:0] pc,           // Program counter
    output reg [11:0] instr   // Instruction output
);
    reg [11:0] mem [0:15];    // 16 locations, 12-bit instructions
    
    initial begin
        // Sample program:
        mem[0] = 12'b000100100000; // ADD r1 = r0 + r2 (2 + 3 = 5)
        mem[1] = 12'b001000010001; // SUB r2 = r1 - r0 (5 - 2 = 3)
        mem[2] = 12'b001100100000; // ADD r3 = r2 + r1 (3 + 5 = 8, truncated to 0)
        mem[3] = 12'b000000000000; // NOP (end)
    end
    
    always @(*) begin
        instr = mem[pc];
    end
endmodule
