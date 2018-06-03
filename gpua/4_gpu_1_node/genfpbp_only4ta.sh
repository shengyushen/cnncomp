gnuplot -p -e 'set xlabel "Images per GPU";set ylabel "Runtime(seconds)"; plot "../4_gpu_1_node/tat" u 1:2 w linesp title "Total run time of 4GPU"'
