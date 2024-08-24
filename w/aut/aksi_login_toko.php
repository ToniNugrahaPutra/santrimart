<head>
	<!-- SweetAlert -->
    <script src="../app-assets/js/jquery3.6.0.min.js"></script>
    <script src="../app-assets/js/sweetalert2@11.js"></script>
</head>

<?php
	session_start();

	include "../inc/koneksi.php";
	$kd_toko    = $_POST['kd_toko'];	
	$password	= $_POST['pass'];
	$query	= "SELECT * FROM tabel_toko WHERE kd_toko  = '$kd_toko'";
	$hasil	= mysqli_query($koneksi,$query);
	$data	= mysqli_fetch_assoc($hasil);
	$pengacak = "p3ng4c4k";
	$_SESSION['kd_toko']	= $data['kd_toko'];
	$passmd = md5($pengacak . md5($password));
	if ($data == NULL || $passmd != $data['password'])
	{
		echo '<script>
				setTimeout(function() {
					Swal.fire({
						icon: "error",
						tittle: "Gagal login",
						text: "Periksa kode dan password",
					}).then(function() {
						window.location = "login_toko.php";
					});
				}, 1);
			</script>';
	} else {
		echo '<script>
				setTimeout(function() {
					Swal.fire({
						icon: "success",
						tittle: "Berhasil Login",
						text: "Anda Berhak Mengakses Halaman Beranda",
					}).then(function() {
						window.location = "login.php";
					});
				}, 1);
				</script>';
	}