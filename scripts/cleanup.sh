#!/usr/bin/env bash

set -e

echo "====================================="
echo "      BM-DE CLEANUP"
echo "====================================="

echo
echo "[INFO] Kullanılmayan containerlar temizleniyor..."
docker container prune -f

echo
echo "[INFO] Kullanılmayan imageler temizleniyor..."
docker image prune -f

echo
echo "[INFO] Kullanılmayan networkler temizleniyor..."
docker network prune -f

echo
echo "[INFO] Kullanılmayan build cache temizleniyor..."
docker builder prune -f

echo
echo "[OK] Temizlik tamamlandı."
