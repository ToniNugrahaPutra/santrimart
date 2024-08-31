<?php 
session_start();
include '../inc/koneksi.php';
if (!isset($_SESSION['nm_user']) && !isset($_SESSION['pass'])) {
  header('location:../aut/login.php');
} 

$kd_toko = $_SESSION['kd_toko'];


$id = $_POST['kd_barang'];
$hrg = $_POST['hrg_produk'];
$jumlah = $_POST['jumlah'];
$kd_barang = $_POST['kd_barang'];
// echo $id;
$ids = explode(",", $id);
$hrgs = explode(",", $hrg);
$jumlahs = explode(",", $jumlah);
$kd_barangs = explode(",", $kd_barang);


$nomorFaktur = $_POST['faktur'];



$kd_supplier = "";
$id_user = $_SESSION['id_user'];
$total_penjualan = $_POST['price-awal'];
$dp = "";
$sisa = "";
$status = "";
$pengiriman = "-";
$bayar = $_POST['bayar'];


if(isset($_POST['add_penjualan'])){
	$ket_penjualan = "Cash";
}
if(isset($_POST['add_penjualan_tf'])){
	$ket_penjualan = "Tranfer";
}



for ($i=0; $i < count($ids); $i++) { 
	$namaBarang = $kd_barangs[$i];
	$noHp = "";
	$ukuran = "";
	$harga = $hrgs[$i];
	$total = intval($jumlahs[$i]) * intval($hrgs[$i]);
	$total_biaya = $_POST['total'];
	$diskon = "";
	$a_n = "";
	$ket = "";
	$stts = "FINISH";
	$alamat = "";
	$alamat_akhir = "";

	// $query_stok = "SELECT  `stok` FROM `tabel_stok_toko` WHERE `kd_barang` = '$ids[$i]'";
	// $stok = mysqli_fetch_array(mysqli_query($koneksi, $query_stok));
	// $stok_awal = $stok['stok'];
	// $stok = $stok_awal-$jumlahs[$i];

	$query = "INSERT INTO `tabel_rinci_penjualan`(`no_faktur_penjualan`, `kd_barang`, `nm_barang`, `no_hp`, `ukuran`, `jumlah`, `stok_awal`, `harga`, `sub_total_jual`, `diskon`, `a_n`, `keterangan`, `stts`, `alamat`, `alamat_akhir`) VALUES ('$nomorFaktur','$ids[$i]','$namaBarang','$noHp','$ukuran','$jumlahs[$i]','1','$harga','$total','$diskon','$a_n','$ket','$stts','$alamat','$alamat_akhir')";
	$hasil=mysqli_query($koneksi,$query);



	$query = "UPDATE `tabel_stok_toko` SET `stok`='$stok' WHERE `kd_barang` = '$ids[$i]'";
	$hasil=mysqli_query($koneksi,$query);


}
// var_dump($ids);
// die;
if($hasil){
	$query = "INSERT INTO `tabel_penjualan`(`no_faktur_penjualan`, `kd_supplier`, `tgl_penjualan`, `id_user`, `total_penjualan`,`biaya_pengiriman`,`total_biaya`,`dp`, `sisa`, `ket`, `status`) VALUES ('$nomorFaktur','$kd_supplier',now(),'$id_user','$total_penjualan','$pengiriman','$total_biaya','$dp','$sisa','$ket_penjualan','$status')";
	$hasil=mysqli_query($koneksi,$query);

		header("Location: ../page/print_nota2.php?faktur=$nomorFaktur&bayar=$bayar");
}



?>