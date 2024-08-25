<!-- SweetAlert -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<?php
include "../inc/koneksi.php";
error_reporting(0);

$email = mysqli_real_escape_string($koneksi, $_POST['email']);
$pengacak = "p3ng4c4k";

// Hashing password using a stronger method
if ($_POST['pass'] == '') {
    $passmd = '';
} else {
    $passmd = md5($pengacak . md5($_POST['pass']));
}

if ($_POST['password_toko'] == '') {
    $passtokomd = '';
} else {
    $passtokomd = md5($pengacak . md5($_POST['password_toko']));
}

$pass = ($_POST['pass'] == '') ? '' : $_POST['pass'];
$password1 = $_POST['pass1'];
$nama = mysqli_real_escape_string($koneksi, $_POST['nama']);
$random = rand();
$alamat = mysqli_real_escape_string($koneksi, $_POST['alamat']);
$no_tlv = mysqli_real_escape_string($koneksi, $_POST['no_tlv']);
$kd_toko = mysqli_real_escape_string($koneksi, $_POST['toko_select']);
$aksesp = mysqli_real_escape_string($koneksi, $_POST['akses']);
$bank = '';
$an_bank = '';
$norek = '';
$status = "AKTIF";
$latitude = mysqli_real_escape_string($koneksi, $_POST['lat_member']);
$longitude = mysqli_real_escape_string($koneksi, $_POST['lon_member']);
// $kode_toko = null;

// Cek apakah data member sudah ada
$cekdulu = "SELECT * FROM tabel_member WHERE nm_user='$nama' OR email_user='$email' OR hp='$no_tlv'";
$prosescek = mysqli_query($koneksi, $cekdulu);

if (mysqli_num_rows($prosescek) > 0) {
    echo '<script>
	setTimeout(function() {
		Swal.fire({
			icon: "error",
			title: "Pendaftaran Gagal",
			text: "Data sudah digunakan",
			}).then(function() {
				history.go(-1);
                });
				}, 1);
				</script>';
    return false;
}

$cekakses = "SELECT * FROM tabel_member WHERE kd_toko = '$kd_toko' AND akses = '$aksesp'";
$procekaksesq = mysqli_query($koneksi, $cekakses);

// Cek nilai akses

if (mysqli_num_rows($procekaksesq) > 0) {
    echo '<script>
	setTimeout(function() {
		Swal.fire({
			icon: "error",
			title: "Pendaftaran Gagal",
			text: "Akses toko sudah digunakan di toko anda",
			}).then(function() {
				history.go(-1);
                });
				}, 1);
				</script>';
    return false;
}

// Cek apakah toko dan password toko cocok
$cektoko = "SELECT * FROM tabel_toko WHERE kd_toko = '$kd_toko'";
$procektokoQ = mysqli_query($koneksi, $cektoko);
$procektoko = mysqli_fetch_assoc($procektokoQ);

if ($passtokomd != $procektoko['password']) {
    echo '<script>
	setTimeout(function() {
		Swal.fire({
			icon: "error",
			title: "Pendaftaran Gagal",
			text: "Password Toko Tidak Tepat. Masukkan password yang sesuai dengan toko Anda",
			}).then(function() {
				history.go(-1);
                });
				}, 1);
				</script>';
    return false;
} else {
    // $insert_1=mysqli_query($koneksi, "INSERT INTO tabel_member VALUES ('','$random','$kode_toko',NOW(),'$nama','$email','$alamat','$passmd','$pass','','$no_tlv',$aksesp,'$status','','','$bank','$an_bank','$norek')");
    $insert_1 = mysqli_query($koneksi, "INSERT INTO tabel_member VALUES (NULL,'$random','$kd_toko',NOW(),'$nama','$email','$alamat','$passmd','$pass','','$no_tlv','$aksesp','$status',0,'','$bank','$an_bank','$norek')");
    if (!$insert_1) {
        echo "Error in query: " . mysqli_error($koneksi);
    } else {
        echo '<script>
            setTimeout(function () {
                Swal.fire({
                    icon: "success",
                    title: "Pendaftaran Berhasil",
                    text: "Silahkan login ulang dengan username yang telah didaftarkan.",
                }).then(function () {
                    window.location = "login.php";
                });
            }, 1);
        </script>';
    }
}
?>