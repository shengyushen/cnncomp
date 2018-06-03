gnuplot -p -e 'set xlabel "time"; set ylabel "GFLOP";set logscale y ;plot "data" title "Nvidia FP32" with labels, "" with linespo, "data_tensor" title "D tensor" with labels , "" with linesp,"tpu" title "TPU tensor" with labels, "" with linespo'

