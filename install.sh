#!/bin/bash
#SBATCH --job-name=mace-venv
#SBATCH --partition=normal
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1

cp $PROJECT/mace-image/pytorch-25.04-py3-venv.sqsh .
bash write_image.sh

CONFIG_PATH="$HOME/.edf/mace-pytorch.toml"
SCRIPT_PATH="$PWD/setup_venv.sh"

srun --environment="$CONFIG_PATH" --container-workdir="$PWD" bash "$SCRIPT_PATH"