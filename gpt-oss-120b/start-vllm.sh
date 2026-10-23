#!/bin/bash

set -e
set -x

docker run \
    --rm \
    --gpus all \
    -v ~/.cache/huggingface:/root/.cache/huggingface \
    -p 8000:8000 \
    --ipc=host \
    --shm-size=16GB \
    vllm/vllm-openai:v0.10.2 \
    --gpu-memory-utilization .95 \
    --tensor-parallel-size 4 \
    \
    --max-num-seqs 16 \
    --max-num-batched-tokens 64 \
    --max-model-len 16384 \
    \
    --model openai/gpt-oss-120b


# works
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 16 \
#    --max-model-len 4096 \


# fails
#  "max_position_embeddings": 131072,
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 128 \


# fails
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 128 \
#    --max-model-len 65536 \


# fails
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 128 \
#    --max-model-len 32768 \


# fails
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 128 \
#    --max-model-len 4096 \


# works 
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 16 \
#    --max-model-len 8192 \


# works  
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 16 \
#    --max-model-len 16384 \


# works 
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 32 \
#    --max-model-len 16384 \


# works
#    --max-num-seqs 16 \
#    --max-num-batched-tokens 64 \
#    --max-model-len 16384 \

