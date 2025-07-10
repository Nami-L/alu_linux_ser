module tb;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  
  import top_test_pkg::*;

 // Clock signal
  localparam time CLK_PERIOD = 20ns;
  logic clk_i = 0;
  always #(CLK_PERIOD / 2) clk_i = ~clk_i;
  
  // Reset signal
  logic rst_i = 1;
  initial begin
    repeat(2) @(posedge clk_i);
    rst_i = 1;
    @(posedge clk_i);
    rst_i = 0;
  end
  

//Interface

alu_uvc_if alu_vif(clk_i);

alu dut(
.A_i(alu_vif.A_i),
.B_i(alu_vif.B_i),
.opcode_i(alu_vif.opcode_i),
.m_i(alu_vif.m_i),
.cn_i(alu_vif.cn_i),
.l_i(alu_vif.l_i),
.h_i(alu_vif.h_i),
.R_o(alu_vif.R_o)

);


  initial begin
    $timeformat(-9, 0, " ns", 10);
    uvm_config_db#(virtual alu_uvc_if)::set(null, "uvm_test_top.m_env.m_alu_agent", "vif", alu_vif);
    run_test();
    $fsdbDumpvars;                // Synopsys VCS

  end

  
endmodule:tb