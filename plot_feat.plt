#!/usr/bin/gnuplot -p
set key right bottom
set xlabel "Resolution"
set ylabel "Feature Size(B)"
set title  "Feature size of 3D convolution with batch size 1"
set label 1 at 1200,50000000000 "2D Flownet Depth 3" center rotate by 11 front
set label 2 at 1200,80000000000 "2D Flownet Depth 5" center rotate by 11 front
set label 3 at 1200,190000000000 "2D Flownet Depth 11" center rotate by 11 front
set label 4 at 600,2000000000 'Classification' center rotate by 20
set label 5 at 1500,10000000000 'Detection' center rotate by 10
set logscale y;
plot "./fgfares/res3" u 2:($3*4*2):(sprintf("%dGB",$3*4*2/1024/1024/1024)) with linesp  notitle,\
     ""     u 2:($3*4*2):(sprintf("%dGB",$3*4*2/1024/1024/1024)) with labels  notitle,\
     "./fgfares/res5" u 2:($3*4*2):(sprintf("%dGB",$3*4*2/1024/1024/1024)) with linesp notitle,\
     ""     u 2:($3*4*2):(sprintf("%dGB",$3*4*2/1024/1024/1024)) with labels notitle,\
     "./fgfares/res11" u 2:($3*4*2):(sprintf("%dGB",$3*4*2/1024/1024/1024)) with linesp notitle,\
     ""      u 2:($3*4*2):(sprintf("%dGB",$3*4*2/1024/1024/1024)) with labels notitle,\
     "./fgfares/resnet152" u 1:($2*1024*1024/128) with linesp notitle,\
       "./fgfares/yolo_comp_feature" u 1:(4*$3*1024*1024):(sprintf("%dGB",(4*$3/1024))) with labels notitle,\
       "" u 1:(4*$3*1024*1024) with linesp notitle, \
			"ltc_mem.txt"       u 2:($1==10 ?$3*1024*1024*1024:1/0) w linesp,\
			""                  u 2:($1==25 ?$3*1024*1024*1024:1/0) w linesp,\
			""                  u 2:($1==50 ?$3*1024*1024*1024:1/0) w linesp,\
			""                  u 2:($1==100?$3*1024*1024*1024:1/0) w linesp, \
			""                  u 2:($1==100?$3*1024*1024*1024:1/0):($1==100?$3:1/0) w labels notitle
