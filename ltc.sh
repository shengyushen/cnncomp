rm -f ltc_mem.txt
touch ltc_mem.txt
for frame in 10 25 50 100
do 
	for width in 50 100 200 400 800 1600 
	do
#		echo "$frame "
		awk -v f=$frame -v w=$width  'BEGIN {ff=f;ww=w} {if($0 ~ /VolumetricConvolution/) {ch=substr($4,1,length($4)-1);ssy=ch*f*w*w ;total=total+ssy} else if($0 ~ /VolumetricMaxPooling/) {xx=substr($NF,1,length($NF)-1);split(xx,arr,","); f=int(f/arr[1]);w=int(w/arr[2]) }   } END{print ff " " ww " " total*4*2/(1024*1024*1024)}' ltc.txt >> ltc_mem.txt
	done

done

gnuplot -p -e 'set xlabel "resolution";set ylabel "feature size(GB)";set key right bottom;set logscale y;set term png;set output "ltc.png";plot "ltc_mem.txt" u 2:($1==10?$3:1/0) w linesp, ""  u 2:($1==25?$3:1/0) w linesp,""  u 2:($1==50?$3:1/0) w linesp,""  u 2:($1==100?$3:1/0) w linesp,  "" u 2:($1==100?$3:1/0):($1==100?$3:1/0) w labels notitle'

