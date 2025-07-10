`ifndef ALU_UVC_DRIVER_SV
`define ALU_UVC_DRIVER_SV

class alu_uvc_driver extends uvm_driver #(alu_uvc_sequence_item);

  `uvm_component_utils(alu_uvc_driver)

  virtual alu_uvc_if vif;
  alu_uvc_config     m_config;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task do_drive();

endclass : alu_uvc_driver


function alu_uvc_driver::new(string name, uvm_component parent);
super.new(name,parent);
endfunction:new

function void alu_uvc_driver::build_phase(uvm_phase phase);
  if (!uvm_config_db#(virtual alu_uvc_if)::get(get_parent(), "", "vif", vif)) begin
    `uvm_fatal(get_name(), "Could not retrieve alu_uvc_if from VIF db")
  end

if (!uvm_config_db#(alu_uvc_config)::get(get_parent(), "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve alu_uvc_config from config db")
  end

endfunction:build_phase

task alu_uvc_driver::run_phase(uvm_phase phase);
forever begin
    //Lo que hace este run, por siempre, agarra el drive, agarra una transaction del sequencer
     seq_item_port.get_next_item(req);
     do_drive();
     seq_item_port.item_done();

end
endtask: run_phase

task alu_uvc_driver::do_drive();

  `uvm_info(get_type_name(), {"\n ------ DRIVER (alu UVC) ------", req.convert2string()}, UVM_DEBUG)

endtask: do_drive



`endif // ALU_UVC_DRIVER_SV
