gnuplot -p -e 'set xlabel "Images per GPU";set ylabel "runtime(seconds)"; plot "../1_gpu_1_node/tat" u 1:2 w linesp title "1GPU", "../4_gpu_1_node/tat" u 1:2 w linesp title "4GPU"'
