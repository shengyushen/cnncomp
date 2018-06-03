gnuplot -p -e 'f(x)=a+b*x;fit f(x) "record" via a,b;plot "record" u 1:2,f(x)'
