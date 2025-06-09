-- Nama  : Adin syahrial
-- kelas : IV B
-- Nim   : 23241051
-- Modul : ORDER BY,FUNGSI AGREGASI, GROUP BY, HAVING

USE pti_mart;

-- ORDER BY
-- Ambil nama produk dari tabel penjualan urutkan qty
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty;

-- ambil nama produk dari qty dari tb penjualan urutkan qty dan nama produk (a-z)
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty, nama_produk;

-- latihan 1
-- tampilkan semua kolom dari tabel tr_penjualan dengan mengurutkan qty dan tgl_transaksi 1,2,3....
SELECT * FROM tr_penjualan ORDER BY qty, tgl_transaksi;

-- tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan nama pelanggan dengan awalan huruf A ke Z
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan;

-- tampilkan semua kolom dari tabel ms_pelanggan dengan mengurutkan alamat dengan awalan huruf A ke Z
SELECT * FROM ms_pelanggan ORDER BY alamat;

-- ORDER BY ASC  dan DESC
-- ambil nama produk, qty dari tb penjualan urutkan berdasarkan qty besar ke kecil 9,8,7...
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC;

-- ambil nama produk, qty dari tb penjualan urutkan berdasarkan qty besar ke kecil (huruf z,y,x...) dan (5.4.3...)
SELECT nama_produk, qty FROM tr_penjualan ORDER BY qty DESC, nama_produk DESC;

-- latihan 2
-- tampilkan semua kolom dari tabel tr_penjualan dengan mengurutkan qty secara ASC dan tgl_transaksi secara DESC 
SELECT * FROM tr_penjualan ORDER BY qty ASC, tgl_transaksi DESC;

-- menampilkan semua kolom ms pelanggan dengan mengurutkan nama dari besar ke kecil (Z ke A)
SELECT * FROM ms_pelanggan ORDER BY nama_pelanggan DESC;

-- menampilkan semua kolom ms pelanggan dengan mengurutkan alamat dari huruf besar  ke kecil (Z ke A)
SELECT * FROM ms_pelanggan ORDER BY alamat DESC;

-- ORDER BY dari hasil perhitungan
-- ambil nama produk, qty, harga, untuk menghitung total harga perproduk dengan harga di kali qty 
-- dan memberikan nama sementara dari harga di kali qty menjadi total dan mengurutkannanya dari besar ke kecil
SELECT nama_produk, harga, qty, harga*qty as total
FROM tr_penjualan
ORDER BY total DESC;

-- latihan 3
-- Ambil data produk, harga, jumlah, dan diskon persen kemudian menghitung harga di kali qty 
-- dengan mengganti nama menjadi total harga dan total_harga dikurangi diskon (diskon_persen % dari total_harga)
-- mengganti nama menjadi total bayar kemudian mengurutkan total bayar dari yang besar ke kecil 
SELECT nama_produk, harga, qty, diskon_persen, 
(harga * qty) AS total_harga, (harga * qty) - ((diskon_persen / 100) * (harga * qty)) AS total_bayar
FROM tr_penjualan
ORDER BY total_bayar DESC;


--  Menyaring hanya baris data yang memiliki diskon lebih dari 0%
SELECT nama_produk, harga, qty, diskon_persen, 
(harga * qty) AS total_harga, (harga * qty) - ((diskon_persen / 100) * (harga * qty)) AS total_bayar
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY total_bayar DESC;

-- ORDER BY menggunakan WHERE
-- ambil nama produk, qty,  dari tb penjualan dan menyaring yang nama produknya berawalan f urut qty (besar ke kecil)
SELECT nama_produk, qty
FROM tr_penjualan
WHERE nama_produk LIKE 'F%'
ORDER BY qty DESC;

-- latihan 4
-- untuk mengambil semua kolom dari tabel tr penjualan 
-- dan menyaring nilai diskon lebih dari nol dan mengurutkan nilai harga dari besar ke kecil
SELECT *
FROM tr_penjualan
WHERE diskon_persen > 0
ORDER BY harga DESC;

-- mengambil kolom nama produk, qty, dan harga dari tr penjualan dengan menyaring nilai harga 
-- dari 100000 atau lebih dan mengurutkannya dari besar ke kecil
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000
ORDER BY harga DESC;

-- mengambil kolom nama produk, qty dan harga dari kolom tr penjualan dan menyaring harga dari 100000 atau lebih 
-- dan nama produk yang berawalan dari T, terus mengurutkan namanya dari besar ke kecil
SELECT nama_produk, qty, harga
FROM tr_penjualan
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;

-- fungsi agregasi 
-- digunakan untuk mengolah beberapa  baris/row data untuk menghasilkan nilai baru
-- praktek 7

SELECT qty FROM tr_penjualan;
SELECT SUM(qty) FROM tr_penjualan;

-- praktek 8
-- hitung seluruh baris pada tabel penjualan
SELECT * FROM tr_penjualan;
SELECT COUNT(*) FROM tr_penjualan;

-- prakter 9 
-- menggunakan 2 fungsi agregasi dalam satu query sql
SELECT SUM(qty), COUNT(*) FROM tr_penjualan;

-- praktek 10
-- menghitung rata-rata pejualan penjualan tertinggi per transaksi dan penjualan terendah per transaksi
SELECT AVG(qty), MAX(qty), MIN(qty)
FROM tr_penjualan;

-- praktek 11
-- mengkombinasikan fungsi agregasi dengan kolom tertentu (nama produk, kolom tgl transaksi)
SELECT nama_produk, MAX(qty) FROM tr_penjualan;
SELECT tgl_transaksi, nama_produk, MAX(qty) FROM tr_penjualan;

-- praktek 12
-- COUNT(DISTINCT)
-- digunakan untuk menghitung nilai yang unik aja
-- menghitung nilai unik yang ada pada produk di tabel penjualan
SELECT COUNT(nama_produk) FROM tr_penjualan;

-- praktek 13
-- dengan distinct
SELECT COUNT(distinct nama_produk) FROM tr_penjualan;
SELECT COUNT(nama_produk), COUNT(distinct nama_produk) FROM tr_penjualan;


-- GROUP BY
-- mengelompokkan isi data dari satu atau beberapa kolom ,biasanya digabung  dengan fungsi agregasi
-- group by 1 kolom
-- meng
-- praktek 14
SELECT nama_produk FROM tr_penjualan GROUP BY nama_produk;
SELECT nama_produk FROM  tr_penjualan;

-- praktek 15
SELECT nama_produk, qty FROM tr_penjualan
GROUP BY nama_produk, qty;

-- praktek 16 
-- ambil qty berdasarkan nama produk pengelompokan nama produk
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk;

-- praktek 17
-- ambil qty berdasarkan nama produk pengelompokan nama produk urut besar ke kecil
SELECT nama_produk, SUM(qty) FROM tr_penjualan GROUP BY nama_produk ORDER BY SUM(qty) DESC;


-- HAVING
-- praktek 18
-- digunakan sebagai filtering untuk group by dan fungsi agregasi
-- ambil jumlah qty
SELECT nama_produk, SUM(qty)
FROM tr_penjualan
GROUP BY nama_produk
HAVING SUM(qty) > 2
ORDER BY SUM(qty) DESC;

