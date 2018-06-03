
#batchsize=('256' '128' '64' '32' '16' '8')
batchsize=('8')
test_dir=/home/nfs/test/cluster

job_name=ps
task_index=1
echo job_name: $job_name
echo task_index: $task_index

i=0
while [[ i -lt ${#batchsize[@]} ]];
do
    batch=${batchsize[i]}
    echo batch size: $batch
    #sh $test_dir/cluster-verbs.sh $batch $job_name $task_index
   
    CUDA_VISIBLE_DEVICES= nvprof -f --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file ps_1_$batch.csv -o ps_1_$batch.nvvp \
    python /home/nfs/test/benchmarks-master/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=$batch \
    --model=resnet50 --optimizer=momentum --variable_update=distributed_replicated \
    --nodistortions --num_gpus=2 --use_fp16 --weight_decay=1e-4 --allow_growth \
    --job_name=$job_name --worker_hosts=10.168.6.217:2000,10.168.6.219:2000 --task_index=$task_index \
    --ps_hosts=10.168.6.217:2001,10.168.6.219:2001 --server_protocol=grpc+verbs  \
    --num_batches=100 --data_format=NCHW --data_name=imagenet --data_dir=/home/nfs/resnet/train 
 
    sleep 3

    let i++
done

