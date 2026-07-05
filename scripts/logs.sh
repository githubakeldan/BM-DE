#!/usr/bin/env bash

echo "====================================="
echo "        BM-DE LOG VIEWER"
echo "====================================="

if [ ! -f docker-compose.yml ]; then
    echo "[ERROR] docker-compose.yml bulunamadı."
    exit 1
fi

docker compose logs --tail=100 -f
