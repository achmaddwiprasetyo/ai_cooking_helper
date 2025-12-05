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

## 🚀 Cara Menjalankan Project

### 1️⃣ Clone Repository
```bash
git clone https://github.com/achmaddwiprasetyo/tugas1_pemograman_bergerak
cd tugas1_pemograman_bergerak
```

### 2️⃣ Install Dependency
```bash
flutter pub get
```

### 3️⃣ Jalankan Aplikasi
```bash
flutter run
```

### 📁 Struktur Folder

```bash
lib/
├── main.dart                     # Entry point aplikasi
├── database/
│   └── database_helper.dart      # Inisialisasi dan fungsi CRUD SQLite
├── models/
│   └── password_model.dart       # Model data password
└── screens/
    ├── home.dart            # Halaman utama (tampilan data + pencarian)
    ├── add_password.dart    # Halaman tambah data
    └── edit_password.dart       # Halaman edit data
```

---

### 💡 Pengembang

👤 Achmad Dwi Prasetyo<br>
🎓 Universitas Siber Asia - S1 PJJ Informatika 2026

---

### ⚖️ Lisensi

MIT License © 2025<br>
Created by Achmad Dwi Prasetyo - 220401010168


