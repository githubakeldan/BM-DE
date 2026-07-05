#!/usr/bin/env bash

echo "====================================="
echo "      BM-DE Health Check"
echo "====================================="

docker compose ps

echo
echo "-------------------------------------"

services=("ollama" "open-webui" "postgres" "redis" "qdrant" "n8n")

for service in "${services[@]}"; do
    if docker compose ps "$service" | grep -q "Up"; then
        echo "[OK] $service"
    else
        echo "[FAIL] $service"
    fi
done

echo
echo "Health check tamamlandı."
