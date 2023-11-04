
`include "defines.vh"




//---------------------------------------------------------------------------
// DUT 
//---------------------------------------------------------------------------
module MyDesign (
    //---------------------------------------------------------------------------
    //System signals
    input wire reset_n,
    input wire clk,

    //---------------------------------------------------------------------------
    //Control signals
    input  wire dut_valid,
    output wire dut_ready,

    //---------------------------------------------------------------------------
    //q_state_input SRAM interface
    output wire                                               q_state_input_sram_write_enable,
    output wire [`Q_STATE_INPUT_SRAM_ADDRESS_UPPER_BOUND-1:0] q_state_input_sram_write_address,
    output wire [   `Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND-1:0] q_state_input_sram_write_data,
    output wire [`Q_STATE_INPUT_SRAM_ADDRESS_UPPER_BOUND-1:0] q_state_input_sram_read_address,
    input  wire [   `Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND-1:0] q_state_input_sram_read_data,

    //---------------------------------------------------------------------------
    //q_state_output SRAM interface
    output wire                                                q_state_output_sram_write_enable,
    output wire [`Q_STATE_OUTPUT_SRAM_ADDRESS_UPPER_BOUND-1:0] q_state_output_sram_write_address,
    output wire [   `Q_STATE_OUTPUT_SRAM_DATA_UPPER_BOUND-1:0] q_state_output_sram_write_data,
    output wire [`Q_STATE_OUTPUT_SRAM_ADDRESS_UPPER_BOUND-1:0] q_state_output_sram_read_address,
    input  wire [   `Q_STATE_OUTPUT_SRAM_DATA_UPPER_BOUND-1:0] q_state_output_sram_read_data,

    //---------------------------------------------------------------------------
    //scratchpad SRAM interface
    output wire                                            scratchpad_sram_write_enable,
    output wire [`SCRATCHPAD_SRAM_ADDRESS_UPPER_BOUND-1:0] scratchpad_sram_write_address,
    output wire [   `SCRATCHPAD_SRAM_DATA_UPPER_BOUND-1:0] scratchpad_sram_write_data,
    output wire [`SCRATCHPAD_SRAM_ADDRESS_UPPER_BOUND-1:0] scratchpad_sram_read_address,
    input  wire [   `SCRATCHPAD_SRAM_DATA_UPPER_BOUND-1:0] scratchpad_sram_read_data,

    //---------------------------------------------------------------------------
    //q_gates SRAM interface
    output wire                                         q_gates_sram_write_enable,
    output wire [`Q_GATES_SRAM_ADDRESS_UPPER_BOUND-1:0] q_gates_sram_write_address,
    output wire [   `Q_GATES_SRAM_DATA_UPPER_BOUND-1:0] q_gates_sram_write_data,
    output wire [`Q_GATES_SRAM_ADDRESS_UPPER_BOUND-1:0] q_gates_sram_read_address,
    input  wire [   `Q_GATES_SRAM_DATA_UPPER_BOUND-1:0] q_gates_sram_read_data
);

  assign q_gates_sram_write_enable = 0;

  localparam inst_sig_width = 52;
  localparam inst_exp_width = 11;
  localparam inst_ieee_compliance = 3;

  // datapath values
  reg [`Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND-1:0] QM;
  wire [2:0] Q;
  wire [(`Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND-1)/2:0] M;
  wire [4:0] Qshift;
  wire [15:0] Qshift_squared;
  wire [4:0] bitmask;
  reg [`Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND-1:0] q_gates_offset;
  reg [(`Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND-1)/2:0] MCounter;
  wire Addr_counter_done;
  wire [(inst_sig_width+inst_exp_width+1)*2-1:0] sum_calculation;
  wire addr_count_wraparound;
  reg rdscratch_wrinp;

  assign scratchpad_sram_write_data = sum_calculation;
  assign q_state_output_sram_write_data = sum_calculation;
  assign q_state_input_sram_write_data = sum_calculation;

  // control signals
  reg dut_ready_r;
  reg storeQM;
  reg clr_Addr_Count;
  reg load_MCounter;
  reg en_MCounter;
  reg en_q_gates_offset;
  reg clr_q_gates_offset;
  reg clr_sum_reg, clr_sum_reg1, clr_sum_reg2, clr_sum_reg3;
  reg clr_rdscratch_wrinp;
  reg en_rdscratch_wrinp;
  reg squash;


  // assigns
  assign dut_ready = dut_ready_r;
  assign Q = QM[`Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND-1:1 + (`Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND-1)/2];
  assign M = QM[(`Q_STATE_INPUT_SRAM_DATA_UPPER_BOUND/2)-1:0];
  assign Qshift = 1 << Q;
  assign Qshift_squared = Qshift << Q;
  assign bitmask = Qshift - 1;

  // controller
  localparam RESET = 0;
  localparam IDLE = 1;
  localparam INITIALIZE = 2;
  localparam CALCULATE_PARAMETERS = 3;
  localparam CALCULATE = 4;
  localparam WRITEBACK1 = 5;
  localparam WRITEBACK2 = 6;

  reg [3:0] state, nextState;
  always @(posedge clk) begin
    if (!reset_n) state = RESET;
    else state = nextState;
  end

  always @(*) begin
    dut_ready_r = 0;
    storeQM = 0;
    clr_Addr_Count = 1;
    load_MCounter = 0;
    en_MCounter = 0;
    en_q_gates_offset = 0;
    clr_q_gates_offset = 1;
    clr_sum_reg = 1;
    clr_rdscratch_wrinp = 1;
    en_rdscratch_wrinp = 0;
    squash = 1;
    case (state)
      RESET: begin
        nextState = IDLE;
      end
      IDLE: begin
        dut_ready_r = 1;
        if (dut_valid) nextState = INITIALIZE;
        else nextState = IDLE;
      end
      INITIALIZE: begin
        storeQM = 1;
        load_MCounter = 1;
        nextState = CALCULATE_PARAMETERS;
      end
      CALCULATE_PARAMETERS: begin
        load_MCounter = 1;
        nextState = CALCULATE;
      end
      CALCULATE: begin
        squash = 0;
        clr_sum_reg = addr_count_wraparound;
        clr_Addr_Count = 0;
        clr_q_gates_offset = 0;
        clr_rdscratch_wrinp = 0;
        if (Addr_counter_done) begin
          nextState = WRITEBACK1;
        end else nextState = CALCULATE;
      end
      WRITEBACK1: begin
        en_MCounter = 0;
        clr_q_gates_offset = 0;
        en_q_gates_offset = 0;
        clr_rdscratch_wrinp = 0;
        en_rdscratch_wrinp = 0;
        clr_Addr_Count = 1;
        nextState = WRITEBACK2;
      end
      WRITEBACK2: begin
        if (MCounter == 1) begin
          en_rdscratch_wrinp = 0;
          clr_Addr_Count = 0;
          en_MCounter = 0;
          nextState = RESET;
        end else begin
          en_MCounter = 1;
          clr_q_gates_offset = 0;
          en_q_gates_offset = 1;
          clr_rdscratch_wrinp = 0;
          en_rdscratch_wrinp = 1;
          clr_Addr_Count = 1;
          nextState = CALCULATE;
        end
      end
      default: nextState = RESET;
    endcase
  end
  // datapath
  always @(posedge clk)
    if (!reset_n) QM <= 0;
    else if (storeQM) QM <= q_state_input_sram_read_data;
    else QM <= QM;

  always @(posedge clk)
    if (!reset_n) MCounter <= 0;
    else if (load_MCounter) MCounter <= M;
    else if (en_MCounter) MCounter <= MCounter - 1;
    else MCounter <= MCounter;

  always @(posedge clk)
    if (!reset_n) q_gates_offset <= 0;
    else if (clr_q_gates_offset) q_gates_offset <= 0;
    else if (en_q_gates_offset) q_gates_offset <= q_gates_offset + Qshift_squared;
    else q_gates_offset <= q_gates_offset;

  always @(posedge clk)
    if (!reset_n) rdscratch_wrinp <= 0;
    else if (clr_rdscratch_wrinp) rdscratch_wrinp <= 0;
    else if (en_rdscratch_wrinp) rdscratch_wrinp <= !rdscratch_wrinp;
    else rdscratch_wrinp <= rdscratch_wrinp;



  wire [`Q_STATE_INPUT_SRAM_ADDRESS_UPPER_BOUND-1:0] q_input_addr, q_output_addr;
  assign q_state_input_sram_read_address = q_input_addr;
  assign scratchpad_sram_read_address = q_input_addr;
  assign q_state_output_sram_write_address = q_output_addr;
  assign scratchpad_sram_write_address = q_output_addr;
  Addr_Counter address_counter (
      .reset_n(reset_n),
      .clk(clk),
      .clr(clr_Addr_Count),
      .rdscratch_wrinp(rdscratch_wrinp),
      .max(Qshift_squared),
      .bitmask(bitmask),
      .q_gates_offset(q_gates_offset),
      .q_gates_addr(q_gates_sram_read_address),
      .q_input_addr(q_input_addr), // this will connect to q_input_states_rd_addr and q_sratchpad_rd_addr, will switch automatically
      .q_output_addr(q_output_addr), // this will connect to q_output_states_wr_addr and q_scratchpad_wr_addr
      .q_wr_input_addr(q_state_input_sram_write_address), // this will connect to q_input_states_wr_addr
      .done(Addr_counter_done),
      .q_input_wr_en(q_state_input_sram_write_enable),
      .q_scratch_wr_en(scratchpad_sram_write_enable),
      .q_output_wr_en(q_state_output_sram_write_enable),
      .wraparound(addr_count_wraparound)
  );

  always @(posedge clk)
    if (!reset_n) begin
      clr_sum_reg1 <= 0;
      clr_sum_reg2 <= 0;
      clr_sum_reg3 <= 0;
    end else begin
      clr_sum_reg1 <= clr_sum_reg;
      clr_sum_reg2 <= clr_sum_reg1;
      clr_sum_reg3 <= clr_sum_reg2;
    end

  reg enInput1, enInput2, enInput3;
  always @(posedge clk)
    if (!reset_n) begin
      enInput1 <= 0;
      enInput2 <= 0;
      enInput3 <= 0;
    end else begin
      if (state == CALCULATE) begin
        enInput1 <= 1;
        enInput2 <= enInput1;
        enInput3 <= enInput2;
      end else begin
        enInput1 <= 0;
        enInput2 <= 0;
        enInput3 <= 0;
      end
    end

  ArithmeticUnit ALU (
      .clk(clk),
      .reset_n(reset_n),
      .squash(0),//(squash),
      .inst_rnd(0),
      .enInput(enInput3),
      .A(rdscratch_wrinp ? scratchpad_sram_read_data : q_state_input_sram_read_data),
      .B(q_gates_sram_read_data),
      .prev(clr_sum_reg3 ? 0 : sum_calculation),
      .result(sum_calculation)
  );

endmodule


module DW_fp_mac_inst #(
    parameter inst_sig_width = 52,
    parameter inst_exp_width = 11,
    parameter inst_ieee_compliance = 3  // These need to be fixed to decrease error
) (
    input wire [inst_sig_width+inst_exp_width : 0] inst_a,
    input wire [inst_sig_width+inst_exp_width : 0] inst_b,
    input wire [inst_sig_width+inst_exp_width : 0] inst_c,
    input wire [2 : 0] inst_rnd,
    output wire [inst_sig_width+inst_exp_width : 0] z_inst,
    output wire [7 : 0] status_inst
);

  // Instance of DW_fp_mac
  DW_fp_mac #(inst_sig_width, inst_exp_width, inst_ieee_compliance) U1 (
      .a(inst_a),
      .b(inst_b),
      .c(inst_c),
      .rnd(inst_rnd),
      .z(z_inst),
      .status(status_inst)
  );

endmodule


module DW_fp_mult_inst #(
    parameter inst_sig_width = 52,
    parameter inst_exp_width = 11,
    parameter inst_ieee_compliance = 3  // These need to be fixed to decrease error
) (
    input wire [inst_sig_width+inst_exp_width : 0] inst_a,
    input wire [inst_sig_width+inst_exp_width : 0] inst_b,
    input wire [2 : 0] inst_rnd,
    output wire [inst_sig_width+inst_exp_width : 0] z_inst,
    output wire [7 : 0] status_inst
);

  // Instance of DW_fp_mult
  DW_fp_mult #(inst_sig_width, inst_exp_width, inst_ieee_compliance) U1 (
      .a(inst_a),
      .b(inst_b),
      .rnd(inst_rnd),
      .z(z_inst),
      .status(status_inst)
  );

endmodule

module DW_fp_add_inst #(
    parameter inst_sig_width = 52,
    parameter inst_exp_width = 11,
    parameter inst_ieee_compliance = 3  // These need to be fixed to decrease error
) (
    input wire [inst_sig_width+inst_exp_width : 0] inst_a,
    input wire [inst_sig_width+inst_exp_width : 0] inst_b,
    input wire [2 : 0] inst_rnd,
    output wire [inst_sig_width+inst_exp_width : 0] z_inst,
    output wire [7 : 0] status_inst
);

  // Instance of DW_fp_add
  DW_fp_add #(inst_sig_width, inst_exp_width, inst_ieee_compliance) U1 (
      .a(inst_a),
      .b(inst_b),
      .rnd(inst_rnd),
      .z(z_inst),
      .status(status_inst)
  );

endmodule


module ArithmeticUnit #(
    parameter inst_sig_width = 52,
    parameter inst_exp_width = 11,
    parameter inst_ieee_compliance = 3
) (
    input wire clk,
    input wire reset_n,
    input wire squash,
    input wire [2:0] inst_rnd,

    input wire enInput,
    input wire [(inst_sig_width+inst_exp_width+1)*2-1 : 0] A,
    input wire [(inst_sig_width+inst_exp_width+1)*2-1 : 0] B,
    input wire [(inst_sig_width+inst_exp_width+1)*2-1 : 0] prev,

    output wire [(inst_sig_width+inst_exp_width+1)*2-1 : 0] result
);

  wire [inst_sig_width+inst_exp_width : 0] Areal, Aimag, Breal, Bimag, prevreal, previmag;
  assign Areal = enInput ? A[(inst_sig_width+inst_exp_width+1)*2-1:inst_sig_width+inst_exp_width+1] : 0;
  assign Aimag = enInput ? A[inst_sig_width+inst_exp_width:0] : 0;
  assign Breal = enInput ? B[(inst_sig_width+inst_exp_width+1)*2-1:inst_sig_width+inst_exp_width+1] : 0;
  assign Bimag = enInput ? B[inst_sig_width+inst_exp_width:0] : 0;
  assign prevreal = prev[(inst_sig_width+inst_exp_width+1)*2-1:inst_sig_width+inst_exp_width+1];
  assign previmag = prev[inst_sig_width+inst_exp_width:0];

  // pipeline stage 1
  wire [inst_sig_width+inst_exp_width : 0] term1_d;
  reg [inst_sig_width+inst_exp_width : 0] term1_q;
  wire [7 : 0] status_term1;
  wire [inst_sig_width+inst_exp_width : 0] term2;
  reg [inst_sig_width+inst_exp_width : 0] term2negative_q;
  wire [inst_sig_width+inst_exp_width : 0] term2negative_d;
  assign term2negative_d = {
    ~term2[inst_sig_width+inst_exp_width], term2[inst_sig_width+inst_exp_width-1 : 0]
  };
  wire [7 : 0] status_term2;
  wire [inst_sig_width+inst_exp_width : 0] term3_d;
  reg [inst_sig_width+inst_exp_width : 0] term3_q;
  wire [7 : 0] status_term3;
  wire [inst_sig_width+inst_exp_width : 0] term4_d;
  reg [inst_sig_width+inst_exp_width : 0] term4_q;
  wire [7 : 0] status_term4;
  always @(posedge clk) begin
    if (!reset_n || squash) begin
      term1_q <= 0;
      term2negative_q <= 0;
      term3_q <= 0;
      term4_q <= 0;
    end else begin
      term1_q <= term1_d;
      term2negative_q <= term2negative_d;
      term3_q <= term3_d;
      term4_q <= term4_d;
    end
  end

  // pipeline stage 2
  wire [inst_sig_width+inst_exp_width : 0] sumreal_d;
  reg [inst_sig_width+inst_exp_width : 0] sumreal_q;
  wire [7 : 0] status_sumreal;
  wire [inst_sig_width+inst_exp_width : 0] sumimag_d;
  reg [inst_sig_width+inst_exp_width : 0] sumimag_q;
  wire [7 : 0] status_sumimag;
  always @(posedge clk) begin
    if (!reset_n || squash) begin
      sumreal_q <= 0;
      sumimag_q <= 0;
    end else begin
      sumreal_q <= sumreal_d;
      sumimag_q <= sumimag_d;
    end
  end

  // pipeline stage 3
  wire [inst_sig_width+inst_exp_width : 0] resultreal_d;
  reg [inst_sig_width+inst_exp_width : 0] resultreal_q;
  wire [7 : 0] status_resultreal;
  wire [inst_sig_width+inst_exp_width : 0] resultimag_d;
  reg [inst_sig_width+inst_exp_width : 0] resultimag_q;
  wire [7 : 0] status_resultimag;
  always @(posedge clk) begin
    if (!reset_n || squash) begin
      resultreal_q <= 0;
      resultimag_q <= 0;
    end else begin
      resultreal_q <= resultreal_d;
      resultimag_q <= resultimag_d;
    end
  end

  assign result = {resultreal_q, resultimag_q};


  // This is test stub for passing input/outputs to a DP_fp_mac, there many
  // more DW macros that you can choose to use
  DW_fp_mult_inst FP_MULT_TERM1 (
      Areal,
      Breal,
      inst_rnd,
      term1_d,
      status_term1
  );
  DW_fp_mult_inst FP_MULT_TERM2 (
      Aimag,
      Bimag,
      inst_rnd,
      term2,
      status_term2
  );
  DW_fp_mult_inst FP_MULT_TERM3 (
      Areal,
      Bimag,
      inst_rnd,
      term3_d,
      status_term3
  );
  DW_fp_mult_inst FP_MULT_TERM4 (
      Aimag,
      Breal,
      inst_rnd,
      term4_d,
      status_term4
  );

  DW_fp_add_inst FP_ADD_SUMREAL (
      term1_q,
      term2negative_q,
      inst_rnd,
      sumreal_d,
      status_sumreal
  );
  DW_fp_add_inst FP_ADD_SUMIMAG (
      term3_q,
      term4_q,
      inst_rnd,
      sumimag_d,
      status_sumimag
  );

  DW_fp_add_inst FP_ADD_RESULTREAL (
      sumreal_q,
      prevreal,
      inst_rnd,
      resultreal_d,
      status_resultreal
  );
  DW_fp_add_inst FP_ADD_RESULTIMAG (
      sumimag_q,
      previmag,
      inst_rnd,
      resultimag_d,
      status_resultimag
  );


endmodule







// module Addr_Counter #(
//     parameter ADDR_WIDTH = `Q_STATE_INPUT_SRAM_ADDRESS_UPPER_BOUND,
//     parameter WIDTH = 16
// ) (
//     input wire reset_n,
//     input wire clk,
//     input wire clr,
//     input wire rdscratch_wrinp,

//     input wire [WIDTH-1:0] max,
//     input wire [3:0] bitmask,
//     input wire [WIDTH-1:0] q_gates_offset,

//     output reg [ADDR_WIDTH-1:0] q_gates_addr,
//     output reg [ADDR_WIDTH-1:0] q_input_addr, // this will connect to q_input_states_rd_addr and q_sratchpad_rd_addr, will switch automatically
//     output reg [ADDR_WIDTH-1:0] q_output_addr, // this will connect to q_output_states_wr_addr and q_scratchpad_wr_addr
//     output reg [ADDR_WIDTH-1:0] q_wr_input_addr,  // this will connect to q_input_states_wr_addr

//     output reg done,
//     output reg q_input_wr_en,
//     output reg q_scratch_wr_en,
//     output reg q_output_wr_en,
//     output reg wraparound
// );
//   reg inProgress;
//   reg [ADDR_WIDTH-1:0] Qcounter;
//   wire isMax;
//   wire [WIDTH-1:0] QcounterMasked;
//   assign isMax = Qcounter == max - 1;
//   assign QcounterMasked = Qcounter & bitmask;

//   always @(posedge clk) begin
//     if (!reset_n) wraparound = 0;
//     else wraparound = QcounterMasked == 0;
//   end

//   always @(posedge clk) begin
//     if (!reset_n) Qcounter <= 0;
//     else begin
//       if (clr) Qcounter <= 0;
//       else if (isMax) Qcounter <= Qcounter;
//       else Qcounter <= Qcounter + 1;
//     end
//   end

//   always @(posedge clk)
//     if (!reset_n) inProgress <= 0;
//     else begin
//       if (!clr) begin
//         if (isMax) inProgress <= inProgress;
//         else inProgress <= 1;
//       end else inProgress <= 0;
//     end

//   reg q_input_wr_en_r;
//   reg q_scratch_wr_en_r;
//   always @(posedge clk) begin
//     if (!reset_n) begin
//       q_input_wr_en <= 0;
//       q_scratch_wr_en <= 0;
//       q_output_wr_en <= 0;
//       q_input_wr_en_r <= 0;
//       q_scratch_wr_en_r <= 0;
//     end else begin
//       if (!clr) begin
//         q_input_wr_en_r <= rdscratch_wrinp;
//         q_scratch_wr_en_r <= !rdscratch_wrinp;
//         q_input_wr_en <= q_input_wr_en_r;
//         q_scratch_wr_en <= q_scratch_wr_en_r;
//         q_output_wr_en <= q_input_wr_en_r | q_scratch_wr_en_r;
//       end else begin
//         q_input_wr_en <= 0;
//         q_scratch_wr_en <= 0;
//         q_output_wr_en <= 0;
//         q_input_wr_en_r <= 0;
//         q_scratch_wr_en_r <= 0;
//       end
//     end
//   end

//   reg done1, done2, done3;
//   always @(posedge clk)
//     if (!reset_n) begin
//       done1 <= 0;
//       done2 <= 0;
//       done3 <= 0;
//       done  <= 0;
//     end else begin
//       done1 <= clr ? 0 : isMax;
//       done2 <= clr ? 0 : done1;
//       done3 <= clr ? 0 : done2;
//       done  <= clr ? 0 : done3;
//     end
//   always @(posedge clk)
//     if (!reset_n) q_gates_addr <= 0;
//     else q_gates_addr <= clr ? 0 : (Qcounter + q_gates_offset);

//   always @(posedge clk)
//     if (!reset_n) q_input_addr <= 0;
//     else q_input_addr <= clr ? 0 : (QcounterMasked + !rdscratch_wrinp);

//   reg [ADDR_WIDTH-1:0] q_output_addr_r;
//   always @(posedge clk)
//     if (!reset_n) q_output_addr_r <= 0;
//     else if (clr) q_output_addr_r <= 0;
//     else if (isMax) q_output_addr_r <= q_output_addr_r;
//     else q_output_addr_r <= QcounterMasked == 0 ? q_output_addr_r + 1 : q_output_addr_r;

//   reg [ADDR_WIDTH-1:0] q_output_addr1, q_output_addr2, q_output_addr3;
//   reg [ADDR_WIDTH-1:0] q_wr_input_addr1, q_wr_input_addr2, q_wr_input_addr3;

//   reg [ADDR_WIDTH-1:0] q_output_addr_minus_one;
//   always @(q_output_addr_r) q_output_addr_minus_one = q_output_addr_r - 1;
//   always @(posedge clk)
//     if (!reset_n) begin
//       {q_output_addr, q_wr_input_addr}   <= 0;
//       {q_output_addr1, q_wr_input_addr1} <= 0;
//       {q_output_addr2, q_wr_input_addr2} <= 0;
//       {q_output_addr3, q_wr_input_addr3} <= 0;
//     end else if (clr) begin
//       {q_output_addr, q_wr_input_addr}   <= 0;
//       {q_output_addr1, q_wr_input_addr1} <= 0;
//       {q_output_addr2, q_wr_input_addr2} <= 0;
//       {q_output_addr3, q_wr_input_addr3} <= 0;
//     end else begin
//       q_output_addr1 <= q_output_addr_minus_one;
//       q_wr_input_addr1 <= q_output_addr_minus_one + 1;
//       q_output_addr2 <= q_output_addr1;
//       q_wr_input_addr2 <= q_wr_input_addr1;
//       q_output_addr3 <= q_output_addr2;
//       q_wr_input_addr3 <= q_wr_input_addr2;
//       q_output_addr <= q_output_addr3;
//       q_wr_input_addr <= q_wr_input_addr3;
//     end
// endmodule


module Addr_Counter #(
    parameter ADDR_WIDTH = `Q_STATE_INPUT_SRAM_ADDRESS_UPPER_BOUND,
    parameter WIDTH = 16
) (
    input wire reset_n,
    input wire clk,
    input wire clr,
    input wire rdscratch_wrinp,

    input wire [WIDTH-1:0] max,
    input wire [3:0] bitmask,
    input wire [WIDTH-1:0] q_gates_offset,

    output reg [ADDR_WIDTH-1:0] q_gates_addr,
    output reg [ADDR_WIDTH-1:0] q_input_addr, // this will connect to q_input_states_rd_addr and q_sratchpad_rd_addr, will switch automatically
    output reg [ADDR_WIDTH-1:0] q_output_addr, // this will connect to q_output_states_wr_addr and q_scratchpad_wr_addr
    output reg [ADDR_WIDTH-1:0] q_wr_input_addr,  // this will connect to q_input_states_wr_addr

    output reg done,
    output reg q_input_wr_en,
    output reg q_scratch_wr_en,
    output reg q_output_wr_en,
    output reg wraparound
);
  reg [ADDR_WIDTH-1:0] Qcounter;
  wire isMax;
  wire [WIDTH:0] QcounterMasked;
  assign isMax = Qcounter == max - 1;
  assign QcounterMasked = Qcounter & bitmask;

  always @(posedge clk) begin
    if (!reset_n) wraparound = 0;
    else wraparound = QcounterMasked == 0;
  end

  always @(posedge clk) begin
    if (!reset_n) Qcounter <= 0;
    else begin
      if (clr) Qcounter <= 0;
      else if (isMax) Qcounter <= Qcounter;
      else Qcounter <= Qcounter + 1;
    end
  end

  always @(posedge clk)
    if (!reset_n) q_gates_addr <= 0;
    else q_gates_addr <= clr ? 0 : (Qcounter + q_gates_offset);

  always @(posedge clk)
    if (!reset_n) q_input_addr <= 0;
    else q_input_addr <= clr ? 0 : (QcounterMasked + !rdscratch_wrinp);

  wire output_counter_control;
  assign output_counter_control = QcounterMasked==4;
  always @(posedge clk)
    if (!reset_n) begin
      q_output_addr <= 0;
      q_wr_input_addr <= 0;
    end else if(clr) begin
      q_output_addr <= 0;
      q_wr_input_addr <= 0;
    end else if(isMax) begin
      q_output_addr <= q_output_addr;
      q_wr_input_addr <= q_wr_input_addr;
    end else if (output_counter_control) begin
      q_output_addr <= q_wr_input_addr; // or assign q_output_addr = q_wr_input_addr - 1
      q_wr_input_addr <= q_wr_input_addr + 1;
    end else begin
      q_output_addr <= q_output_addr;
      q_wr_input_addr <= q_wr_input_addr;
    end

  always @(posedge clk)
    if(!reset_n) begin
      q_input_wr_en <= 0;
      q_scratch_wr_en <= 0;
      q_output_wr_en <= 0;
    end else if (clr) begin
      q_input_wr_en <= 0;
      q_scratch_wr_en <= 0;
      q_output_wr_en <= 0;
    end else if (output_counter_control) begin
      q_input_wr_en <= rdscratch_wrinp;
      q_scratch_wr_en <= !rdscratch_wrinp;
      q_output_wr_en <= 1;
    end else begin
      q_input_wr_en <= q_input_wr_en;
      q_scratch_wr_en <= q_scratch_wr_en;
      q_output_wr_en <= q_output_wr_en;
    end

    reg done1,done2,done3;
    always @(posedge clk) begin 
      if(!reset_n) begin
        done <= 0;
        done1 <= 0;
        done2 <= 0;
        done3 <= 0;
      end else if (clr) begin
        done <= 0;
        done1 <= 0;
        done2 <= 0;
        done3 <= 0;
      end else begin
        done <= done3;
        done1 <= isMax;
        done2 <= done1;
        done3 <= done2;
      end
    end


endmodule

