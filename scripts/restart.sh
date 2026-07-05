#!/usr/bin/env bash

set -e

echo "====================================="
echo " BM-DE Restarting..."
echo "====================================="

if [ ! -f docker-compose.yml ]; then
    echo "[ERROR] docker-compose.yml bulunamadı."
    exit 1
fi

echo "[INFO] Docker servisleri yeniden başlatılıyor..."

docker compose down
docker compose up -d

echo
echo "[INFO] Servis durumu:"
docker compose ps

echo
echo "[OK] BM-DE yeniden başlatıldı."
