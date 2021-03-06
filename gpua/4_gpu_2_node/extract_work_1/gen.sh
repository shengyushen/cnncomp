rm -f *_1 *_2 *_3 *_4
cp worker_1_$1.csv $1.csv_1
#cat $1.csv_1|grep ",,,[1-9].*HtoD\|BiasNHWCKernel\|BiasGradNHWC_SharedAtomics\|SwapDimension1And2InTensor3UsingTiles" > $1.csv_2
cat $1.csv_1|grep ",,,[1-9].*Tesla V100-SXM2-16GB (0).*HtoD\|Tesla V100-SXM2-16GB (0).*BiasGradNHWC_SharedAtomics\|Tesla V100-SXM2-16GB (0).*SwapDimension1And2InTensor3UsingTiles" > $1.csv_2
cat $1.csv_2 |awk '{if($0 ~ /HtoD/) {ssy=ssy+1} ; if(ssy>=20) {print}}' > $1.csv_3
cat $1.csv_3 |awk -F,  'BEGIN {fp1=-1;bp1=-1;bp2=-1;} {if($0 ~ /HtoD/) {fp1=$1} ; if($0 ~ /BiasGradNHWC_SharedAtomics/) {bp1=$1; if(fp1!=-1) {sigmafp=sigmafp+bp1-fp1;cntfp=cntfp+1}} ; if($0 ~ /SwapDimension1And2InTensor3UsingTiles/) {bp2=$1;if(bp1!=-1) {sigmabp=sigmabp+bp2-bp1;cntbp=cntbp+1;}} } END{print  sigmafp/cntfp  >> "recordfp"; print  sigmabp/cntbp >> "recordbp";}'
cat $1.csv_3 |awk -F,  '{if($0~/HtoD/) {print $1}}' > $1.csv_4
cp $1.csv_4 sdf
gnuplot -p -e "f(x)=a+b*x;fit f(x) 'sdf' via a,b;plot 'sdf', f(x);set print 'recordtat' append;print  b;"
