# TechCorp SQL Analysis: E-commerce Performance & Support Insights

## 📌 Profil Perusahaan
**TechCorp** adalah perusahaan e-commerce yang berfokus pada penjualan produk elektronik berkualitas tinggi (laptop, smartphone, aksesoris) serta menyediakan layanan dukungan pelanggan teknis.

## 👨‍💻 Peran & Objektif
Sebagai **Data Analyst**, proyek ini bertujuan untuk mengolah database TechCorp guna menghasilkan laporan keuangan dan analisis performa bisnis yang krusial bagi manajemen.

## 📂 Database Schema
Database TechCorp terdiri dari 6 tabel utama yang saling terintegrasi. 
> 🔗 **[Lihat Gambar Skema Database Lengkap Di Sini](./data/Database_Schema.jpg)**

1. **Tabel Produk (Products)**: Menyimpan informasi detail produk yang dijual.
2. **Tabel Pelanggan (Customers)**: Menyimpan data identitas pelanggan.
3. **Tabel Pesanan (Orders)**: Menyimpan informasi umum terkait pesanan pelanggan.
4. **Tabel Detail Pesanan (OrderDetails)**: Menyimpan rincian item dari setiap pesanan.
5. **Tabel Karyawan (Employees)**: Menyimpan data karyawan yang bekerja di TechCorp.
6. **Tabel Tiket Dukungan (SupportTickets)**: Menyimpan informasi tiket dukungan/masalah teknis yang diajukan pelanggan.

<img width="375" height="393" alt="image" src="https://github.com/user-attachments/assets/ac7398be-a17b-4ed4-923e-bbe2d3f43313" />

## 📊 Business Questions (Key Analytics)
Proyek ini menjawab tantangan bisnis melalui implementasi SQL. Seluruh query jawaban dapat diakses melalui link berikut:

1. **Top Customers:** Identifikasi 3 pelanggan teratas berdasarkan total nominal pesanan.
2. **Customer Spending:** Menghitung rata-rata nominal pesanan untuk setiap pelanggan.
3. **Staff Performance:** Menemukan karyawan yang telah menyelesaikan lebih dari 4 tiket support.
4. **Inventory Efficiency:** Mengidentifikasi produk yang belum pernah dipesan.
5. **Revenue Analysis:** Menghitung total pendapatan dari penjualan produk.
6. **Market Positioning:** Menghitung rata-rata harga produk per kategori dan menemukan kategori dengan rata-rata > $500.
7. **High-Value Orders:** Menemukan pelanggan dengan pesanan tunggal di atas $1.000.

## 🔍 SQL Highlights: Market Positioning Analysis
Berikut adalah cuplikan implementasi **CTE (Common Table Expression)** untuk menganalisis kategori produk premium:

<img width="400" height="200" alt="image" src="https://github.com/user-attachments/assets/524334be-b60f-46c7-ba74-f558df452d8c" />
<img width="400" height="200" alt="image" src="https://github.com/user-attachments/assets/7d4b6c03-a5b2-492d-add3-48666497e782" />

```sql
-- Rata-rata harga produk per kategori
WITH cte_avg_price AS (
    SELECT 
        category, 
        AVG(price) AS rerata
    FROM products
    GROUP BY category
)
SELECT * FROM cte_avg_price;

-- Kategori dengan rata-rata > $500
WITH cte_avg_price AS (
    SELECT 
        category, 
        AVG(price) AS rerata
    FROM products
    GROUP BY category
)
SELECT * FROM cte_avg_price 
WHERE rerata > 500;
