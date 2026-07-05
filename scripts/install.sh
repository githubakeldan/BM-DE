#!/usr/bin/env bash

set -e

echo "====================================="
echo "      BM-DE INSTALL"
echo "====================================="

if ! command -v docker >/dev/null 2>&1; then
    echo "[ERROR] Docker kurulu değil."
    exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
    echo "[ERROR] Docker Compose bulunamadı."
    exit 1
fi

if [ ! -f ".env" ]; then
    echo "[INFO] .env bulunamadı."

    if [ -f ".env.example" ]; then
        cp .env.example .env
        echo "[OK] .env oluşturuldu."
    else
        echo "[ERROR] .env.example bulunamadı."
        exit 1
    fi
fi

mkdir -p backups logs volumes

docker compose config >/dev/null

echo "[INFO] Servisler başlatılıyor..."

docker compose up -d

echo

docker compose ps

echo

echo "[OK] BM-DE kurulumu tamamlandı."
