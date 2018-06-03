set ylabel "Memory (MB)";
set xrange [0:35]; 
set style data histogram; 
set style fill solid 0.4 border;
set xtic rotate by -45
plot newhistogram "Classification", \
		"classifying" u 7:xticlabels(1) ,\
		 newhistogram "Detection" at 12 , \
		"detection" u 7:xticlabels(1) ,\
			newhistogram "Segmentation" at 19, \
		"segmentation" u 7:xticlabels(1)
