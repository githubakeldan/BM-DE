# BM-DE v1.0.0 RC1

BookMind Development Environment (BM-DE), BookMind ekosisteminin resmi geliştirme ve çalışma ortamıdır.

BM-DE; yerel yapay zekâ modelleri, veritabanları, otomasyon servisleri ve vektör veritabanını tek bir Docker ortamında bir araya getirir.

---

# Özellikler

- Docker tabanlı kurulum
- Yerel LLM desteği (Ollama)
- Web arayüzü (Open WebUI)
- PostgreSQL veritabanı
- Redis önbellek
- Qdrant vektör veritabanı
- n8n otomasyon platformu
- GitHub sürüm kontrolü
- GPU desteği (NVIDIA Container Toolkit ile)

---

# Servisler

| Servis | Port |
|--------|------|
| Ollama | 11434 |
| Open WebUI | 3000 |
| PostgreSQL | 5432 |
| Redis | 6379 |
| Qdrant HTTP | 6333 |
| Qdrant gRPC | 6334 |
| n8n | 5678 |

---

# Klasör Yapısı

```text
BM-DE
├── backups/
├── compose/
├── configs/
├── docs/
├── logs/
├── scripts/
├── volumes/
├── .env
├── .env.example
├── .gitignore
├── docker-compose.yml
├── README.md
├── HISTORY.md
└── BM-STANDARDS.md
```

---

# Kurulum

Projeyi klonla:

```bash
git clone git@github.com:githubakeldan/BM-DE.git
cd BM-DE
```

Ortam dosyasını oluştur:

```bash
cp .env.example .env
```

Servisleri başlat:

```bash
docker compose up -d
```

Servis durumunu kontrol et:

```bash
docker compose ps
```

---

# Çalışan Servisler

- Ollama
- Open WebUI
- PostgreSQL
- Redis
- Qdrant
- n8n

---

# BookMind Servisleri

BM-DE yalnızca altyapıyı sağlar.

Aşağıdaki servisler daha sonraki sürümlerde eklenecektir:

- BM-Core
- BM-Agent
- BM-RAG
- BM-Learn
- BM-Voice
- BM-Console

---

# Geliştirme Kuralları

- Her değişiklik commit ile ilerler.
- main dalı her zaman çalışır durumda tutulur.
- Test edilmemiş kod GitHub'a gönderilmez.
- Tüm geliştirmeler BM Standard #001-#011'e uygun yapılır.

---

# Lisans

Bu depo BookMind geliştirme ortamıdır.

© 2026 BookMind Project
