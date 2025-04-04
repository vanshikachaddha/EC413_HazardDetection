module hazardunit (
    input [4:0] IFID_RS,
    input [4:0] IFID_RT,
    input [4:0] EXMEM_Dest,
    input [4:0] IDEX_Dest,
    input       IDEX_MemRead,
    input       IDEX_RegWrite,
    input       EXMEM_RegWrite,
    input [5:0] Op, 

    output reg  IFIDWrite,
    output reg  PCWrite,
    output reg  HazardMux
);
// CHECK1: One-ahead hazard from EX stage
    wire CHECK1;
    assign CHECK1 = (IDEX_RegWrite && !IDEX_MemRead) && ((Op == 6'b0 && IDEX_Dest != 0 && ((IFID_RS == IDEX_Dest) || (IFID_RT == IDEX_Dest))) || (Op != 6'b0 && IDEX_Dest != 0 && (IFID_RS == IDEX_Dest)));
    
    // CHECK2: Two-ahead hazard from MEM stage
    wire CHECK2;
    assign CHECK2 = (!IDEX_MemRead) && ((Op == 6'b0 && EXMEM_Dest != 0) && ((IFID_RS == EXMEM_Dest) || (IFID_RT == EXMEM_Dest))) || ((Op != 6'b0 && EXMEM_Dest != 0) && (IFID_RS == EXMEM_Dest));
    
    // CHECK3: Load-use hazard from lw in EX stage
    wire CHECK3;
    assign CHECK3 = IDEX_MemRead && (IDEX_Dest != 0) && ((IFID_RS == IDEX_Dest) || (IFID_RT == IDEX_Dest));

    // Combine all hazard conditions.
    wire DOIT;
    assign DOIT = CHECK2 || CHECK1 || CHECK3;

    always @(*) begin
        if (DOIT) begin
            IFIDWrite = 0;
            PCWrite   = 0;
            HazardMux = 1;
        end else begin
            IFIDWrite = 1;
            PCWrite   = 1;
            HazardMux = 0; // No hazard detected.
        end
    end
endmodule