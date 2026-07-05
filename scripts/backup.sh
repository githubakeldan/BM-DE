#!/usr/bin/env bash

set -e

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="backups/$DATE"

echo "====================================="
echo "        BM-DE BACKUP"
echo "====================================="

mkdir -p "$BACKUP_DIR"

echo "[INFO] docker-compose.yml"
cp docker-compose.yml "$BACKUP_DIR/"

echo "[INFO] README.md"
cp README.md "$BACKUP_DIR/"

echo "[INFO] BM-STANDARDS.md"
cp BM-STANDARDS.md "$BACKUP_DIR/" 2>/dev/null || true

echo "[INFO] HISTORY.md"
cp HISTORY.md "$BACKUP_DIR/" 2>/dev/null || true

echo "[INFO] .env"
cp .env "$BACKUP_DIR/" 2>/dev/null || true

echo "[INFO] PostgreSQL"

docker exec bm-postgres \
pg_dump -U bookmind bookmind \
> "$BACKUP_DIR/postgres.sql" || true

echo "[INFO] Redis"

docker exec bm-redis \
redis-cli SAVE >/dev/null 2>&1 || true

docker cp bm-redis:/data "$BACKUP_DIR/redis" >/dev/null 2>&1 || true

echo "[INFO] Qdrant"

docker cp bm-qdrant:/qdrant/storage \
"$BACKUP_DIR/qdrant" >/dev/null 2>&1 || true

echo "[INFO] Ollama Models"

docker exec bm-ollama ollama list \
> "$BACKUP_DIR/ollama-models.txt" || true

echo
echo "[OK] Backup tamamlandı."
echo
echo "Konum:"
echo "$BACKUP_DIR"
