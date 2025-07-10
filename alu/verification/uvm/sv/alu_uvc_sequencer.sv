`ifndef ALU_UVC_SEQUENCER_SV
`define ALU_UVC_SEQUENCER_SV


class alu_uvc_sequencer extends uvm_sequencer #(alu_uvc_sequence_item);

  `uvm_component_utils(alu_uvc_sequencer)

  alu_uvc_config m_config;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);

endclass : alu_uvc_sequencer

function alu_uvc_sequencer::new(string name, uvm_component parent);
super.new(name,parent);
endfunction:new

function void alu_uvc_sequencer::build_phase(uvm_phase phase);

if(!uvm_config_db#(alu_uvc_config)::get(get_parent(),"","config",m_config))begin
    `uvm_fatal(get_name(), "Could not retrieve alu_uvc_config from config db")

end
endfunction:build_phase



`endif // ALU_UVC_SEQUENCER_SV
