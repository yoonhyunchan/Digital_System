module SingleCpu(CLK, RST, OUT);
    input CLK;
    input RST;
    reg [31:0] ADDR;
    wire [31:0] INST;
    output reg [31:0] OUT;

    Vr_inst_mem Vr_inst_mem1(.ADDR(ADDR), .INST(INST));


    always @(posedge CLK or RST) begin
        if (RST) ADDR = 0; else begin
        ADDR <= ADDR + 4'b0100;
        $display("%h", INST);
        end
    end

    always @(INST) begin 
        case (INST[6:0])
            7'b0110011:                 //R-Type
        endcase
        OUT = INST;
    end


endmodule