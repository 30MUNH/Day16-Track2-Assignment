#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "Starting user_data setup for CPU ML Benchmark Node (LightGBM)"

dnf update -y
dnf install -y python3 python3-pip libgomp tar gzip unzip

pip3 install --upgrade pip
pip3 install lightgbm scikit-learn pandas numpy kaggle

# Working directory for the benchmark, owned by ec2-user
mkdir -p /home/ec2-user/ml-benchmark
chown -R ec2-user:ec2-user /home/ec2-user/ml-benchmark

echo "CPU ML environment ready (lightgbm, scikit-learn, pandas, numpy, kaggle installed)"
