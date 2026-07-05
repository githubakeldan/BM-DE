#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
    echo "Kullanım:"
    echo "./scripts/restore.sh backups/2026-07-05_06-04-27"
    exit 1
fi

BACKUP_DIR="$1"

if [ ! -d "$BACKUP_DIR" ]; then
    echo "[ERROR] Backup klasörü bulunamadı."
    exit 1
fi

echo "====================================="
echo "        BM-DE RESTORE"
echo "====================================="

echo "[INFO] PostgreSQL geri yükleniyor..."

docker exec -i bm-postgres \
psql -U bookmind -d bookmind \
< "$BACKUP_DIR/postgres.sql"

echo "[INFO] Redis geri yükleniyor..."

docker cp "$BACKUP_DIR/redis/." bm-redis:/data/

docker exec bm-redis redis-cli shutdown nosave >/dev/null 2>&1 || true
docker start bm-redis >/dev/null

echo "[INFO] Qdrant geri yükleniyor..."

docker stop bm-qdrant >/dev/null

docker cp "$BACKUP_DIR/qdrant/." bm-qdrant:/qdrant/storage/

docker start bm-qdrant >/dev/null

echo

echo "[OK] Restore tamamlandı."
