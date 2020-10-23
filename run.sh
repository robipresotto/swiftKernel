#!/bin/bash

set -eu

# Install MiniConda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && sh Miniconda3-latest-Linux-x86_64.sh -u -b -p /tmp/miniconda3 && \

# Clone swift jupyter repo
git clone https://github.com/google/swift-jupyter.git && cd swift-jupyter && \
wget -O ./swift-tensorflow.tar.gz https://storage.googleapis.com/swift-tensorflow-artifacts/nightlies/latest/swift-tensorflow-DEVELOPMENT-ubuntu18.04.tar.gz && \
mkdir swift-toolchain && \
tar -zxvf swift-tensorflow.tar.gz -C swift-toolchain && \

# Creates the new tensorflow env
conda update -n base -c defaults conda --yes && \
conda create -n swift-tensorflow python=3.6 --yes && \
. /tmp/miniconda3/etc/profile.d/conda.sh && \
conda activate swift-tensorflow && \
conda install jupyter numpy matplotlib --yes && \

# Register the kernel
python register.py \
--sys-prefix \
--swift-python-use-conda \
--use-conda-shared-libs \
--swift-toolchain ./swift-toolchain && \

# Export env
conda env export --name swift-toolchain --file ~/swiftKernel.yml && \

# Cleanup temp files
rm -rf swift-tensorflow.tar.gz
