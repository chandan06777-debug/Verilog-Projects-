module fifo_tb;

  reg clk, rst, wr_en, rd_en;
  reg [7:0] data_in;

  wire [7:0] data_out;
  wire full, empty;

  fifo_sync dut (
      .clk(clk),
      .rst(rst),
      .wr_en(wr_en),
      .rd_en(rd_en),
      .data_in(data_in),
      .data_out(data_out),
      .full(full),
      .empty(empty)
  );

  initial
  begin
      clk     = 0;
      rst     = 0;
      wr_en   = 0;
      rd_en   = 0;
      data_in = 0;
  end

  always #5 clk = ~clk;

  initial
  begin
      rst = 1;
      #10;
      rst = 0;

      // Write 5
      wr_en = 1;
      data_in = 8'd5;
      #10;

      // Write 10
      data_in = 8'd10;
      #10;

      wr_en = 0;
      #10;

      // Read first data
      rd_en = 1;
      #10;

      // Read second data
      #10;

      rd_en = 0;
      #10;

      $finish;
  end

  initial
  begin
      $monitor(
      "time=%0t clk=%0b rst=%0b wr_en=%0b rd_en=%0b data_in=%0d data_out=%0d full=%0b empty=%0b",
      $time, clk, rst, wr_en, rd_en, data_in, data_out, full, empty
      );
  end

endmodule
