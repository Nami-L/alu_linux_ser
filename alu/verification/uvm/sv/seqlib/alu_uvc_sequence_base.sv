`ifndef ALU_UVC_SEQUENCE_BASE_SV
`define ALU_UVC_SEQUENCE_BASE_SV

class alu_uvc_sequence_base extends uvm_sequence #(alu_uvc_sequence_item);
  `uvm_object_utils(alu_uvc_sequence_base)

  rand alu_uvc_sequence_item m_trans;


  extern function new(string name = "");

  extern virtual task body();

endclass: alu_uvc_sequence_base

function alu_uvc_sequence_base::new(string name ="");
super.new(name);
m_trans = alu_uvc_sequence_item::type_id::create("m_trans");
endfunction:new



task alu_uvc_sequence_base::body();
  start_item(m_trans);
  finish_item(m_trans);
endtask : body

`endif  // ALU_UVC_SEQUENCE_BASE_SV
