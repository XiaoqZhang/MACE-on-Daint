#!/bin/bash
set -e  # Exit on error

# Create and activate venv
python -m venv --system-site-packages ./mace-venv
source ./mace-venv/bin/activate

# Install packages
pip install --upgrade pip
pip install mace-torch
pip install cuequivariance cuequivariance-torch cuequivariance-ops-torch-cu12
pip install wandb