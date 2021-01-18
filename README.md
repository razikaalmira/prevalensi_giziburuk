# Prevalensi Gizi Buruk di Indonesia

## Latar Belakang
- Kasus gizi buruk di Indonesia masih tergolong tinggi dengan jumlah penderita gizi buruk di tahun 2019 mencapai 30 ribu orang dengan rasio 1:10 penduduk. 
- Masalah stunting pada balita di Indonesia berkisar 27.5% berdasarkan pemantauan status gizi di tahun 2016 dengan prevalensi pemberian ASI eksklusif pada bayi 0-6 bulan yang masih rendah pada angka 38%. 
- Penelitian ini bertujuan untuk mengetahui variabel yang berpengaruh pada kasus balita gizi buruk di seluruh provinsi di Indonesia dan memberikan saran kepada pemerintah untuk memberikan intervensi yang dapat menekan jumlah kasus gizi buruk di Indonesia.
- Referensi yang digunakan untuk penelitian ini adalah berdasarkan paper berjudul Pemodelan Jumlah Balita Gizi Buruk di Jawa Timur dengan Geographically weighted Poisson Regression di tahun 2012 oleh Amelia R. Purbadi.

## Struktur Data
Data yang digunakan:
1. Pendidikan: Angka melek huruf.
2. Pendapatan: Rata-rata pengeluaran untuk makanan.
3. Kesehatan: Kecukupan ASI eksklusif, konsumsi kalori, imunisasi, jumlah puskesmas, dokter umum, keperawatan, kebidanan, farmasi, jumlah tenaga kesehatan, rata-rata konsumsi protein, unmet need pelayanan kesehatan, jumlah rumah sakit.
4. Kesejahteraan: Indeks keparahan kemiskinan, akses air minum, akses sanitasi.

Dataset diambil dari [BPS](https://www.bps.go.id/) sesuai dengan variabel yang digunakan.

## Hasil
Model terpilih adalah model regresi linear dengan terdapat 3 buah variabel yang signifikan yaitu:
1. Kebidanan
2. Imunisasi
3. Pengeluaran untuk makanan
Ketiga variabel independen memiliki hubungan terbalik dengan prevalensi gizi buruk sehingga penambahan jumlah variabel tersebut akan menurunkan tingkat prevalensi gizi buruk.
Dengan menggunakan PCA, rekomendasi kebijakan untuk 10 provinsi dengan kasus gizi buruk tertinggi:
1. 4 Provinsi dengan program peningkatan jumlah bidan: Sulawesi Utara, Kalimantan Barat, Gorontalo, Sulawesi Barat
2. 5 Provinsi dengan program peningkatan jumlah imunisasi: Aceh, Sumatera Utara, Maluku Utara, Maluku, Sulawesi Tenggara
3. 6 Provinsi dengan program bantuan pengeluaran untuk makanan: Maluku Utara, Maluku, Sulawesi Tenggara, Nusa Tenggara Timur, Sulawesi Barat, Gorontalo

## Credit
Credits for this project go to [Helmi](https://www.linkedin.com/in/helmi-lahuddin-ghozali/?originalSubdomain=id), [Fathia](https://www.instagram.com/fathiathaya/), and [Aurelia](https://www.linkedin.com/in/aureliagracee/?originalSubdomain=id)
