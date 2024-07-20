-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 20, 2024 at 11:06 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: republ23_santrigo
--

-- --------------------------------------------------------

--
-- Table structure for table chat
--

CREATE TABLE chat (
  id int NOT NULL,
  sender_id int NOT NULL,
  receiver_id int NOT NULL,
  msg varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  photo varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  timesend datetime NOT NULL,
  status enum('read','unread') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table chats
--

CREATE TABLE chats (
  chat_id int NOT NULL,
  from_id int NOT NULL,
  to_id int NOT NULL,
  message text COLLATE utf8mb4_general_ci NOT NULL,
  opened tinyint(1) NOT NULL,
  create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table conversations
--

CREATE TABLE conversations (
  conversation_id int NOT NULL,
  user_1 int NOT NULL,
  user_2 int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table keranjang
--

CREATE TABLE keranjang (
  id int NOT NULL,
  id_member int NOT NULL,
  kd_barang varchar(22) COLLATE utf8mb4_general_ci NOT NULL,
  kd_toko varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  status varchar(12) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_barang
--

CREATE TABLE tabel_barang (
  kd_barang varchar(500) NOT NULL,
  nm_barang varchar(1000) NOT NULL,
  kd_satuan varchar(100) NOT NULL,
  kd_kategori varchar(100) NOT NULL,
  kd_merchant varchar(12) NOT NULL,
  nota varchar(20) NOT NULL,
  kd_supplier varchar(25) NOT NULL,
  kd_toko varchar(10) DEFAULT NULL,
  deskripsi varchar(1000) NOT NULL,
  berat varchar(100) NOT NULL,
  panjang varchar(100) DEFAULT NULL,
  lebar varchar(100) DEFAULT NULL,
  tinggi varchar(100) DEFAULT NULL,
  warna varchar(100) DEFAULT NULL,
  tipe varchar(100) DEFAULT NULL,
  merek varchar(255) DEFAULT NULL,
  hrg_beli varchar(255) NOT NULL,
  hrg_grosir varchar(255) NOT NULL,
  hrg_jual varchar(255) NOT NULL,
  diskon varchar(255) DEFAULT NULL,
  hrg_jual_disk varchar(255) DEFAULT NULL,
  aktif int NOT NULL,
  komisi varchar(50) DEFAULT NULL,
  crtdt datetime DEFAULT NULL,
  crtusr varchar(50) NOT NULL,
  modidt datetime DEFAULT NULL,
  modiusr varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_barang_gambar
--

CREATE TABLE tabel_barang_gambar (
  id_gmbr int NOT NULL,
  id_brg varchar(500) NOT NULL,
  gambar varchar(500) NOT NULL,
  ket varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_bukti_pembayaran
--

CREATE TABLE tabel_bukti_pembayaran (
  id_bukti int NOT NULL,
  tgl_bukti datetime NOT NULL,
  gmb_bukti varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  status int NOT NULL COMMENT '0 check, 1 setuju, 2 gagal',
  bank int NOT NULL,
  no_faktur_pembelian varchar(16) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_comment
--

CREATE TABLE tabel_comment (
  id int NOT NULL,
  nama varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  no_telepon varchar(14) COLLATE utf8mb4_general_ci NOT NULL,
  photo varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  story varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  date datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_comment_barang
--

CREATE TABLE tabel_comment_barang (
  id int NOT NULL,
  id_brg varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  id_member varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  comment tinyblob NOT NULL,
  date datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_delivery_order
--

CREATE TABLE tabel_delivery_order (
  id int NOT NULL,
  nm_lokasi_awal varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  det_lokasi_awal varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  lat_lokasi_awal varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  lng_lokasi_awal varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  nm_lokasi_akhir varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  det_lokasi_akhir varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  lat_lokasi_akhir varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  lng_lokasi_akhir varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  jarak_lokasi float NOT NULL,
  durasi_perjalanan varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  rupiah float NOT NULL,
  jenis_pembayaran varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  kendaraan varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  keterangan varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  tgl_order datetime NOT NULL,
  id_user int NOT NULL,
  nm_member varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  pickup_id_kurir int DEFAULT NULL,
  tgl_pickup datetime DEFAULT NULL,
  pickup_nm_kurir varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  selesai varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  konfirm_selesai varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  sts_batal int DEFAULT NULL,
  tgl_batal datetime DEFAULT NULL,
  ket_batal varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  id_user_batal int DEFAULT NULL,
  user_batal varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_info
--

CREATE TABLE tabel_info (
  id_info int NOT NULL,
  kd_kategori_info int NOT NULL,
  judul varchar(1000) NOT NULL,
  subjudul varchar(100) NOT NULL,
  penulis varchar(100) NOT NULL,
  tanggal varchar(25) NOT NULL,
  informasi varchar(1000) NOT NULL,
  suka varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_info_gambar
--

CREATE TABLE tabel_info_gambar (
  id_gmbr int NOT NULL,
  id_info varchar(500) NOT NULL,
  gambar varchar(500) NOT NULL,
  ket varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_info_pembayaran
--

CREATE TABLE tabel_info_pembayaran (
  id_info_pembayaran int NOT NULL,
  no_rek varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  atas_nama varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  nama_bank varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_kategori_barang
--

CREATE TABLE tabel_kategori_barang (
  kd_kategori int NOT NULL,
  inesial varchar(5) NOT NULL,
  nm_kategori varchar(500) NOT NULL,
  form varchar(25) NOT NULL,
  ikon_kategori varchar(500) NOT NULL DEFAULT 'default_kategori.png',
  varian varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_kategori_info
--

CREATE TABLE tabel_kategori_info (
  kd_kategori_info int NOT NULL,
  nm_kategori_info varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_kategori_pembayaran
--

CREATE TABLE tabel_kategori_pembayaran (
  kd_kategori_pembayaran int NOT NULL,
  nm_kategori_pembayaran varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  urutan int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_keuangan
--

CREATE TABLE tabel_keuangan (
  id_keuangan int NOT NULL,
  id_member int NOT NULL,
  tanggal datetime NOT NULL,
  nominal varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  arus int NOT NULL COMMENT '0:masuk,1:keluar',
  no_faktur_pembelian varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  status int NOT NULL COMMENT '0:Pending,1:ok,2:cancel',
  id_bukti int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_kodepos
--

CREATE TABLE tabel_kodepos (
  id int NOT NULL,
  kelurahan varchar(100) NOT NULL,
  kecamatan varchar(100) NOT NULL,
  kabupaten varchar(100) NOT NULL,
  provinsi varchar(100) NOT NULL,
  kodepos varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table tabel_kurir
--

CREATE TABLE tabel_kurir (
  id_kurir int NOT NULL,
  id_user int NOT NULL,
  nomor_polisi varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  jenis_kendaraan varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  kendaraan varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  kendaraan_tahun varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  ktp varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  sim varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  posisi varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  status int NOT NULL COMMENT '0:nonaktif, 1:aktif, 2=kirim',
  current_active datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_link_produk
--

CREATE TABLE tabel_link_produk (
  id_link int NOT NULL,
  kode_user varchar(500) NOT NULL,
  kd_barang varchar(15) NOT NULL,
  nm_barang varchar(1000) NOT NULL,
  komisi varchar(20) NOT NULL,
  link varchar(1000) NOT NULL,
  aktif int NOT NULL,
  crtdt datetime NOT NULL,
  crtusr varchar(200) NOT NULL,
  modidt datetime DEFAULT NULL,
  modiusr varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_log_transaksi
--

CREATE TABLE tabel_log_transaksi (
  id int NOT NULL,
  no_faktur_pembelian varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  status varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  pembayaran int NOT NULL,
  keterangan varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  crtdt datetime NOT NULL,
  crtusr varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_marketing
--

CREATE TABLE tabel_marketing (
  id_marketing int NOT NULL,
  kode_user int NOT NULL,
  nomor_polisi varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  type_kendaraan varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  tahun_kendaraan varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  ktp varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  sim varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  latitude varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  longitude varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  status int NOT NULL COMMENT '0:nonaktif, 1:aktif, 2=kirim',
  current_active datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_medsos_toko
--

CREATE TABLE tabel_medsos_toko (
  id int NOT NULL,
  id_toko varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  twitter varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  facebook varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  google varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  tiktok varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  instagram varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_member
--

CREATE TABLE tabel_member (
  id_user int NOT NULL,
  kode_user varchar(16) NOT NULL,
  kd_toko varchar(15) DEFAULT NULL,
  tgl_daftar datetime NOT NULL,
  nm_user varchar(25) NOT NULL,
  email_user varchar(100) NOT NULL,
  alamat_user varchar(500) NOT NULL,
  password varchar(35) NOT NULL,
  pass_user varchar(100) NOT NULL,
  foto varchar(500) NOT NULL,
  hp varchar(50) NOT NULL,
  akses varchar(15) NOT NULL,
  stt_user varchar(10) NOT NULL,
  `on` int NOT NULL,
  log varchar(100) NOT NULL,
  bank varchar(150) NOT NULL,
  an_rekening varchar(150) NOT NULL,
  no_rekening varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_member_alamat
--

CREATE TABLE tabel_member_alamat (
  id_alamat int NOT NULL,
  user_id int NOT NULL,
  status int NOT NULL COMMENT 'alamat utama',
  nama_penerima varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  no_telp varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  wilayah varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  label varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  catatan varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  alamat text COLLATE utf8mb4_general_ci NOT NULL,
  latitude varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  longitude varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_merchant
--

CREATE TABLE tabel_merchant (
  kd_merchant int NOT NULL,
  id_user int NOT NULL,
  kode_toko int NOT NULL,
  nm_merchant varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  alamat_merchant varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  ktp varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  siup varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  latitude varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  longitude varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  biaya varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  status int NOT NULL,
  current_active datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_merk_barang
--

CREATE TABLE tabel_merk_barang (
  id_merk int NOT NULL,
  merk varchar(500) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_metode_bayar
--

CREATE TABLE tabel_metode_bayar (
  id_metode int NOT NULL,
  id_bukti_pembayaran varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  status varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_pembayaran
--

CREATE TABLE tabel_pembayaran (
  kd_pembayaran int NOT NULL,
  bank varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  desc_pembayaran varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  kd_kategori_pembayaran int NOT NULL,
  gambar text COLLATE utf8mb4_general_ci NOT NULL,
  biaya_transfer varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  biaya_transfer_persen varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  an_rekening varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  no_rekening varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  upload_bukti int NOT NULL COMMENT 'boolean',
  status int NOT NULL,
  urutan int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_pembelian
--

CREATE TABLE tabel_pembelian (
  id int NOT NULL,
  no_faktur_pembelian varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  kd_supplier varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  tgl_pembelian datetime NOT NULL,
  id_user varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  total_pembelian varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  biaya_pengiriman varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  total_biaya varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  ket varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  status varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  pembayaran int DEFAULT NULL,
  id_bukti int NOT NULL,
  kontak varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  alamat varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  latlng varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  jarak varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  durasi varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  id_kurir int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_pembelian_status
--

CREATE TABLE tabel_pembelian_status (
  id_pembelian_status int NOT NULL,
  kd_pembelian_status varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  nm_pembelian_status varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  icon varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_pembelian_tracking
--

CREATE TABLE tabel_pembelian_tracking (
  id_pembelian_tracking int NOT NULL,
  no_faktur_pembelian varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  id_pembelian_status int NOT NULL,
  tanggal datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_penjualan
--

CREATE TABLE tabel_penjualan (
  id int NOT NULL,
  no_faktur_penjualan varchar(16) NOT NULL,
  kd_supplier varchar(100) DEFAULT NULL,
  tgl_penjualan datetime NOT NULL,
  id_user varchar(10) NOT NULL,
  total_penjualan varchar(100) NOT NULL,
  biaya_pengiriman varchar(100) NOT NULL,
  total_biaya varchar(100) NOT NULL,
  dp varchar(100) NOT NULL,
  sisa varchar(100) NOT NULL,
  ket varchar(100) NOT NULL,
  status varchar(100) NOT NULL,
  nama_penerima varchar(225) DEFAULT NULL,
  kontak varchar(225) DEFAULT NULL,
  alamat varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table tabel_retur
--

CREATE TABLE tabel_retur (
  id int NOT NULL,
  no_faktur_retur varchar(16) NOT NULL,
  kd_barang varchar(100) NOT NULL,
  tgl_retur varchar(100) NOT NULL,
  id_user varchar(10) NOT NULL,
  total_retur varchar(100) NOT NULL,
  ket varchar(100) DEFAULT NULL,
  status varchar(100) DEFAULT NULL,
  crtdt datetime DEFAULT NULL,
  crtusr varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_rinci_pembelian
--

CREATE TABLE tabel_rinci_pembelian (
  id int NOT NULL,
  no_faktur_pembelian varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  kd_barang varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  jumlah varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  harga int NOT NULL,
  sub_total_beli int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_rinci_penjualan
--

CREATE TABLE tabel_rinci_penjualan (
  id int NOT NULL,
  no_faktur_penjualan varchar(16) NOT NULL,
  kd_barang varchar(100) NOT NULL,
  nm_barang varchar(255) NOT NULL,
  no_hp varchar(100) DEFAULT NULL,
  ukuran varchar(100) DEFAULT NULL,
  jumlah varchar(100) NOT NULL,
  stok_awal int NOT NULL,
  harga int NOT NULL,
  sub_total_jual int NOT NULL,
  diskon varchar(25) DEFAULT NULL,
  a_n varchar(50) DEFAULT NULL,
  keterangan varchar(100) DEFAULT NULL,
  stts varchar(50) DEFAULT NULL,
  alamat varchar(100) DEFAULT NULL,
  alamat_akhir varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table tabel_rinci_penjualan_hitung
--

CREATE TABLE tabel_rinci_penjualan_hitung (
  id_hitung int NOT NULL,
  no_faktur_penjualan varchar(250) COLLATE latin1_general_ci NOT NULL,
  kd_barang varchar(1000) COLLATE latin1_general_ci NOT NULL,
  jumlah varchar(100) COLLATE latin1_general_ci NOT NULL,
  harga varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_rinci_retur
--

CREATE TABLE tabel_rinci_retur (
  no_faktur_retur varchar(16) NOT NULL,
  kd_barang varchar(15) NOT NULL,
  nm_barang varchar(30) NOT NULL,
  warna varchar(100) NOT NULL,
  ukuran varchar(100) NOT NULL,
  jumlah int NOT NULL,
  harga varchar(100) NOT NULL,
  sub_total_retur varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_saldo
--

CREATE TABLE tabel_saldo (
  id_saldo int NOT NULL,
  id_user varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  tanggal varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  jumlah int NOT NULL,
  pengeluaran int NOT NULL,
  ket_saldo varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_satuan_barang
--

CREATE TABLE tabel_satuan_barang (
  id_satuan int NOT NULL,
  nm_satuan varchar(500) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_setting_toko
--

CREATE TABLE tabel_setting_toko (
  id_setting int NOT NULL,
  id_user int NOT NULL,
  hari int NOT NULL,
  jam_awal varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  jam_akhir varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  aktif int NOT NULL,
  crtdt datetime NOT NULL,
  crtusr varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  modidt datetime DEFAULT NULL,
  modiusr varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_slide
--

CREATE TABLE tabel_slide (
  id_slide int NOT NULL,
  kat_slide varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  gbr_slide varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  judul_slide varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  ket_slide varchar(1000) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_stok_toko
--

CREATE TABLE tabel_stok_toko (
  id int NOT NULL,
  kd_toko varchar(15) NOT NULL,
  kd_barang varchar(100) DEFAULT NULL,
  stok int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_streaming
--

CREATE TABLE tabel_streaming (
  id_streaming int NOT NULL,
  link varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  status varchar(2) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_supplier
--

CREATE TABLE tabel_supplier (
  kd_supplier varchar(15) NOT NULL,
  tgl_masuk date NOT NULL,
  nama varchar(50) NOT NULL,
  alamat varchar(300) NOT NULL,
  email varchar(50) NOT NULL,
  telepon varchar(15) NOT NULL,
  aktif int NOT NULL,
  keterangan varchar(200) NOT NULL,
  crtdt datetime NOT NULL,
  crtusr varchar(30) NOT NULL,
  modidt datetime NOT NULL,
  modiusr varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_tarif_delivery
--

CREATE TABLE tabel_tarif_delivery (
  id int NOT NULL,
  jenis_order varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  jenis_kendaraan varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  tarif float NOT NULL,
  jarak float NOT NULL,
  berat float NOT NULL,
  aktif int DEFAULT NULL,
  crtdt datetime NOT NULL,
  crtusr varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  modidt datetime DEFAULT NULL,
  modiusr varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table tabel_toko
--

CREATE TABLE tabel_toko (
  kd_toko varchar(15) NOT NULL,
  nm_toko varchar(30) NOT NULL,
  almt_toko varchar(150) NOT NULL,
  kota_toko varchar(50) NOT NULL,
  kecamatan_toko varchar(50) NOT NULL,
  ket_toko text NOT NULL,
  jargon_toko varchar(255) NOT NULL,
  tutor varchar(1000) NOT NULL,
  tlp_toko varchar(15) NOT NULL,
  fax_toko varchar(255) NOT NULL,
  logo varchar(150) NOT NULL,
  logo_header varchar(150) NOT NULL,
  logo_login varchar(150) NOT NULL,
  password varchar(35) NOT NULL,
  pass varchar(500) NOT NULL,
  status varchar(15) NOT NULL,
  tipe varchar(500) NOT NULL,
  headerfooter varchar(255) NOT NULL,
  background varchar(255) NOT NULL,
  tombol varchar(255) NOT NULL,
  latitude varchar(150) NOT NULL,
  longitude varchar(150) NOT NULL,
  konten varchar(255) NOT NULL,
  ketentuan varchar(255) NOT NULL,
  google_map varchar(2000) NOT NULL,
  banner1 varchar(200) NOT NULL,
  banner2 varchar(200) NOT NULL,
  banner3 varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table tabel_ulasan_barang
--

CREATE TABLE tabel_ulasan_barang (
  id int NOT NULL,
  no_faktur_pembelian varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  kd_merchant int NOT NULL,
  kd_toko int NOT NULL,
  kd_barang varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  rating int NOT NULL,
  keterangan varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  crtdt datetime NOT NULL,
  crtusr varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table chat
--
ALTER TABLE chat
  ADD PRIMARY KEY (id);

--
-- Indexes for table chats
--
ALTER TABLE chats
  ADD PRIMARY KEY (chat_id);

--
-- Indexes for table conversations
--
ALTER TABLE conversations
  ADD PRIMARY KEY (conversation_id);

--
-- Indexes for table keranjang
--
ALTER TABLE keranjang
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_barang
--
ALTER TABLE tabel_barang
  ADD PRIMARY KEY (kd_barang) USING BTREE;

--
-- Indexes for table tabel_barang_gambar
--
ALTER TABLE tabel_barang_gambar
  ADD PRIMARY KEY (id_gmbr) USING BTREE;

--
-- Indexes for table tabel_bukti_pembayaran
--
ALTER TABLE tabel_bukti_pembayaran
  ADD PRIMARY KEY (id_bukti);

--
-- Indexes for table tabel_comment
--
ALTER TABLE tabel_comment
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_comment_barang
--
ALTER TABLE tabel_comment_barang
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_delivery_order
--
ALTER TABLE tabel_delivery_order
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_info
--
ALTER TABLE tabel_info
  ADD PRIMARY KEY (id_info) USING BTREE;

--
-- Indexes for table tabel_info_gambar
--
ALTER TABLE tabel_info_gambar
  ADD PRIMARY KEY (id_gmbr) USING BTREE;

--
-- Indexes for table tabel_info_pembayaran
--
ALTER TABLE tabel_info_pembayaran
  ADD PRIMARY KEY (id_info_pembayaran);

--
-- Indexes for table tabel_kategori_barang
--
ALTER TABLE tabel_kategori_barang
  ADD PRIMARY KEY (kd_kategori) USING BTREE;

--
-- Indexes for table tabel_kategori_info
--
ALTER TABLE tabel_kategori_info
  ADD PRIMARY KEY (kd_kategori_info) USING BTREE;

--
-- Indexes for table tabel_kategori_pembayaran
--
ALTER TABLE tabel_kategori_pembayaran
  ADD PRIMARY KEY (kd_kategori_pembayaran);

--
-- Indexes for table tabel_keuangan
--
ALTER TABLE tabel_keuangan
  ADD PRIMARY KEY (id_keuangan);

--
-- Indexes for table tabel_kodepos
--
ALTER TABLE tabel_kodepos
  ADD PRIMARY KEY (id),
  ADD KEY ixkodepos (kodepos);

--
-- Indexes for table tabel_kurir
--
ALTER TABLE tabel_kurir
  ADD PRIMARY KEY (id_kurir);

--
-- Indexes for table tabel_link_produk
--
ALTER TABLE tabel_link_produk
  ADD PRIMARY KEY (id_link);

--
-- Indexes for table tabel_log_transaksi
--
ALTER TABLE tabel_log_transaksi
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_marketing
--
ALTER TABLE tabel_marketing
  ADD PRIMARY KEY (id_marketing);

--
-- Indexes for table tabel_medsos_toko
--
ALTER TABLE tabel_medsos_toko
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_member
--
ALTER TABLE tabel_member
  ADD PRIMARY KEY (id_user) USING BTREE;

--
-- Indexes for table tabel_member_alamat
--
ALTER TABLE tabel_member_alamat
  ADD PRIMARY KEY (id_alamat);

--
-- Indexes for table tabel_merchant
--
ALTER TABLE tabel_merchant
  ADD PRIMARY KEY (kd_merchant);

--
-- Indexes for table tabel_merk_barang
--
ALTER TABLE tabel_merk_barang
  ADD PRIMARY KEY (id_merk);

--
-- Indexes for table tabel_metode_bayar
--
ALTER TABLE tabel_metode_bayar
  ADD PRIMARY KEY (id_metode);

--
-- Indexes for table tabel_pembayaran
--
ALTER TABLE tabel_pembayaran
  ADD PRIMARY KEY (kd_pembayaran);

--
-- Indexes for table tabel_pembelian
--
ALTER TABLE tabel_pembelian
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_pembelian_status
--
ALTER TABLE tabel_pembelian_status
  ADD PRIMARY KEY (id_pembelian_status);

--
-- Indexes for table tabel_pembelian_tracking
--
ALTER TABLE tabel_pembelian_tracking
  ADD PRIMARY KEY (id_pembelian_tracking);

--
-- Indexes for table tabel_penjualan
--
ALTER TABLE tabel_penjualan
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_retur
--
ALTER TABLE tabel_retur
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_rinci_pembelian
--
ALTER TABLE tabel_rinci_pembelian
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_rinci_penjualan
--
ALTER TABLE tabel_rinci_penjualan
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_rinci_penjualan_hitung
--
ALTER TABLE tabel_rinci_penjualan_hitung
  ADD PRIMARY KEY (id_hitung);

--
-- Indexes for table tabel_saldo
--
ALTER TABLE tabel_saldo
  ADD PRIMARY KEY (id_saldo);

--
-- Indexes for table tabel_satuan_barang
--
ALTER TABLE tabel_satuan_barang
  ADD PRIMARY KEY (id_satuan);

--
-- Indexes for table tabel_setting_toko
--
ALTER TABLE tabel_setting_toko
  ADD PRIMARY KEY (id_setting);

--
-- Indexes for table tabel_slide
--
ALTER TABLE tabel_slide
  ADD PRIMARY KEY (id_slide);

--
-- Indexes for table tabel_stok_toko
--
ALTER TABLE tabel_stok_toko
  ADD PRIMARY KEY (id) USING BTREE;

--
-- Indexes for table tabel_streaming
--
ALTER TABLE tabel_streaming
  ADD PRIMARY KEY (id_streaming);

--
-- Indexes for table tabel_supplier
--
ALTER TABLE tabel_supplier
  ADD PRIMARY KEY (kd_supplier) USING BTREE;

--
-- Indexes for table tabel_tarif_delivery
--
ALTER TABLE tabel_tarif_delivery
  ADD PRIMARY KEY (id);

--
-- Indexes for table tabel_toko
--
ALTER TABLE tabel_toko
  ADD PRIMARY KEY (kd_toko) USING BTREE;

--
-- Indexes for table tabel_ulasan_barang
--
ALTER TABLE tabel_ulasan_barang
  ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table chat
--
ALTER TABLE chat
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table chats
--
ALTER TABLE chats
  MODIFY chat_id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table conversations
--
ALTER TABLE conversations
  MODIFY conversation_id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table keranjang
--
ALTER TABLE keranjang
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_barang_gambar
--
ALTER TABLE tabel_barang_gambar
  MODIFY id_gmbr int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_bukti_pembayaran
--
ALTER TABLE tabel_bukti_pembayaran
  MODIFY id_bukti int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_comment
--
ALTER TABLE tabel_comment
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_comment_barang
--
ALTER TABLE tabel_comment_barang
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_delivery_order
--
ALTER TABLE tabel_delivery_order
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_info
--
ALTER TABLE tabel_info
  MODIFY id_info int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_info_gambar
--
ALTER TABLE tabel_info_gambar
  MODIFY id_gmbr int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_info_pembayaran
--
ALTER TABLE tabel_info_pembayaran
  MODIFY id_info_pembayaran int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_kategori_barang
--
ALTER TABLE tabel_kategori_barang
  MODIFY kd_kategori int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_kategori_info
--
ALTER TABLE tabel_kategori_info
  MODIFY kd_kategori_info int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_kategori_pembayaran
--
ALTER TABLE tabel_kategori_pembayaran
  MODIFY kd_kategori_pembayaran int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_keuangan
--
ALTER TABLE tabel_keuangan
  MODIFY id_keuangan int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_kodepos
--
ALTER TABLE tabel_kodepos
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_kurir
--
ALTER TABLE tabel_kurir
  MODIFY id_kurir int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_link_produk
--
ALTER TABLE tabel_link_produk
  MODIFY id_link int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_log_transaksi
--
ALTER TABLE tabel_log_transaksi
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_marketing
--
ALTER TABLE tabel_marketing
  MODIFY id_marketing int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_medsos_toko
--
ALTER TABLE tabel_medsos_toko
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_member
--
ALTER TABLE tabel_member
  MODIFY id_user int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_member_alamat
--
ALTER TABLE tabel_member_alamat
  MODIFY id_alamat int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_merchant
--
ALTER TABLE tabel_merchant
  MODIFY kd_merchant int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_merk_barang
--
ALTER TABLE tabel_merk_barang
  MODIFY id_merk int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_metode_bayar
--
ALTER TABLE tabel_metode_bayar
  MODIFY id_metode int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_pembayaran
--
ALTER TABLE tabel_pembayaran
  MODIFY kd_pembayaran int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_pembelian
--
ALTER TABLE tabel_pembelian
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_pembelian_status
--
ALTER TABLE tabel_pembelian_status
  MODIFY id_pembelian_status int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_pembelian_tracking
--
ALTER TABLE tabel_pembelian_tracking
  MODIFY id_pembelian_tracking int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_penjualan
--
ALTER TABLE tabel_penjualan
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_retur
--
ALTER TABLE tabel_retur
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_rinci_pembelian
--
ALTER TABLE tabel_rinci_pembelian
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_rinci_penjualan
--
ALTER TABLE tabel_rinci_penjualan
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_rinci_penjualan_hitung
--
ALTER TABLE tabel_rinci_penjualan_hitung
  MODIFY id_hitung int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_saldo
--
ALTER TABLE tabel_saldo
  MODIFY id_saldo int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_satuan_barang
--
ALTER TABLE tabel_satuan_barang
  MODIFY id_satuan int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_setting_toko
--
ALTER TABLE tabel_setting_toko
  MODIFY id_setting int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_slide
--
ALTER TABLE tabel_slide
  MODIFY id_slide int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_stok_toko
--
ALTER TABLE tabel_stok_toko
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_streaming
--
ALTER TABLE tabel_streaming
  MODIFY id_streaming int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_tarif_delivery
--
ALTER TABLE tabel_tarif_delivery
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table tabel_ulasan_barang
--
ALTER TABLE tabel_ulasan_barang
  MODIFY id int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;