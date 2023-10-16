
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
    output reg  dut_ready,

    //---------------------------------------------------------------------------
    //q_state_output SRAM interface
    output wire        sram_write_enable,
    output wire [15:0] sram_write_address,
    output wire [31:0] sram_write_data,
    output wire [15:0] sram_read_address,
    input  wire [31:0] sram_read_data

);

  //---------------------------------------------------------------------------
  //q_state_output SRAM interface
  reg         sram_write_enable_r;
  // reg       [31:0] sram_write_data_r;
  reg  [15:0] sram_address;
  reg         compute_complete;
  reg  [31:0] addr_count;
  reg  [ 1:0] load_count;
  reg  [ 1:0] start_addr_count;
  reg         start_accum;


  wire [31:0] sum_calculation;
  reg  [31:0] sum;
  // reg  [31:0] in;
  wire [ 7:0] status;

  assign sram_write_address = sram_address;
  assign sram_read_address = sram_address;
  assign sram_write_enable = sram_write_enable_r;
  assign sram_write_data = sum_calculation;

  // This is test sub for the DW_fp_add, do not change any of the inputs to the
  // param list for the DW_fp_add, you will only need one DW_fp_add

  // synopsys translate_off
  shortreal test_val;
  assign test_val = $bitstoshortreal(sum);
  // This is a helper val for seeing the 32bit flaot value, you can repicate 
  // this for any signal, but keep it between the translate_off and
  // translate_on 
  // synopsys translate_on


  // control
  localparam RESET = 0;
  localparam IDLE = 1;
  localparam INITIALIZE_COUNT = 2;
  localparam ACCUMULATE = 3;
  
  reg [1:0] state, nextState;

  always @(posedge clk) begin
    if (!reset_n) state <= RESET;
    else state <= nextState;
  end


  always @(*) begin
    start_accum = 0;
    start_addr_count = 0;
    load_count = 2;
    dut_ready = 1;
    sram_write_enable_r = 0;
    case (state)
      IDLE: begin
        if (dut_valid) begin
          sram_write_enable_r = 0;
          start_addr_count = 1;
          nextState = INITIALIZE_COUNT;
        end else begin
          nextState = IDLE;
        end
      end
      INITIALIZE_COUNT: begin
        nextState = ACCUMULATE;
        load_count = 1;
        start_addr_count = 1;
        sram_write_enable_r = 0;
        dut_ready = 0;
      end
      ACCUMULATE: begin
        load_count = 0;
        start_accum = 1;
        sram_write_enable_r = 0;
        start_addr_count = 1;
        dut_ready = 0;
        if (addr_count == 0) nextState = RESET;
        else if (addr_count == 1) begin
          start_addr_count = 0;
          sram_write_enable_r = 1;
          nextState = RESET;
        end else begin
          nextState = ACCUMULATE;
        end
      end
      RESET: begin
        dut_ready = 0;
        nextState = IDLE;
      end
      default: nextState = RESET;
    endcase
  end


  // datapath

  always @(posedge clk) begin
    if (!reset_n) addr_count <= 0;
    else begin
      if (load_count == 0) addr_count <= addr_count - 1;
      else if (load_count == 1) addr_count <= sram_read_data;
      else if (load_count == 2) addr_count <= addr_count;
    end
  end


  always @(posedge clk) begin
    if (!reset_n) sram_address <= 0;
    else begin
      if (start_addr_count == 0) sram_address <= 0;
      else if (start_addr_count == 1) sram_address <= sram_address + 1;
      else if (start_addr_count == 2) sram_address <= sram_address;
    end
  end

  always @(posedge clk) begin
    if (!reset_n) sum <= 32'b0;
    else begin
      sum <= start_accum ? sum_calculation : 0;
    end
  end

  DW_fp_add #(
      .sig_width      (23),
      .exp_width      (8),
      .ieee_compliance(3)
  ) fp_add_mod (
      .a     (sram_read_data),
      .b     (sum),
      .rnd   (3'd0),
      .z     (sum_calculation),
      .status(status)
  );

endmodule
