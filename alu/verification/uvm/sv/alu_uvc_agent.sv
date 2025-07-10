`ifndef ALU_UVC_AGENT_SV
`define ALU_UVC_AGENT_SV

class alu_uvc_agent extends uvm_agent;
  `uvm_component_utils(alu_uvc_agent)
  uvm_analysis_port #(alu_uvc_sequence_item) analysis_port;

extern function new(string name, uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

alu_uvc_monitor m_monitor;
alu_uvc_driver m_driver;
alu_uvc_sequencer m_sequencer;
alu_uvc_config m_config;


endclass: alu_uvc_agent

function alu_uvc_agent::new(string name, uvm_component parent);
super.new(name,parent);
endfunction

function void alu_uvc_agent::build_phase(uvm_phase phase);

if(!uvm_config_db#(alu_uvc_config)::get(this,"","config",m_config))begin
 `uvm_fatal(get_name(),"Could not retrive alu_uvc_config from config db")
 end
 

 if(m_config.is_active== UVM_ACTIVE) begin
  //Si el agente es activo entonces se instancia
  m_sequencer = alu_uvc_sequencer::type_id::create("m_sequencer",this);
  m_driver = alu_uvc_driver::type_id::create("m_driver",this);

 end

 m_monitor = alu_uvc_monitor::type_id::create("m_monitor",this);
  analysis_port = new("analysis_port", this);

endfunction:build_phase


function void alu_uvc_agent::connect_phase(uvm_phase phase);
if(m_config.is_active==UVM_ACTIVE) begin
m_driver.seq_item_port.connect(m_sequencer.seq_item_export);
end
  m_monitor.analysis_port.connect(this.analysis_port);

endfunction:connect_phase

`endif  // ALU_UVC_AGENT_SV
