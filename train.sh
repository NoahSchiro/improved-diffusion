# Memory saving tips
# --use_checkpoint true turns on checkpointing
# --use_fp16 true turns on half precision
# --microbatch if we can't run a full batch through

# Time saving tips
# --use_ddim true can provide a 10-50x speed up but sacrifices quality somewhat

MODEL_FLAGS="--image_size 64 --num_channels 128 --num_res_blocks 3 --use_checkpoint true --log_interval 100 --save_interval 10000 --use_fp16 true"
DIFFUSION_FLAGS="--diffusion_steps 1000 --noise_schedule linear"
TRAIN_FLAGS="--lr 1e-4 --batch_size 128 --microbatch 4"

DATA_DIR="/home/noah/Work/diffusion/data/"

# In the event you are training with multiple GPUs, prepend with the following
# mpiexec -n $NUM_GPUS 
python3 scripts/image_train.py --data_dir $DATA_DIR $MODEL_FLAGS $DIFFUSION_FLAGS $TRAIN_FLAGS
