-- Nama : Adin Syahrial
-- Nim		: 23241051
-- Modul	: Modul 5 : Join, Unionn, Limit

-- menggunakan database
USE PTI_mart;

-- Praktek 1
-- Menggabungkan 2 buah tabel berdasarkan kolom yang sama

-- Ambil nama pelanggan yang pernah bertransaksi beserta qty nya
-- artinya ambil kolom  kode_pelanggan , nama_pelanggan, dan qty dari
-- penggabungan tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.qty
FROM tr_penjualan AS tp
JOIN ms_pelanggan AS mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- Praktek 2
-- menggabungkan dua tabel tanpa memperhatikan relation keys
-- ambil nama pelanggan yang pernah bertransaksi beserta qty 
-- mwnggabungkan 2 tabel penjualan dan tabel pelanggan tanpa
-- memperhatikan kolom yang menjadi primary key

SELECT tp.kode_pelanggan, mp.nama_pelanggan, qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON TRUE;

-- INNER JOIN
-- join yang mengambil data dari dua sisi tabel yang berhubungan 
-- praktek 3
-- ambil kode pelanggan, nama pelanggan, nama produk, qty
-- dari hasil join tabel penjualan dan tabel pelanggan

SELECT tp.kode_pelanggan, mp.nama_pelanggan, tp.nama_produk, tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;





-- NOMER 1
-- Buatlah join ketiga table yang terdapat pada qlabmartbasic dengan INNER JOIN.
SELECT * FROM ms_pelanggan
JOIN tr_penjualan ON TRUE
JOIN ms_produk ON TRUE;

-- NOMOR 2
-- Buatlah join ketiga table dengan urrutan ms_pelanggan, tr penjualan dan ms_produk 
-- yang terdapat pada qlabmartbasic dengan left join, kemudian filter untuk qty yang tidak bernilai NULL
-- dengan oprator IS NOT NULL
SELECT 
    p.nama_pelanggan,
    t.kode_transaksi,
    pr.nama_produk,
    t.qty
FROM ms_pelanggan AS p
LEFT JOIN tr_penjualan AS t ON p.kode_pelanggan = t.kode_pelanggan
LEFT JOIN ms_produk AS pr ON t.kode_produk = pr.kode_produk
WHERE t.qty IS NOT NULL;

-- NOMOR 3
-- Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan dan ms_produk
-- yang terdapat pada qlabmartbasic dengan INNER JOIN, kemudian tempilkan grouping untuk kolom kategori dan penjumlahan qty.
SELECT pr.kategori_produk,
    SUM(t.qty) AS total_qty
FROM tr_penjualan AS t
INNER JOIN ms_produk AS pr ON t.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk;

-- NOMOR 4
-- Latihan khusus : Cobalah lakukan JOIN ms_produk dengan table ms_produk juga dengan kolom relationship kode_produk 
-- (benar, Anda tidak salah baca) ini kita lakukan join dengan table sendiri yang memang bisa dilakukan jangan lupa
-- untuk menggunakan alias
SELECT a.kode_produk, a.nama_produk, b.nama_produk AS produk_alias
FROM ms_produk a
JOIN ms_produk b ON a.kode_produk = b.kode_produk;


