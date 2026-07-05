#!/usr/bin/env bash

echo "======================================"
echo "        BM-DE SYSTEM DOCTOR"
echo "======================================"

check() {
    if eval "$2" >/dev/null 2>&1; then
        printf "[OK]   %-20s\n" "$1"
    else
        printf "[FAIL] %-20s\n" "$1"
    fi
}

echo
echo "=== SYSTEM ==="
check "Docker" "docker --version"
check "Docker Compose" "docker compose version"
check "Git" "git --version"
check "NVIDIA Driver" "nvidia-smi"

echo
echo "=== BM-DE SERVICES ==="

services=(
"ollama"
"open-webui"
"postgres"
"redis"
"qdrant"
"n8n"
)

for s in "${services[@]}"; do
    if docker compose ps "$s" | grep -q "Up"; then
        printf "[OK]   %-20s\n" "$s"
    else
        printf "[FAIL] %-20s\n" "$s"
    fi
done

echo
echo "=== SYSTEM RESOURCES ==="

echo "CPU Load:"
uptime

echo
echo "Disk:"
df -h /

echo
echo "Memory:"
free -h

echo
echo "======================================"
echo "Doctor completed."
echo "======================================"
