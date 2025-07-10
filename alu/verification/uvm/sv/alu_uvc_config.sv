`ifndef ALU_UVC_CONFIG_SV
`define ALU_UVC_CONFIG_SV

class alu_uvc_config extends uvm_object;

  `uvm_object_utils(alu_uvc_config)

  uvm_active_passive_enum is_active   = UVM_ACTIVE;

  extern function new(string name = "");

endclass : alu_uvc_config


function alu_uvc_config::new(string name = "");
  super.new(name);
endfunction : new


`endif // ALU_UVC_CONFIG_SV
