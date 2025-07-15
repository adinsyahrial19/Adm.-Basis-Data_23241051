USE Pti_mart;

-- SOAL 1
-- munculkan kode pelanggan, nama produk,jumlah , harga, dan total dari semua produk yang pernah ditransaksikan, 
-- namun outputnya yang diminta adalah total harga minimal 200.000 dan diurutkan berdasarkan total harga terkecil

SELECT tr.kode_pelanggan, tr.nama_produk, tr.qty, tr.harga, (tr.qty * tr.harga * (1 - tr.diskon_persen / 100)) AS total
FROM tr_penjualan tr
WHERE (tr.qty * tr.harga * (1 - tr.diskon_persen / 100)) >= 200000
ORDER BY total ASC;

-- SOAL 2
-- Tampilkan nama pelanggan dan nilai transaksinya dengan nilai transaksi terbesar
SELECT kode_pelanggan,SUM(qty * harga) AS total_transaksi
FROM tr_penjualan
GROUP BY kode_pelanggan
ORDER BY total_transaksi DESC;

-- SOAL 3
-- tampilkan nama produk, kategori, dan harga dari produk yang tidak pernah terjual
SELECT p.nama_produk, p.kategori_produk, p.harga
FROM ms_produk p
LEFT JOIN tr_penjualan t ON p.kode_produk = t.kode_produk
WHERE t.kode_produk IS NULL;
