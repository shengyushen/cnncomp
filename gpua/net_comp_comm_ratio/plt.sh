gnuplot -p -e 'set ylabel "computation-communication ratio GFLOP/MB";plot "data" u  :($2/$1):3 with labels,"" u :($2/$1) with lines'
