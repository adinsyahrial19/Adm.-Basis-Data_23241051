-- Nama 	: Adin Syahrial
-- NIM		: 23241051
-- Kelas	: B 
-- Modul	: 2 (select)

-- 	membuat database
CREATE DATABASE PTI_mart;
USE PTI_mart;

-- ek kolom dalam setiap tabel
DESCRIBE ms_pelanggan;
DESCRIBE ms_produk;
DESCRIBE tr_penjualan;

-- select
-- menggunakan select untuk satu tabel
-- mengambil kolom nama produk dari tabel produk

-- sql ambilkan saya data dari tabel produk
SELECT nama_produk FROM ms_produk;

-- mengambil lebih dari satu kolom dari sebuah tabel
SELECT nama_produk,harga FROM ms_produk;

-- mengambil sebuah kolom dari tabel
SELECT * FROM ms_produk;

-- laitihan 
-- mengambil kode produk dan nama produk dari tabel produk
SELECT kode_produk, nama_produk FROM ms_produk;

-- mengambil seluruh dari tabel penjualan
SELECT * FROM tr_penjualan;

-- FREPIX dan ALIAS
-- FREFIX, bagian objek database yang hirarkinya lebih tinggi
-- 
SELECT ms_produk.nama_produk FROM ms_produk;

-- menggunakan nama database
SELECT PTI_mart.ms_produk.nama_produk FROM ms_produk;

-- ALIAS 
-- nama sementara yang digunakan
-- menganti nama sementara kolom nama produk dengan alias
SELECT nama_produk AS np FROM ms_produk;
SELECT nama_produk np FROM ms_produk;

-- mengganti semntara tabel dengan alias
SELECT nama_produk FROM ms_produk AS msp;

-- kombinasikan frepix dan alias
SELECT msp.nama_produk FROM ms_produk AS msp;

-- CASE 1
SELECT nama_pelanggan, alamat FROM ms_pelanggan;

-- CASE 2
SELECT nama_produk, harga FROM ms_produk;