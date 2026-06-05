vlib work

vlog -sv fifo.sv
vlog -sv fifo_tb.sv

vsim -voptargs=+acc work.fifo_tb

view wave
view objects

run -all
