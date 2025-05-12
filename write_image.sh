#!/bin/bash
# This script writes the mace-pytorch container configuration to ~/.edf/mace-pytorch.toml

# Set paths
CONFIG_DIR="$HOME/.edf"
CONFIG_FILE="$CONFIG_DIR/mace-pytorch.toml"
IMAGE_PATH="$HOME/MACE-on-Daint/pytorch-25.04-py3-venv.sqsh"

# Create config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Write TOML configuration
cat > "$CONFIG_FILE" << EOF
image = "$IMAGE_PATH"

mounts = ["/capstor", "/users"]

writable = true

[annotations]
com.hooks.aws_ofi_nccl.enabled = "true"
com.hooks.aws_ofi_nccl.variant = "cuda12"

[env]
FI_CXI_DISABLE_HOST_REGISTER = "1"
FI_MR_CACHE_MONITOR = "userfaultfd"
NCCL_DEBUG = "INFO"
EOF

echo "TOML configuration written to $CONFIG_FILE"