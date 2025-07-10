`ifndef ALU_UVC_IF_SV
`define ALU_UVC_IF_SV

interface alu_uvc_if (input logic clk_i);



 logic [7:0] A_i;
 logic [7:0] B_i;
 logic [3:0] opcode_i;
 logic m_i;
 logic cn_i;
 logic l_i;
 logic h_i;

 logic [7:0] R_o;



//INICIALIZAR VALORES
initial begin

A_i = 0;
B_i = 0;
opcode_i = 0;
m_i = 0;
cn_i = 0;
l_i = 0;
h_i = 0;


end


clocking cb_drv @(posedge clk_i);
    default input #1ns output #1ns;
    output A_i;
output B_i;
output opcode_i;
output m_i;
output cn_i;
output l_i;
output h_i;


  endclocking : cb_drv

  clocking cb_mon @(posedge clk_i);
    default input #1ns output #1ns;

    input R_o;


  endclocking : cb_mon


endinterface: alu_uvc_if

`endif // ALU_UVC_IF_SV
