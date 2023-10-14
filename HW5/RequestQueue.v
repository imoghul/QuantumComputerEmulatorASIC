// mealy
module RequestQueue ( input clock, input reset, input R0, input R1, output reg G0, output reg G1);
  // different
  parameter IDLE = 1'b0, NOTHING = 1'b1;
  // state vectors
  reg currState;
  reg nextState;
  // D input to G0 and G1
  reg nextG0, nextG1;
  always @(posedge clock)
    // reset to IDLE and clear G0 and G1
    if (!reset) begin
       currState <= IDLE;
       G0 <= 1'b0;
       G1 <= 1'b0;
    // send D to Q
    end else begin 
      currState <= nextState;
      G0 <= nextG0;
      G1 <= nextG1;
    end
  always @(*) begin
    casex (currState)
      IDLE:
      if (!(R0 & R1)) begin // if they aren't both equal to 1 then stay in IDLE
        nextState = IDLE;
        {nextG0, nextG1}  = {R0, R1}; // set G0 and G1 to their respective G0 and R1
      end else begin // otherwise start with G0
        nextState = NOTHING;
        {nextG0, nextG1}  = 2'b10;
      end
      NOTHING: begin // and then G1, then go back to IDLE
        nextState = IDLE;
        {nextG0, nextG1}  = 2'b01;
      end
      default: nextState = IDLE; // make sure to have a default case
    endcase
  end
endmodule


//moore
// module RequestQueue (
//     input clock,
//     input reset,
//     input R0,
//     input R1,
//     output reg G0,
//     output reg G1
// );


//   parameter IDLE = 2'b00, SINGLE = 2'b01, DOUBLE = 2'b10, DOUBLE2 = 2'b11;


//   reg [1:0] currState;
//   reg [1:0] nextState;


//   always @(posedge clock)
//     if (!reset) begin
//       currState <= IDLE;
//     end else begin
//       currState <= nextState;
//     end

//   always @(*) begin
//     {G0, G1} = 2'b00;
//     if (R0 & R1) begin
//       nextState = DOUBLE;
//     end else if (R0 ^ R1) begin
//       nextState = SINGLE;
//     end else begin
//       nextState = IDLE;
//     end

//     casex (currState)
//       IDLE: begin
//         {G0, G1} = 2'b00;
//       end
//       SINGLE: begin
//         {G0, G1} = {R0, R1};
//       end
//       DOUBLE: begin
//         nextState = DOUBLE2;
//         {G0, G1}  = 2'b10;
//       end
//       DOUBLE2: begin
//         {G0, G1} = 2'b01;
//       end
//       default: nextState = IDLE;
//     endcase

//   end



// endmodule


