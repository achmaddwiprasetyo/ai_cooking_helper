# UTS Pemograman Bergerak 
## 🍳 AI Cooking Helper  
Aplikasi Flutter berbasis AI untuk membantu memasak, membuat rekomendasi resep, dan mengelola bahan dapur.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Linux%20%7C%20Windows-lightgrey)
![SQLite](https://img.shields.io/badge/Database-SQFLite-blueviolet)

---

## 🚀 Deskripsi
**AI Cooking Helper** adalah aplikasi Flutter yang memanfaatkan teknologi AI (Gemini / OpenAI / LLM lain) untuk memberikan rekomendasi resep berdasarkan bahan yang tersedia. Pengguna cukup memasukkan daftar bahan atau mengunggah foto, dan AI akan menghasilkan resep lengkap beserta langkah-langkah memasaknya.

---

## ✨ Fitur Utama
- 🔍 **Rekomendasi Resep Otomatis** berdasarkan daftar bahan.
- 📸 **Deteksi Bahan dari Foto** (opsional).
- 🧾 **Generator Resep Instan** berdasarkan prompt pengguna.
- 🥫 **Manajemen Bahan Dapur** (stok, expired, kategori).
- 🎨 **UI Modern** dengan Material 3, Dark/Light mode.

---

## 🛠️ Teknologi yang Digunakan
| Teknologi | Fungsi |
|----------|--------|
| **Flutter 3.x** | Framework UI |
| **Dart** | Logika aplikasi |
| **Gemini / OpenAI API** | AI untuk resep & analisis |
| **Provider / Riverpod** | State management |
| **Dio / HTTP** | API request |
| **Image Picker** | Upload gambar |

---

## 📦 Instalasi & Setup

### 1️⃣ Clone Repository
```bash
git clone https://github.com/username/ai-cooking-helper.git
cd ai-cooking-helper
```

## 🚀 Cara Menjalankan Project

### 2️⃣ Install Dependency
```bash
flutter pub get
```

### 3️⃣ Setup API Key
```bash
lib/utils/ai_service.dart
```

Ganti:
```bash
const String API_KEY = 'API KEY';
```

### 4️⃣ Jalankan Aplikasi
```bash
flutter run
```

### 🧠 Contoh Output AI
Input:
```makefile
Bahan: telur, kecap, bawang putih
```

Output:
```markdown
🍳 Resep: Telur Kecap Sederhana 
👨‍🍳 Langkah:
1. Tumis bawang putih hingga harum
2. Masukkan telur lalu orak-arik
3. Tambahkan kecap dan sedikit air
4. Masak hingga meresap
```

### 📁 Struktur Folder

```bash
lib/
├── main.dart                     
├── utils/
│   └── ai_service.dart          
├── page/
│   └── home_page.dart            
└── fragment/
    ├── generate_image.dart       
    └── generate_image.dart      
```

---

### 💡 Pengembang
Kelompok 10:<br>
1. Achmad Dwi Prasetyo
2. Jovita Kusuma
3. Jeki Hendrian
4. Harry Kusuma Bhakti <br>
🎓 Universitas Siber Asia - S1 PJJ Informatika 2026

---

### ⚖️ Lisensi

MIT License © 2025<br>
Created by Achmad Dwi Prasetyo - 220401010168


