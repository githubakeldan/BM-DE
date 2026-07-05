#!/usr/bin/env bash

set -e

echo "====================================="
echo "         BM-DE UPDATE"
echo "====================================="

echo "[INFO] Git deposu güncelleniyor..."
git pull

echo
echo "[INFO] Docker image'ları güncelleniyor..."
docker compose pull

echo
echo "[INFO] Servisler yeniden oluşturuluyor..."
docker compose up -d

echo
echo "[INFO] Kullanılmayan image'lar temizleniyor..."
docker image prune -f

echo
echo "[INFO] Servis durumu:"
docker compose ps

echo
echo "[OK] Güncelleme tamamlandı."
