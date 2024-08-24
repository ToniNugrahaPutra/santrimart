<?php include "../inc/koneksi.php";
$a = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM `tabel_toko` WHERE `kd_toko` = '123' LIMIT 1"));
$background = $a['background'];
$headerfooter = $a['headerfooter'];
$tombol = $a['tombol'];
$logo = $a['logo'];
$logo_login = $a['logo_login'];
$toko = $a['nm_toko'];

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="description" content="<?php echo $toko; ?>">
  <meta name="keywords" content="<?php echo $toko; ?>">
  <meta name="author" content="<?php echo $toko; ?>">
  <title>.: <?php echo $toko; ?> :.</title>
  <!-- <title>Login V2</title> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/png" href="../img/logo/<?php echo $logo; ?>" />
  <link rel="apple-touch-icon" href="images/ico/apple-icon-120.png">
  <link rel="shortcut icon" type="image/x-icon" href="images/ico/favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">

  <!-- BEGIN: Vendor CSS-->
  <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/vendors.min.css">
  <!-- END: Vendor CSS-->

  <!-- BEGIN: Theme CSS-->
  <link rel="stylesheet" type="text/css" href="../app-assets/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="../app-assets/css/bootstrap-extended.css">
  <link rel="stylesheet" type="text/css" href="../app-assets/css/colors.css">
  <link rel="stylesheet" type="text/css" href="../app-assets/css/components.css">
  <link rel="stylesheet" type="text/css" href="../app-assets/css/themes/dark-layout.css">
  <link rel="stylesheet" type="text/css" href="../app-assets/css/themes/semi-dark-layout.css">

  <!-- BEGIN: Page CSS-->
  <link rel="stylesheet" type="text/css" href="../app-assets/css/core/menu/menu-types/horizontal-menu.css">
  <link rel="stylesheet" type="text/css" href="../app-assets/css/core/colors/palette-gradient.css">
  <link rel="stylesheet" type="text/css" href="../app-assets/css/pages/authentication.css">
  <!-- END: Page CSS-->

  <!-- BEGIN: Custom CSS-->
  <link rel="stylesheet" type="text/css" href="assets/css/style.css">

</head>



<body
  class="horizontal-layout horizontal-menu 1-column  navbar-floating footer-static bg-full-screen-image  blank-page blank-page"
  data-open="hover" data-menu="horizontal-menu" data-col="1-column"
  style="background-image: url('images/backgrounds/bg.jpg');background-repeat: no-repeat;background-attachment: fixed;  background-position: center; ">
  <!-- BEGIN: Content-->
  <div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">

      <div class="content-body" style="opacity: 80%">
        <section class="row flexbox-container">
          <div class="col-xl-10 col-10 d-flex justify-content-center">
            <div class="card round mb-0">
              <div class="row m-0 mr-0 ml-0">
                <div class="col-lg-4 text-center align-self-center p-1">
                  <img src="../img/logo/<?php echo $logo_login ?>" width="90">
                </div>
                <div class="col-lg-8 col-12">
                  <div class="card rounded-0 mb-0 px-0">
                    <div class="card-header pb-1">
                      <div class="card-title">
                        <h4 class="mb-0">Selamat Datang
                          <p class="font-small-2">Login <?php echo $toko; ?> &#8482; </p>
                        </h4>
                      </div>
                    </div>

                    <div class="card-content">
                      <div class="card-body pt-1">
                        <form action="aksi_login_toko.php" method="post" class="login100-form validate-form">

                          <fieldset class="form-label-group form-group position-relative has-icon-left">
                            <select name="kd_toko" class="form-control" id="kd_toko">
                              <?php
                              // Melakukan query untuk mendapatkan semua kd_toko 
                              $query = mysqli_query($koneksi, "SELECT kd_toko FROM tabel_toko ");
                              // Melakukan pengecekan apakah query berhasil dieksekusi
                              if (mysqli_num_rows($query) > 0) {
                                // Looping setiap data yang didapatkan dari query
                                while ($row = mysqli_fetch_assoc($query)) {
                                  // Menampilkan setiap kd_toko dalam <option>
                                  echo '<option value="' . $row['kd_toko'] . '">' . $row['kd_toko'] . '</option>';
                                }
                              } else {
                                // Jika tidak ada data, beri informasi bahwa data tidak ditemukan
                                echo '<option value="">Toko tidak ditemukan</option>';
                              }
                              ?>
                            </select>

                            <div class="form-control-position">
                              <i class="feather icon-user"></i>
                            </div>
                          </fieldset>

                          <fieldset class="form-label-group position-relative has-icon-left">
                            <input class="form-control" type="password" name="pass" id="pass">
                            <div class="form-control-position">
                              <i class="feather icon-lock"></i>
                            </div>
                          </fieldset>
                          <div class="form-group d-flex justify-content-between align-items-center">
                            <div class="text-left">
                            </div>
                            <div class="text-right">
                              <a href="lupa-password.php" class="card-link">Lupa kata sandi?</a>
                            </div>
                          </div>

                          <div class="text-center">
                            <div class="btn-group">
                              <a class="btn btn-outline-primary round float-left btn-inline"
                                onclick="daftar_user()">Register</a>
                              <button type="submit" name="button_login"
                                class="login100-form-btn btn round gradient-light-primary float-right btn-inline">Login</button>
                            </div>
                          </div>

                        </form>

                      </div>
                    </div>
                    <div class="login-footer text-center">
                    </div>

                    <div class="divider">
                      <div class="divider-text">© <?php echo date('Y'); ?></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
    </section>

  </div>
  </div>
  </div>
  <!-- END: Content-->


  <!-- BEGIN: Vendor JS-->
  <script src="../app-assets/vendors/js/vendors.min.js"></script>
  <!-- BEGIN Vendor JS-->

  <!-- BEGIN: Page Vendor JS-->
  <script src="../app-assets/vendors/js/ui/jquery.sticky.js"></script>
  <!-- END: Page Vendor JS-->

  <!-- BEGIN: Theme JS-->
  <script src="../app-assets/js/core/app-menu.js"></script>
  <script src="../app-assets/js/core/app.js"></script>
  <script src="../app-assets/js/scripts/components.js"></script>
  <!-- END: Theme JS-->

  <!-- BEGIN: Page JS-->
  <!-- END: Page JS-->

</body>

</html>

<script type="text/javascript">

  function daftar_user() {
    window.location = "daftar.php";
  }

</script>