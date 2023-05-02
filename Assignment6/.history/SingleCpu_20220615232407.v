module SingleCpu(CLK, RST, OUT);
    input CLK;
    input RST;
    reg [31:0] ADDR;
    wire [31:0] INST;
    output reg [31:0] OUT;
    parameter Rtype = 7'b0110011;

    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));


    always @(posedge CLK or RST) begin
        if (RST) ADDR = 0; else begin
        ADDR <= ADDR + 4'b0100;
        $display("%b", INST);
        end
    end

    always @(INST) begin 
        if(INST[6:0] == 7'b0110011) // R-type
            case(INST[14:12])
            3'b000: $display("add");
            3'b001: $display("add");
            3'b010: $display("add");
            3'b011: $display("add");
            3'b100: $display("add");
            3'b101: $display("add");
            3'b110: $display("add");
            3'b111: $display("add");
            endcase

        
        OUT = INST;
    end


endmodule