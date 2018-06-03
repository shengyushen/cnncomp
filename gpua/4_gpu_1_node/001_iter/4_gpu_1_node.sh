rm -f 2stdout_ssy 2stderr_ssy
#batchsize=('256' '128' '64' '32' '16' '8')
batchsize=('256')
touch 2stdout_ssy 2stderr_ssy

i=0
while [[ i -lt ${#batchsize[@]} ]];
do
    batch=${batchsize[i]}
    echo batch size: $batch
    #sh $test_dir/cluster-verbs.sh $batch $job_name $task_index
   
     nvprof -f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file 2_$batch.csv -o 2_$batch.nvvp \
     python /home/nfs/test/benchmarks-master/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=$batch \
    --model=resnet50 --optimizer=momentum --variable_update=replicated \
    --nodistortions --num_gpus=4 --use_fp16 --weight_decay=1e-4 --allow_growth \
    --num_batches=100 --data_format=NCHW --data_name=imagenet --data_dir=/home/nfs/resnet/train 2>>2stderr_ssy |tee -a 2stdout_ssy
 
    let i++
done
#awk '{if($0 ~ /[0-9]* per device/) {printf $1 " "} else if($0 ~ /total images\/sec: [0-9]*\.[0-9]*/) {print $3}}' 2stdout_ssy |sort -n > 4gpu_throughput
#gnuplot -p -e 'plot "4gpu_throughput" with linesp'
