# List of local models that I like to use and their parameters
#
# 64x64 image
# MODEL_PATH="--model_path /tmp/openai-2024-03-06-18-46-54-017520/ema_0.9999_110000.pt"
# MODEL_FLAGS="--image_size 64 --num_channels 128 --num_res_blocks 3"
# DIFFUSION_FLAGS="--diffusion_steps 1000 --noise_schedule linear"

MODEL_PATH="--model_path /tmp/openai-2024-03-06-18-46-54-017520/ema_0.9999_110000.pt"
MODEL_FLAGS="--image_size 64 --num_channels 128 --num_res_blocks 3"
DIFFUSION_FLAGS="--diffusion_steps 1000 --noise_schedule linear"

# This can be any number but 16 is nice for taking a peek
SAMPLE_FLAGS="--num_samples 16"

python3 scripts/image_sample.py $MODEL_PATH $MODEL_FLAGS $DIFFUSION_FLAGS $SAMPLE_FLAGS
