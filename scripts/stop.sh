#!/usr/bin/env bash

set -e

echo "====================================="
echo " BM-DE Stopping..."
echo "====================================="

if [ ! -f docker-compose.yml ]; then
    echo "[ERROR] docker-compose.yml bulunamadı."
    exit 1
fi

echo "[INFO] Docker servisleri durduruluyor..."

docker compose down

echo
echo "[OK] BM-DE durduruldu."
