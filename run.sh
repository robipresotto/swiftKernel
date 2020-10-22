#!/bin/bash

set -eu

# Cleanup /tmp
rm -rf /tmp

# Install MiniConda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && bash Miniconda3-latest-Linux-x86_64.sh -b -p /tmp/miniconda3 && /

# Clone swift jupyter repo
git clone https://github.com/google/swift-jupyter.git && /
cd swift-jupyter && /
wget -O swift-tensorflow.tar.gz https://storage.googleapis.com/swift-tensorflow-artifacts/nightlies/latest/swift-tensorflow-DEVELOPMENT-ubuntu18.04.tar.gz && mkdir swift-toolchain && /
tar -xvf swift-tensorflow.tar.gz swift-toolchain && /

# Creates the new tensorflow env
conda create -n swift-tensorflow python=3.6 --yes && /
conda activate swift-tensorflow --yes && /
conda install jupyter numpy matplotlib --yes && /

# Register the kernel
python register.py --sys-prefix \
--swift-python-use-conda \
--use-conda-shared-libs \
--swift-toolchain /swift-toolchain