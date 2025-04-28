CREATE DATABASE toko_elektronik;
USE toko_elektronik;

-- TABEL CUSTOMER
CREATE TABLE CUSTOMER (
    id_pelanggan VARCHAR(10),
    nama VARCHAR(100),
    tanggal_lahir DATETIME,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'),
    no_hp VARCHAR(15)
);

-- TABEL PRODUK
CREATE TABLE PRODUK (
    id_produk VARCHAR(10),
    nama_produk VARCHAR(25),
    merek VARCHAR(50),
    model VARCHAR(50),
    warna VARCHAR(30),
    harga INT,
    kategori_produk VARCHAR(50)
);

-- TABEL KARYAWAN
CREATE TABLE KARYAWAN (
    id_karyawan VARCHAR(10),
    nama VARCHAR(100),
    tanggal_lahir DATETIME,
    email VARCHAR(100),
    no_hp VARCHAR(15),
    jenis_kelamin ENUM('Laki-laki', 'Perempuan')
);

-- TABEL PENGIRIMAN
CREATE TABLE PENGIRIMAN (
    no_pelacakan VARCHAR(50),
    id_karyawan VARCHAR(10),
    id_pelanggan VARCHAR(10),
    status_pengiriman VARCHAR(50),
    jasa_pengiriman VARCHAR(100),
    metode_pengiriman VARCHAR(50),
    tgl_waktu_pengiriman DATETIME,
    nama VARCHAR(100)
);

-- TABEL PEMBELIAN
CREATE TABLE PEMBELIAN (
    id_pembelian VARCHAR(10) PRIMARY KEY,
    id_pelanggan VARCHAR(10),
    id_produk VARCHAR(10),
    tanggal_beli DATETIME
);

-- RELASI antara PEMBELIAN dan CUSTOMER
ALTER TABLE PEMBELIAN
ADD CONSTRAINT fk_pembeli_customer
FOREIGN KEY (id_pelanggan) REFERENCES CUSTOMER(id_pelanggan);

-- RELASI antara PEMBELIAN dan PRODUK
ALTER TABLE PEMBELIAN
ADD CONSTRAINT fk_pembelian_produk
FOREIGN KEY (id_produk) REFERENCES PRODUK(id_produk);

-- RELASI antara PENGIRIMAN dan CUSTOMER
ALTER TABLE PENGIRIMAN
ADD CONSTRAINT fk_pengiriman_customer
FOREIGN KEY (id_pelanggan) REFERENCES CUSTOMER(id_pelanggan);

-- RELASI antara PENGIRIMAN dan KARYAWAN
ALTER TABLE PENGIRIMAN
ADD CONSTRAINT fk_pengiriman_karyawan
FOREIGN KEY (id_karyawan) REFERENCES KARYAWAN(id_karyawan);

-- Data Customer
INSERT INTO CUSTOMER (id_pelanggan, nama, tanggal_lahir, jenis_kelamin) 
VALUES ('C001', 'M.Fathih Al-Azzam', '2004-05-12 00:00:00', 'Laki-laki', '081234567890'),
('C002', 'Siti Aminah', '1995-08-20 00:00:00', 'Perempuan', '082134567891'),
('C003', 'Maulana Ihsan', '2005-02-15 00:00:00', 'Laki-laki', '083134567892'),
('C004', 'Dewi Lestari', '1993-07-10 00:00:00', 'Perempuan', '084134567893'),
('C005', 'Rizal', '2006-11-25 00:00:00', 'Laki-laki', '085134567894');

-- Data Produk
INSERT INTO PRODUK (id_produk, nama_produk, merek, model, warna, harga, kategori_produk) 
VALUES ('P001', 'Kulkas 2 Pintu', 'LG', 'GN-B202SQBB', 'Silver', 3500000, 'Elektronik Rumah Tangga'),
('P002', 'Smart TV 43 Inch', 'Samsung', 'UA43T6000', 'Hitam', 4200000, 'Televisi'),
('P003', 'Laptop 14 Inch', 'Infinix', 'A416MA', 'Merah', 5200000, 'Komputer & Laptop'),
('P004', 'AC 1PK', 'Panasonic', 'CS-LN5WKJ', 'Putih', 3700000, 'Elektronik Rumah Tangga'),
('P005', 'Speaker Bluetooth', 'JBL', 'Flip 5', 'Hitam', 1200000, 'Aksesoris');

-- Data Karyawan
INSERT INTO KARYAWAN (id_karyawan, nama, tanggal_lahir, email, no_hp, jenis_kelamin) 
VALUES ('K001', 'M. Sahrul Azam', '2005-04-14 00:00:00', 'sahrul@toko.com', '081234500001', 'laki-laki'),
('K002', 'Ilham Parhadi', '2004-03-10 00:00:00', 'ilham@toko.com', '081234500002', 'Laki-laki'),
('K003', 'Haeril Rapli', '2004-06-21 00:00:00', 'haeril@toko.com', '081234500003', 'laki-laki'),
('K004', 'Arbiyan', '2005-09-13 00:00:00', 'Arbi@toko.com', '081234500004', 'Laki-laki'),
('K005', 'Lalu Masuud', '2005-01-30 00:00:00', 'masuud@toko.com', '081234500005', 'Laki-laki');

-- Data Pengiriman
INSERT INTO PENGIRIMAN ( no_pelacak, id_karyawan, id_pelanggan, status_pengiriman, jasa_pengiriman, metode_pengiriman, tgl_waktu_pengiriman, nama) 
VALUES ('TRX001', 'K001', 'C001', 'Terkirim', 'JNE', 'Reguler', '2025-04-01 10:00:00', 'M.Fathih Al-Azzam'),
('TRX002', 'K002', 'C002', 'Dalam Perjalanan', 'J&T Express', 'Ekspres', '2025-04-03 15:00:00', 'Siti Aminah'),
('TRX003', 'K003', 'C003', 'Terkirim', 'SiCepat', 'Reguler', '2025-04-04 09:00:00', 'Maulana Ihsan'),
('TRX004', 'K004', 'C004', 'Dikemas', 'Ninja Xpress', 'Same Day', '2025-04-05 13:30:00', 'Dewi Lestari'),
('TRX005', 'K005', 'C005', 'Terkirim', 'Pos Indonesia', 'Reguler', '2025-04-06 11:45:00', 'Rizal');

-- Data Pembelian
INSERT INTO PEMBELIAN (id_pembeli, id_pelanggan, id_produk, tanggal_beli) 
VALUES ('B001', 'C001', 'P001', '2025-04-01 09:00:00'),
('B002', 'C002', 'P002', '2025-04-02 11:30:00'),
('B003', 'C003', 'P003', '2025-04-03 14:15:00'),
('B004', 'C004', 'P004', '2025-04-04 12:00:00'),
('B005', 'C005', 'P005', '2025-04-05 16:20:00');

-- cek semua data
SELECT * FROM CUSTOMER;
SELECT * FROM PRODUK;
SELECT * FROM KARYAWAN;
SELECT * FROM PENGIRIMAN;
SELECT * FROM PEMBELIAN;



-- Untuk melihat struktur tabel PRODUK
DESCRIBE PRODUK;

-- untuk mengambil satu kolom data dari table produk
-- Menampilkan semua data dari kolom merek pada tabel PRODUK
SELECT merek FROM PRODUK;

-- untuk mengambil lebih dari satu kolom dengan pemisah tanda koma
-- Menampilkan dua kolom yaitu model dan warna dari tabel PRODUK
SELECT model,warna FROM PRODUK;

-- PREFIX
-- Mengambil kolom harga dari tabel PRODUK, menggunakan prefix PRODUK. untuk memperjelas sumber kolom.
SELECT PRODUK.harga FROM PRODUK;

-- mengambil nama_produk dari tabel PRODUK yang ada di database toko_elektronik.
SELECT toko_elektronik.PRODUK.nama_produk FROM PRODUK;


-- Mengambil koloM nama dari tabel CUSTOMER, menggunakan prefix CUSTOMER. untuk memperjelas sumber kolom.
SELECT CUSTOMER.nama FROM CUSTOMER;


-- ALIAS
-- Mengambil kolom kategori_produk, lalu mengganti nama kolom hasilnya menjadi kp di tampilan output.
-- Alias adalah nama lain atau nama samaran yang kita buat
SELECT kategori_produk AS kp FROM PRODUK;

-- membuat alias kp untuk kolom kategori_produk, tetapi tanpa menulis AS.
SELECT kategori_produk kp FROM PRODUK;

-- Memberi alias atau nama samaran PRDK pada tabel PRODUK
SELECT kategori_produk FROM PRODUK AS PRDK;

-- Mengambil kolom kategori_produk dari tabel yang sudah di-alias sebagai PRDK
-- penulisan PRDK.kategori_produk memperjelas bahwa kolom itu berasal dari alias tabel PRDK
SELECT PRDK.kategori_produk FROM PRODUK AS PRDK;
