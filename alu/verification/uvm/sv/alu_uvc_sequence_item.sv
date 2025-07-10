`ifndef ALU_UVC_SEQUENCE_ITEM_SV
`define ALU_UVC_SEQUENCE_ITEM_SV

class alu_uvc_sequence_item extends uvm_sequence_item;

  `uvm_object_utils(alu_uvc_sequence_item)

  // Transaction variables

 rand logic [7:0] A_i;
rand logic [7:0] B_i;
rand logic [3:0] opcode_i;
rand logic m_i;
rand logic cn_i;
rand logic l_i;
rand logic h_i;


  // Readout variables

  logic [7:0] R_o;


  extern function new(string name = "");

  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function string convert2string();

endclass : alu_uvc_sequence_item

function alu_uvc_sequence_item::new(string name = "");
  super.new(name);
endfunction : new

function void alu_uvc_sequence_item::do_copy(uvm_object rhs);
  // Cuando creo un objeto es un lugar de memoria y si quiero copiarlo necesito
  //agregar memoria

  //Al momento de mandar la transaction es un objeto necesito la copia de ese objeto
  alu_uvc_sequence_item rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);


endfunction : do_copy

function bit alu_uvc_sequence_item::do_compare(uvm_object rhs, uvm_comparer comparer);

  bit result;
  alu_uvc_sequence_item rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal(get_type_name(), "Cast of rhs object failed")

  result = super.do_compare(rhs, comparer);

  return result;


endfunction : do_compare

function void alu_uvc_sequence_item::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0) `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else printer.m_string = convert2string();
endfunction : do_print

function string alu_uvc_sequence_item::convert2string();
  string s;
  s = super.convert2string();
  $sformat(s, {s, "\n", "TRANSACTION INFORMATION (alu UVC):"});
  $sformat(s, {s, "\n", "SEQUENCE ITEM"});
  return s;
endfunction : convert2string



`endif  // ALU_UVC_SEQUENCE_ITEM_SV
