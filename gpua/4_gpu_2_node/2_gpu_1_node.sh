
#batchsize=('128' '64' '32' '16' '8')
batchsize=('16' '8')

i=0
while [[ i -lt ${#batchsize[@]} ]];
do
    batch=${batchsize[i]}
    echo batch size: $batch
    #sh $test_dir/cluster-verbs.sh $batch $job_name $task_index
   
     nvprof --dependency-analysis  \
     --profile-api-trace none  --print-nvlink-topology --print-dependency-analysis-trace --csv --log-file $batch.csv -o $batch.nvvp \
     python /home/nfs/test/benchmarks-master/scripts/tf_cnn_benchmarks/tf_cnn_benchmarks.py --batch_size=$batch \
    --model=resnet50 --optimizer=momentum --variable_update=replicated \
    --nodistortions --num_gpus=2 --use_fp16 --weight_decay=1e-4 --allow_growth \
    --num_batches=100 --data_format=NCHW --data_name=imagenet --data_dir=/home/nfs/resnet/train 
 
    let i++
done

