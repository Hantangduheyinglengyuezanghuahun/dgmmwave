#!/bin/bash

# SLURM SUBMIT SCRIPT
#SBATCH --nodes=1
#SBATCH --gres=gpu:8
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=2
#SBATCH --partition=gpu-share
##SBATCH --nodelist=10-0-8-18

# export CUDA_VISIBLE_DEVICES=0
# /mnt/home/zpengac/.Miniconda3/envs/dnn/bin/pip install --force-reinstall natten
# srun python main.py -g 8 -n 1 -w 10 -b 128 -e 100 --data_dir data/mri.pkl --pin_memory --wandb_project_name test --cfg cfg/sample_mri.yml --model_ckpt_dir ./model_ckpt/$(date +'%Y%m%d_%H%M%S')
srun python main.py -g 8 -n 1 -w 10 -b 128 -e 100 --data_dir data/mmfi.pkl --pin_memory --wandb_project_name test --cfg cfg/sample_mmfi_da.yml --model_ckpt_dir ./model_ckpt/$(date +'%Y%m%d_%H%M%S')
# srun python main.py -g 4 -n 1 -w 10 -b 32 -e 20 --data_dir /mnt/home/zpengac/USERDIR/HAR/datasets/jhmdb --pin_memory --wandb_project_name test --cfg cfg/sample.yaml --model_ckpt_dir ./model_ckpt/$(date +'%Y%m%d_%H%M%S') --checkpoint_path /mnt/home/zpengac/USERDIR/HAR/SkeletonFlow/model_ckpt/20231202_181426/deeplabv3-raft-epoch=82-val_loss=-20.8980.ckpt --test