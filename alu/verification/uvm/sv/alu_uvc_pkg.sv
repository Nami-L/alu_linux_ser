`ifndef ALU_UVC_PKG_SV
`define ALU_UVC_PKG_SV

package alu_uvc_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  `include "alu_uvc_sequence_item.sv"  // Este es de mayor jerarquía
  `include "alu_uvc_config.sv"
  `include "alu_uvc_sequencer.sv"
  `include "alu_uvc_driver.sv"
  `include "alu_uvc_monitor.sv"

  `include "alu_uvc_agent.sv"

  // Sequence library
  `include "alu_uvc_sequence_base.sv"

endpackage : alu_uvc_pkg

`endif  // ALU_UVC_PKG_SV
