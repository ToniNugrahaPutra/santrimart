-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: republ23_santrigo
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `msg` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `timesend` datetime NOT NULL,
  `status` enum('read','unread') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'unread',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `from_id` int NOT NULL,
  `to_id` int NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `conversation_id` int NOT NULL AUTO_INCREMENT,
  `user_1` int NOT NULL,
  `user_2` int NOT NULL,
  PRIMARY KEY (`conversation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keranjang`
--

DROP TABLE IF EXISTS `keranjang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keranjang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_member` int NOT NULL,
  `kd_barang` varchar(22) COLLATE utf8mb4_general_ci NOT NULL,
  `kd_toko` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_barang`
--

DROP TABLE IF EXISTS `tabel_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_barang` (
  `kd_barang` varchar(500) NOT NULL,
  `nm_barang` varchar(1000) NOT NULL,
  `kd_satuan` varchar(100) NOT NULL,
  `kd_kategori` varchar(100) NOT NULL,
  `kd_merchant` varchar(12) NOT NULL,
  `nota` varchar(20) NOT NULL,
  `kd_supplier` varchar(25) NOT NULL,
  `kd_toko` varchar(10) DEFAULT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `berat` varchar(100) NOT NULL,
  `panjang` varchar(100) DEFAULT NULL,
  `lebar` varchar(100) DEFAULT NULL,
  `tinggi` varchar(100) DEFAULT NULL,
  `warna` varchar(100) DEFAULT NULL,
  `tipe` varchar(100) DEFAULT NULL,
  `merek` varchar(255) DEFAULT NULL,
  `hrg_beli` varchar(255) NOT NULL,
  `hrg_grosir` varchar(255) NOT NULL,
  `hrg_jual` varchar(255) NOT NULL,
  `diskon` varchar(255) DEFAULT NULL,
  `hrg_jual_disk` varchar(255) DEFAULT NULL,
  `aktif` int NOT NULL,
  `komisi` varchar(50) DEFAULT NULL,
  `crtdt` datetime DEFAULT NULL,
  `crtusr` varchar(50) NOT NULL,
  `modidt` datetime DEFAULT NULL,
  `modiusr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_barang`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_barang_gambar`
--

DROP TABLE IF EXISTS `tabel_barang_gambar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_barang_gambar` (
  `id_gmbr` int NOT NULL AUTO_INCREMENT,
  `id_brg` varchar(500) NOT NULL,
  `gambar` varchar(500) NOT NULL,
  `ket` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_gmbr`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=264 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_bukti_pembayaran`
--

DROP TABLE IF EXISTS `tabel_bukti_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_bukti_pembayaran` (
  `id_bukti` int NOT NULL AUTO_INCREMENT,
  `tgl_bukti` datetime NOT NULL,
  `gmb_bukti` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL COMMENT '0 check, 1 setuju, 2 gagal',
  `bank` int NOT NULL,
  `no_faktur_pembelian` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_bukti`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_comment`
--

DROP TABLE IF EXISTS `tabel_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `no_telepon` varchar(14) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `story` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_comment_barang`
--

DROP TABLE IF EXISTS `tabel_comment_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_comment_barang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_brg` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `id_member` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `comment` tinyblob NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_delivery_order`
--

DROP TABLE IF EXISTS `tabel_delivery_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_delivery_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_lokasi_awal` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `det_lokasi_awal` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `lat_lokasi_awal` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `lng_lokasi_awal` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nm_lokasi_akhir` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `det_lokasi_akhir` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `lat_lokasi_akhir` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `lng_lokasi_akhir` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `jarak_lokasi` float NOT NULL,
  `durasi_perjalanan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `rupiah` float NOT NULL,
  `jenis_pembayaran` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `kendaraan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_order` datetime NOT NULL,
  `id_user` int NOT NULL,
  `nm_member` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `pickup_id_kurir` int DEFAULT NULL,
  `tgl_pickup` datetime DEFAULT NULL,
  `pickup_nm_kurir` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `selesai` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `konfirm_selesai` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sts_batal` int DEFAULT NULL,
  `tgl_batal` datetime DEFAULT NULL,
  `ket_batal` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_user_batal` int DEFAULT NULL,
  `user_batal` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_info`
--

DROP TABLE IF EXISTS `tabel_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_info` (
  `id_info` int NOT NULL AUTO_INCREMENT,
  `kd_kategori_info` int NOT NULL,
  `judul` varchar(1000) NOT NULL,
  `subjudul` varchar(100) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `tanggal` varchar(25) NOT NULL,
  `informasi` varchar(1000) NOT NULL,
  `suka` varchar(255) NOT NULL,
  PRIMARY KEY (`id_info`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_info_gambar`
--

DROP TABLE IF EXISTS `tabel_info_gambar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_info_gambar` (
  `id_gmbr` int NOT NULL AUTO_INCREMENT,
  `id_info` varchar(500) NOT NULL,
  `gambar` varchar(500) NOT NULL,
  `ket` varchar(1000) NOT NULL,
  PRIMARY KEY (`id_gmbr`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_info_pembayaran`
--

DROP TABLE IF EXISTS `tabel_info_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_info_pembayaran` (
  `id_info_pembayaran` int NOT NULL AUTO_INCREMENT,
  `no_rek` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `atas_nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_bank` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_info_pembayaran`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_kategori_barang`
--

DROP TABLE IF EXISTS `tabel_kategori_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_kategori_barang` (
  `kd_kategori` int NOT NULL AUTO_INCREMENT,
  `inesial` varchar(5) NOT NULL,
  `nm_kategori` varchar(500) NOT NULL,
  `form` varchar(25) NOT NULL,
  `ikon_kategori` varchar(500) NOT NULL DEFAULT 'default_kategori.png',
  `varian` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`kd_kategori`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_kategori_info`
--

DROP TABLE IF EXISTS `tabel_kategori_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_kategori_info` (
  `kd_kategori_info` int NOT NULL AUTO_INCREMENT,
  `nm_kategori_info` varchar(500) NOT NULL,
  PRIMARY KEY (`kd_kategori_info`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_kategori_pembayaran`
--

DROP TABLE IF EXISTS `tabel_kategori_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_kategori_pembayaran` (
  `kd_kategori_pembayaran` int NOT NULL AUTO_INCREMENT,
  `nm_kategori_pembayaran` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `urutan` int NOT NULL,
  PRIMARY KEY (`kd_kategori_pembayaran`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_keuangan`
--

DROP TABLE IF EXISTS `tabel_keuangan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_keuangan` (
  `id_keuangan` int NOT NULL AUTO_INCREMENT,
  `id_member` int NOT NULL,
  `tanggal` datetime NOT NULL,
  `nominal` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `arus` int NOT NULL COMMENT '0:masuk,1:keluar',
  `no_faktur_pembelian` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL COMMENT '0:Pending,1:ok,2:cancel',
  `id_bukti` int NOT NULL,
  PRIMARY KEY (`id_keuangan`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_kodepos`
--

DROP TABLE IF EXISTS `tabel_kodepos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_kodepos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kabupaten` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `kodepos` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ixkodepos` (`kodepos`)
) ENGINE=InnoDB AUTO_INCREMENT=69499 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_kurir`
--

DROP TABLE IF EXISTS `tabel_kurir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_kurir` (
  `id_kurir` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `nomor_polisi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kendaraan` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `kendaraan` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `kendaraan_tahun` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `ktp` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `sim` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `posisi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL COMMENT '0:nonaktif, 1:aktif, 2=kirim',
  `current_active` datetime NOT NULL,
  PRIMARY KEY (`id_kurir`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_link_produk`
--

DROP TABLE IF EXISTS `tabel_link_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_link_produk` (
  `id_link` int NOT NULL AUTO_INCREMENT,
  `kode_user` varchar(500) NOT NULL,
  `kd_barang` varchar(15) NOT NULL,
  `nm_barang` varchar(1000) NOT NULL,
  `komisi` varchar(20) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `aktif` int NOT NULL,
  `crtdt` datetime NOT NULL,
  `crtusr` varchar(200) NOT NULL,
  `modidt` datetime DEFAULT NULL,
  `modiusr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_link`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_log_transaksi`
--

DROP TABLE IF EXISTS `tabel_log_transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_log_transaksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_faktur_pembelian` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pembayaran` int NOT NULL,
  `keterangan` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `crtdt` datetime NOT NULL,
  `crtusr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_marketing`
--

DROP TABLE IF EXISTS `tabel_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_marketing` (
  `id_marketing` int NOT NULL AUTO_INCREMENT,
  `kode_user` int NOT NULL,
  `nomor_polisi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `type_kendaraan` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_kendaraan` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `ktp` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `sim` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL COMMENT '0:nonaktif, 1:aktif, 2=kirim',
  `current_active` datetime NOT NULL,
  PRIMARY KEY (`id_marketing`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_medsos_toko`
--

DROP TABLE IF EXISTS `tabel_medsos_toko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_medsos_toko` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_toko` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `twitter` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `facebook` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `google` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tiktok` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `instagram` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_member`
--

DROP TABLE IF EXISTS `tabel_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_member` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `kode_user` varchar(16) NOT NULL,
  `kd_toko` varchar(15) DEFAULT NULL,
  `tgl_daftar` datetime NOT NULL,
  `nm_user` varchar(25) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `alamat_user` varchar(500) NOT NULL,
  `password` varchar(35) NOT NULL,
  `pass_user` varchar(100) NOT NULL,
  `foto` varchar(500) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `akses` varchar(15) NOT NULL,
  `stt_user` varchar(10) NOT NULL,
  `on` int NOT NULL,
  `log` varchar(100) NOT NULL,
  `bank` varchar(150) NOT NULL,
  `an_rekening` varchar(150) NOT NULL,
  `no_rekening` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_member_alamat`
--

DROP TABLE IF EXISTS `tabel_member_alamat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_member_alamat` (
  `id_alamat` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `status` int NOT NULL COMMENT 'alamat utama',
  `nama_penerima` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `wilayah` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_alamat`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_merchant`
--

DROP TABLE IF EXISTS `tabel_merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_merchant` (
  `kd_merchant` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `kode_toko` int NOT NULL,
  `nm_merchant` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_merchant` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `ktp` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `siup` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `current_active` datetime NOT NULL,
  PRIMARY KEY (`kd_merchant`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_merk_barang`
--

DROP TABLE IF EXISTS `tabel_merk_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_merk_barang` (
  `id_merk` int NOT NULL AUTO_INCREMENT,
  `merk` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_merk`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_metode_bayar`
--

DROP TABLE IF EXISTS `tabel_metode_bayar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_metode_bayar` (
  `id_metode` int NOT NULL AUTO_INCREMENT,
  `id_bukti_pembayaran` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_metode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_pembayaran`
--

DROP TABLE IF EXISTS `tabel_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_pembayaran` (
  `kd_pembayaran` int NOT NULL AUTO_INCREMENT,
  `bank` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `desc_pembayaran` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `kd_kategori_pembayaran` int NOT NULL,
  `gambar` text COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_transfer` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_transfer_persen` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `an_rekening` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `no_rekening` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `upload_bukti` int NOT NULL COMMENT 'boolean',
  `status` int NOT NULL,
  `urutan` int NOT NULL,
  PRIMARY KEY (`kd_pembayaran`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_pembelian`
--

DROP TABLE IF EXISTS `tabel_pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_pembelian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_faktur_pembelian` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `kd_supplier` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tgl_pembelian` datetime NOT NULL,
  `id_user` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `total_pembelian` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_pengiriman` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `total_biaya` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `ket` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `pembayaran` int DEFAULT NULL,
  `id_bukti` int NOT NULL,
  `kontak` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latlng` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jarak` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `durasi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `id_kurir` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_pembelian_status`
--

DROP TABLE IF EXISTS `tabel_pembelian_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_pembelian_status` (
  `id_pembelian_status` int NOT NULL AUTO_INCREMENT,
  `kd_pembelian_status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nm_pembelian_status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_pembelian_status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_pembelian_tracking`
--

DROP TABLE IF EXISTS `tabel_pembelian_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_pembelian_tracking` (
  `id_pembelian_tracking` int NOT NULL AUTO_INCREMENT,
  `no_faktur_pembelian` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pembelian_status` int NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id_pembelian_tracking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_penjualan`
--

DROP TABLE IF EXISTS `tabel_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_penjualan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_faktur_penjualan` varchar(16) NOT NULL,
  `kd_supplier` varchar(100) DEFAULT NULL,
  `tgl_penjualan` datetime NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `total_penjualan` varchar(100) NOT NULL,
  `biaya_pengiriman` varchar(100) NOT NULL,
  `total_biaya` varchar(100) NOT NULL,
  `dp` varchar(100) NOT NULL,
  `sisa` varchar(100) NOT NULL,
  `ket` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `nama_penerima` varchar(225) DEFAULT NULL,
  `kontak` varchar(225) DEFAULT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_retur`
--

DROP TABLE IF EXISTS `tabel_retur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_retur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_faktur_retur` varchar(16) NOT NULL,
  `kd_barang` varchar(100) NOT NULL,
  `tgl_retur` varchar(100) NOT NULL,
  `id_user` varchar(10) NOT NULL,
  `total_retur` varchar(100) NOT NULL,
  `ket` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `crtdt` datetime DEFAULT NULL,
  `crtusr` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_rinci_pembelian`
--

DROP TABLE IF EXISTS `tabel_rinci_pembelian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_rinci_pembelian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_faktur_pembelian` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `kd_barang` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `harga` int NOT NULL,
  `sub_total_beli` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_rinci_penjualan`
--

DROP TABLE IF EXISTS `tabel_rinci_penjualan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_rinci_penjualan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_faktur_penjualan` varchar(16) NOT NULL,
  `kd_barang` varchar(100) NOT NULL,
  `nm_barang` varchar(255) NOT NULL,
  `no_hp` varchar(100) DEFAULT NULL,
  `ukuran` varchar(100) DEFAULT NULL,
  `jumlah` varchar(100) NOT NULL,
  `stok_awal` int NOT NULL,
  `harga` int NOT NULL,
  `sub_total_jual` int NOT NULL,
  `diskon` varchar(25) DEFAULT NULL,
  `a_n` varchar(50) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `stts` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `alamat_akhir` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_rinci_penjualan_hitung`
--

DROP TABLE IF EXISTS `tabel_rinci_penjualan_hitung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_rinci_penjualan_hitung` (
  `id_hitung` int NOT NULL AUTO_INCREMENT,
  `no_faktur_penjualan` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `kd_barang` varchar(1000) COLLATE latin1_general_ci NOT NULL,
  `jumlah` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `harga` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id_hitung`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_rinci_retur`
--

DROP TABLE IF EXISTS `tabel_rinci_retur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_rinci_retur` (
  `no_faktur_retur` varchar(16) NOT NULL,
  `kd_barang` varchar(15) NOT NULL,
  `nm_barang` varchar(30) NOT NULL,
  `warna` varchar(100) NOT NULL,
  `ukuran` varchar(100) NOT NULL,
  `jumlah` int NOT NULL,
  `harga` varchar(100) NOT NULL,
  `sub_total_retur` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_saldo`
--

DROP TABLE IF EXISTS `tabel_saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_saldo` (
  `id_saldo` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` int NOT NULL,
  `pengeluaran` int NOT NULL,
  `ket_saldo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_saldo`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_satuan_barang`
--

DROP TABLE IF EXISTS `tabel_satuan_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_satuan_barang` (
  `id_satuan` int NOT NULL AUTO_INCREMENT,
  `nm_satuan` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_setting_toko`
--

DROP TABLE IF EXISTS `tabel_setting_toko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_setting_toko` (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `hari` int NOT NULL,
  `jam_awal` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `jam_akhir` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `aktif` int NOT NULL,
  `crtdt` datetime NOT NULL,
  `crtusr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `modidt` datetime DEFAULT NULL,
  `modiusr` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_setting`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_slide`
--

DROP TABLE IF EXISTS `tabel_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_slide` (
  `id_slide` int NOT NULL AUTO_INCREMENT,
  `kat_slide` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `gbr_slide` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `judul_slide` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `ket_slide` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_slide`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_stok_toko`
--

DROP TABLE IF EXISTS `tabel_stok_toko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_stok_toko` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_toko` varchar(15) NOT NULL,
  `kd_barang` varchar(100) DEFAULT NULL,
  `stok` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_streaming`
--

DROP TABLE IF EXISTS `tabel_streaming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_streaming` (
  `id_streaming` int NOT NULL AUTO_INCREMENT,
  `link` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_streaming`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_supplier`
--

DROP TABLE IF EXISTS `tabel_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_supplier` (
  `kd_supplier` varchar(15) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `aktif` int NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `crtdt` datetime NOT NULL,
  `crtusr` varchar(30) NOT NULL,
  `modidt` datetime NOT NULL,
  `modiusr` varchar(30) NOT NULL,
  PRIMARY KEY (`kd_supplier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_tarif_delivery`
--

DROP TABLE IF EXISTS `tabel_tarif_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_tarif_delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jenis_order` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_kendaraan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tarif` float NOT NULL,
  `jarak` float NOT NULL,
  `berat` float NOT NULL,
  `aktif` int DEFAULT NULL,
  `crtdt` datetime NOT NULL,
  `crtusr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `modidt` datetime DEFAULT NULL,
  `modiusr` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_toko`
--

DROP TABLE IF EXISTS `tabel_toko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_toko` (
  `kd_toko` varchar(15) NOT NULL,
  `nm_toko` varchar(30) NOT NULL,
  `almt_toko` varchar(150) NOT NULL,
  `kota_toko` varchar(50) NOT NULL,
  `kecamatan_toko` varchar(50) NOT NULL,
  `ket_toko` text NOT NULL,
  `jargon_toko` varchar(255) NOT NULL,
  `tutor` varchar(1000) NOT NULL,
  `tlp_toko` varchar(15) NOT NULL,
  `fax_toko` varchar(255) NOT NULL,
  `logo` varchar(150) NOT NULL,
  `logo_header` varchar(150) NOT NULL,
  `logo_login` varchar(150) NOT NULL,
  `password` varchar(35) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `status` varchar(15) NOT NULL,
  `tipe` varchar(500) NOT NULL,
  `headerfooter` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `tombol` varchar(255) NOT NULL,
  `latitude` varchar(150) NOT NULL,
  `longitude` varchar(150) NOT NULL,
  `konten` varchar(255) NOT NULL,
  `ketentuan` varchar(255) NOT NULL,
  `google_map` varchar(2000) NOT NULL,
  `banner1` varchar(200) NOT NULL,
  `banner2` varchar(200) NOT NULL,
  `banner3` varchar(200) NOT NULL,
  PRIMARY KEY (`kd_toko`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabel_ulasan_barang`
--

DROP TABLE IF EXISTS `tabel_ulasan_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabel_ulasan_barang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_faktur_pembelian` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `kd_merchant` int NOT NULL,
  `kd_toko` int NOT NULL,
  `kd_barang` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `rating` int NOT NULL,
  `keterangan` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `crtdt` datetime NOT NULL,
  `crtusr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'republ23_santrigo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-20 10:26:10
