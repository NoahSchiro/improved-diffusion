MODEL_FLAGS="--image_size 256 --num_channels 128 --num_res_blocks 3 --use_checkpoint true --log_interval 100 --save_interval 25000 --use_fp16 true"
DIFFUSION_FLAGS="--diffusion_steps 1000 --noise_schedule linear"
TRAIN_FLAGS="--lr 1e-4 --batch_size 8"

DATA_DIR="/home/noah/Work/diffusion/data/"

python3 scripts/image_train.py --data_dir $DATA_DIR $MODEL_FLAGS $DIFFUSION_FLAGS $TRAIN_FLAGS
