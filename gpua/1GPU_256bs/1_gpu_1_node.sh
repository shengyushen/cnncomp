
#batchsize=('256' '128' '64' '32' '16' '8')
batchsize=('256')

i=0
while [[ i -lt ${#batchsize[@]} ]];
do
    batch=${batchsize[i]}
    echo batch size: $batch
    #sh $test_dir/cluster-verbs.sh $batch $job_name $task_index
   
     nvprof --quiet --profile-api-trace none --print-gpu-trace --print-nvlink-topology --csv --log-file resnet.csv -o resnet.nvrof \
     python /home/nfs/test/benchmarks-master/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=$batch \
    --model=resnet50 --optimizer=momentum --variable_update=replicated \
    --nodistortions --num_gpus=1 --use_fp16 --weight_decay=1e-4 --allow_growth \
    --num_batches=100 --data_format=NCHW --data_name=imagenet --data_dir=/home/nfs/resnet/train 
 
    let i++
done

