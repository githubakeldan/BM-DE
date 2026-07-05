#!/usr/bin/env bash

set -e

echo "====================================="
echo "    BM-DE NVIDIA GPU INSTALL"
echo "====================================="

if ! command -v nvidia-smi >/dev/null 2>&1; then
    echo "[ERROR] NVIDIA Driver kurulu değil."
    exit 1
fi

echo "[OK] NVIDIA Driver bulundu."

if ! dpkg -l | grep -q nvidia-container-toolkit; then

    echo "[INFO] NVIDIA Container Toolkit kuruluyor..."

    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | \
    sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

    curl -fsSL https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list >/dev/null

    sudo apt update

    sudo apt install -y nvidia-container-toolkit

fi

echo "[INFO] Docker Runtime yapılandırılıyor..."

sudo nvidia-ctk runtime configure --runtime=docker

echo "[INFO] Docker yeniden başlatılıyor..."

sudo systemctl restart docker

echo

echo "[INFO] GPU Testi"

docker run --rm --gpus all nvidia/cuda:13.0.0-base-ubuntu24.04 nvidia-smi

echo

echo "[OK] GPU kurulumu tamamlandı."
