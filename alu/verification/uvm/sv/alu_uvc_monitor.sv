`ifndef ALU_UVC_MONITOR_SV
`define ALU_UVC_MONITOR_SV

class alu_uvc_monitor extends uvm_monitor;

  `uvm_component_utils(alu_uvc_monitor)

  uvm_analysis_port #(alu_uvc_sequence_item)       analysis_port;

  virtual alu_uvc_if                               vif;
  alu_uvc_config                                   m_config;
  alu_uvc_sequence_item                            m_trans;

  //VARIABLES AUXILIARES PARA LAS SALIDAS




  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task do_mon();

endclass : alu_uvc_monitor


function alu_uvc_monitor::new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new

function void alu_uvc_monitor::build_phase(uvm_phase phase);
  if (!uvm_config_db#(virtual alu_uvc_if)::get(get_parent(), "", "vif", vif)) begin
    `uvm_fatal(get_name(), "Could not retrieve alu_uvc_if from alu db")
  end

  if (!uvm_config_db#(alu_uvc_config)::get(get_parent(), "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve alu_uvc_config from config db")
  end

  analysis_port = new("analysis_port", this);

endfunction : build_phase

task alu_uvc_monitor::run_phase(uvm_phase phase);
  m_trans = alu_uvc_sequence_item::type_id::create("m_trans");
 // do_mon();
endtask : run_phase

task alu_uvc_monitor::do_mon();


  forever begin
 
      `uvm_info(get_type_name(), {"\n ------ MONITOR (GPIO UVC) ------ ", m_trans.convert2string()
                }, UVM_DEBUG)
      //manda la transaction hacia el siguiente componente
      analysis_port.write(m_trans);

    

  end
endtask : do_mon

`endif  // ALU_UVC_MONITOR_SV
