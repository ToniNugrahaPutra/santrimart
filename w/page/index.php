<?php
include "../inc/koneksi.php";
session_start();
if (!isset($_SESSION['nm_user']) && !isset($_SESSION['pass'])) {
  header('location:../aut/login.php');
} else {
}
// $kode_toko = $_SESSION['kd_toko'];
// var_dump($_SESSION);
// die;
?>

<?php
$a = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM `tabel_toko`"));
$background = $a['background'];
$headerfooter = $a['headerfooter'];
$tombol = $a['tombol'];
$logo = $a['logo'];
$toko = $a['nm_toko'];
$kd_toko = $a['kd_toko'];
$almt_toko = $a['almt_toko'];
$tlp_toko = $a['tlp_toko'];
$latlng_toko = $a['latitude'] . "," . $a['longitude'];
?>

<?php $user = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM tabel_member WHERE nm_user = '$_SESSION[nm_user]'"));
$foto = $user['foto'];
?>

<!DOCTYPE html>

<html class="loading" lang="en" data-textdirection="ltr">

<!-- BEGIN: Head-->


<head>


  <?php

  include '../inc/header.php';

  ?>

</head>

<!-- END: Head-->



<!-- BEGIN: Body-->

<?php
$admin = "";
if ($_SESSION['akses'] == 'adminx') {
  $admin = "admin";
} ?>

<body class="horizontal-layout horizontal-menu content-left-sidebar chat-application navbar-floating footer-static"
  data-open="hover" data-menu="horizontal-menu" data-col="content-left-sidebar">

  <input type='hidden' id='latitude_toko' value='<?= $a['latitude'] ?>'>
  <input type='hidden' id='longitude_toko' value='<?= $a['longitude'] ?>'>
  <input type="hidden" name="id_user" id="id_user" value="<?= $_SESSION['id_user'] ?>">


  <?php include '../inc/navigation.php'; ?>
  <div class="app-content content pb-5 mb-5 mt-0 pt-3">
    <div class="content-wrapper">

      <?php

      if ($_SESSION['akses'] == 'kepala_toko') {

        if (isset($_GET['menu'])) {
          $menu = $_GET['menu'];


          switch ($menu) {
            case ('home');
              include ('admin/home_kepala_toko.php');
              break;

            case ('account');
              include ('account.php');
              break;

            case ('ipos');
              include ('admin/ipos.php');
              break;

            case ('mchat');
              include ('admin/multichat.php');
              break;

            // case ('wholesale');
            //   include ('admin/wholesale.php');
            //   break;
      
            // case ('product');
            //   include ('admin/product.php');
            //   break;
      
            // case ('member');
            //   include ('admin/member.php');
            //   break;
      
            // case ('merchant');
            //   include ('admin/merchant.php');
            //   break;
      
            // case ('kelola');
            //   include ('admin/kelola_product.php');
            //   break;
      
            // case ('order');
            //   include ('admin/order-online.php');
            //   break;
      
            // case ('ads');
            //   include ('admin/ads.php');
            //   break;
      
            // case ('info');
            //   include ('admin/info.php');
            //   break;
      
            // case ('pembayaran');
            //   include ('admin/pembayaran.php');
            //   break;
      
            // case ('kurir');
            //   include ('admin/kurir.php');
            //   break;
      
            // case ('user');
            //   include ('admin/user.php');
            //   break;
      


            // case ('profile');
            //   include ('admin/profile_toko.php');
            //   break;
      
            // case ('keuangan');
            //   include ('admin/keuangan.php');
            //   break;
      
            // case ('streaming');
            //   include ('admin/streaming.php');
            //   break;
      
            // case ('saldo');
            //   include ('admin/saldo.php');
            //   break;
      
            // case ('transfer');
            // include ('admin/transfer.php');
            // break;
      
            //   case ('retur');
            //   include ('admin/retur.php');
            //   break;
      
            // case ('nota');
            //   include ('admin/nota.php');
            //   break;
      
            // case ('nota2');
            //   include ('admin/nota2.php');
            //   break;
      
            // case ('edit_retur');
            //   include ('admin/show_retur.php');
            //   break;
      
            case ('sales');
              include ('admin/report_sales.php');
              break;

            case ('balance');
              include ('admin/report_balance.php');
              break;

            case ('stock');
              include ('admin/report_stock.php');
              break;

            // case ('edit_product');
            //   include ('admin/edit_product.php');
            //   break;
      
            // case ('report_member');
            //   include ('admin/list_report_member.php');
            //   break;
          }
        }


      } else if ($_SESSION['akses'] == 'admin') {

        if (isset($_GET['kode_produk'])) {

          include ('admin/show_product.php');

        }

        if (isset($_GET['menu'])) {

          $menu = $_GET['menu'];

          switch ($menu) {
            case ('home');
              include ('admin/home.php');
              break;

            case ('account');
              include ('account.php');
              break;

            case ('ipos');
              include ('admin/ipos.php');
              break;

            // case ('wholesale');
            //   include ('admin/wholesale.php');
            //   break;
            case ('mchat');
              include ('admin/multichat.php');
              break;

            case ('product');
              include ('admin/product.php');
              break;

            case ('member');
              include ('admin/member.php');
              break;

            case ('merchant');
              include ('admin/merchant.php');
              break;

            case ('kelola');
              include ('admin/kelola_product.php');
              break;

            case ('order');
              include ('admin/order-online.php');
              break;

            case ('ads');
              include ('admin/ads.php');
              break;

            case ('info');
              include ('admin/info.php');
              break;

            case ('pembayaran');
              include ('admin/pembayaran.php');
              break;

            case ('kurir');
              include ('admin/kurir.php');
              break;

            case ('user');
              include ('admin/user.php');
              break;

            case ('master_user');
              include ('admin/master_user.php');
              break;

            case ('profile');
              include ('admin/profile_toko.php');
              break;

            case ('keuangan');
              include ('admin/keuangan.php');
              break;

            case ('streaming');
              include ('admin/streaming.php');
              break;

            case ('saldo');
              include ('admin/saldo.php');
              break;

            case ('transfer');
              include ('admin/transfer.php');
              break;

            case ('retur');
              include ('admin/retur.php');
              break;

            case ('nota');
              include ('admin/nota.php');
              break;

            case ('nota2');
              include ('admin/nota2.php');
              break;

            case ('edit_retur');
              include ('admin/show_retur.php');
              break;

            case ('sales');
              include ('admin/report_sales.php');
              break;

            case ('balance');
              include ('admin/report_balance.php');
              break;

            case ('stock');
              include ('admin/report_stock.php');
              break;

            case ('edit_product');
              include ('admin/edit_product.php');
              break;

            case ('report_member');
              include ('admin/list_report_member.php');
              break;



            // ============================ INVENTORY =============================
      
            case ('inventory');
              include ('admin/home.php');
              break;

            case ('input_barang');
              include ('inventory/input_barang.php');
              break;

            case ('supplier');
              include ('inventory/daftar_suplier.php');
              break;

            case ('laporan_stok');
              include ('inventory/laporan_stok.php');
              break;

            case ('ipos_new');
              include ('inventory/ipos.php');
              break;

            case ('retur_jual');
              include ('inventory/retur_penjualan.php');
              break;

            case ('retur_beli');
              include ('inventory/retur_pembelian.php');
              break;


          }

        }

      } else if ($_SESSION['akses'] == 'gudang') {
        if (isset($_GET['kode_produk'])) {

          include ('admin/show_product.php');

        }
        if (isset($_GET['menu'])) {

          $menu = $_GET['menu'];

          switch ($menu) {

            case ('home');
              include ('admin/home.php');
              break;
            case ('product');
              include ('admin/product.php');
              break;
            case ('input_barang');
              include ('inventory/input_barang.php');
              break;

            case ('supplier');
              include ('inventory/daftar_suplier.php');
              break;

            case ('mchat');
              include ('admin/multichat.php');
              break;
            case ('sales');
              include ('admin/report_sales.php');
              break;

            case ('balance');
              include ('admin/report_balance.php');
              break;

            case ('stock');
              include ('admin/report_stock.php');
              break;
            // case ('laporan_stok');
            //   include ('inventory/laporan_stok.php');
            //   break;
      
            case ('laporan_stok');
              include ('admin/report_stock.php');
              break;

            case ('retur_beli');
              include ('inventory/retur_pembelian.php');
              break;

            case ('account');
              include ('account.php');
              break;

          }

        }

      } else if ($_SESSION['akses'] == 'kasir') {

        if (isset($_GET['menu'])) {

          $menu = $_GET['menu'];
          switch ($menu) {
            case ('ipos');
              include ('admin/ipos.php');
              break;

            case ('nota');
              include ('admin/nota.php');
              break;

            case ('nota2');
              include ('admin/nota2.php');
              break;
          }

        }

      }


      ?>

    </div>
  </div>
  <?php include '../inc/footer.php'; ?>



</body>

<!-- END: Body-->


<script type="text/javascript">
  $(document).ready(function () {
    // Periksa apakah parameter menu memiliki nilai mchat
    var menu = getParameterByName('menu');
    if (menu === 'mchat') {
      // Jika menu adalah mchat, jalankan interval untuk mengambil chat
      setInterval(() => {
        var idSender = $("#idSender").val();
        var idReceiver = $("#idReceiver").val();
        var chatp = document.getElementById("chat-input").value;

        $.ajax({
          type: "GET",
          url: "../aksi/get_chat.php",
          data: {
            idSender: idSender,
            idReceiver: idReceiver,
          },
          success: function (data) {
            $('#chat-box').html(data);
          }
        })
      }, 1000);
    }
  });

  // Fungsi untuk mendapatkan nilai parameter dari URL
  function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
      results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
  }


  function sendphoto() {
    var idSender = $("#idSender").val();
    var idReceiver = $("#idReceiver").val();
    var file_data = $("#sub").prop("files")[0];
    var form_data = new FormData(); // Creating object of FormData class
    form_data.append("file", file_data);
    form_data.append("idSender", idSender);
    form_data.append("idReceiver", idReceiver);
    $.ajax({
      url: "../aksi/add_photo.php",
      type: "post",
      dataType: 'script',
      cache: false,
      contentType: false,
      processData: false,
      data: form_data,
      success: function (data) {
        Swal.fire({
          icon: 'success',
          title: 'Berhasil!',
          text: 'File berhasil diunggah dan pesan terkirim.',
          confirmButtonText: 'OK'
        })
      },
      error: function (xhr, status, error) {
        Swal.fire({
          icon: 'error',
          title: 'Gagal!',
          text: 'Terjadi kesalahan: ' + error,
          confirmButtonText: 'OK'
        });
      }
    });

  }

  function send() {
    var idSender = $("#idSender").val();
    var idReceiver = $("#idReceiver").val();
    var chatp = document.getElementById("chat-input").value;
    $.ajax({
      url: "../aksi/add_chat.php",
      type: "post",
      data: {
        idSender: idSender,
        idReceiver: idReceiver,
        // photo: photo,
        chatp: chatp
      },
      success: function (data) {
        document.getElementById("chat-input").value = "";
      }
    })

  }


  function enter() {
    var file = $('#sub')[0].files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e) {
      var img = $('#image_preview');
      img.attr('src', this.result);

    }

    var html = '<div class="chat-content">' + '<img id="image_preview" width="100px" height="100px">' +
      "</img>" +
      "</div>";
    $(".chat:last-child .chat-body").append(html);
    $(".message").val("");
    $(".user-chats").scrollTop($(".user-chats > .chats").height());

  }
</script>

</html>