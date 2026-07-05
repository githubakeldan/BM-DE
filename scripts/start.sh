#!/usr/bin/env bash

set -e

echo "====================================="
echo " BM-DE Starting..."
echo "====================================="

if [ ! -f docker-compose.yml ]; then
    echo "[ERROR] docker-compose.yml bulunamadı."
    exit 1
fi

echo "[INFO] Docker servisleri başlatılıyor..."

docker compose up -d

echo
echo "[INFO] Servis durumu:"
docker compose ps

echo
echo "[OK] BM-DE başarıyla başlatıldı."
