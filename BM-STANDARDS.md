# BM-DE STANDARTLARI

Bu belge BookMind Development Environment (BM-DE) için resmi mimari standartlarını içerir.

---

# BM Standard #001

BookMind içinde geliştirilen tüm bileşenler **BM-** ön eki kullanacaktır.

Örnek:

- BM-Core
- BM-Learn
- BM-Agent
- BM-RAG
- BM-Voice
- BM-Console

---

# BM Standard #002

Host işletim sistemi mümkün olduğunca temiz tutulacaktır.

Host üzerinde yalnızca:

- Ubuntu
- NVIDIA Driver
- Docker Engine
- Docker Compose

bulunacaktır.

---

# BM Standard #003

BM-AI internetten aldığı bilgiyi doğrudan doğru kabul etmeyecektir.

Bilgi önce doğrulanacak, ardından kullanılacaktır.

---

# BM Standard #004

Tüm servisler Docker Compose ile merkezi olarak yönetilecektir.

---

# BM Standard #005

Öncelik ticari kullanıma uygun açık kaynak ve ücretsiz bileşenlerdir.

Her model ve veri setinin lisansı kullanılmadan önce kontrol edilir.

---

# BM Standard #006

Tüm kalıcı veriler `/opt/BM-DE/volumes` altında saklanacaktır.

---

# BM Standard #007

BookMind tarafından geliştirilen tüm kaynak kodlar `/opt/BM-DE/BM/` altında bulunacaktır.

---

# BM Standard #008

Docker imajlarında mümkün olduğunca resmi (Official) imajlar kullanılacaktır.

---

# BM Standard #009

Her mimari değişiklik yeni bir sürüm numarası ile kayıt altına alınacaktır.

---

# BM Standard #010

Host işletim sistemi yalnızca platformu çalıştırır.

Tüm uygulama servisleri Docker Compose tarafından yönetilir.
---

# BM Standard #011

BM-DE'nin ana yapılandırma dosyaları aşağıdakilerdir:

- docker-compose.yml
- .env
- README.md
- HISTORY.md
- BM-STANDARDS.md

Bu dosyalar yalnızca planlı sürüm değişiklikleriyle güncellenir.

Geçici denemeler, hızlı çözümler veya test amaçlı değişiklikler bu dosyalara uygulanmaz.

Yeni özellikler mevcut mimariye eklenir; temel mimari ancak yeni bir BM-DE sürümü (ör. v1.1, v2.0) ile değiştirilebilir.
