<?php include "../inc/koneksi.php";
$a = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM tabel_toko WHERE `kd_toko` = '123'"));
$background = $a['background'];
$headerfooter = $a['headerfooter'];
$tombol = $a['tombol'];
$logo = $a['logo'];
$toko = $a['nm_toko'];
?>

<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
   <meta name="description" content="<?php echo $toko; ?>">
   <meta name="keywords" content="<?php echo $toko; ?>">
   <meta name="author" content="<?php echo $toko; ?>">
   <meta http-equiv="refresh" content="1200">
   <title>.: <?php echo $toko; ?> :.</title>
   <!-- BEGIN: Vendor CSS-->
   <!-- <link rel="shortcut icon" type="image/x-icon" href="w/logo.png"> -->
   <link rel="shortcut icon" type="image/x-icon" href="../img/<?php echo $logo; ?>">
   <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/vendors.min.css">
   <link href="../app-assets/font/css/fontawesome.min.css" rel="stylesheet" type="text/css">
   <link href="../app-assets/font/css/all.min.css" rel="stylesheet" type="text/css">
   <!-- END: Vendor CSS-->

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
   <link rel="stylesheet" type="text/css" href="../app-assets/vendors/css/extensions/sweetalert2.min.css">
   <!-- END: Page CSS-->

   <!-- BEGIN: Custom CSS-->
   <link rel="stylesheet" type="text/css" href="../assets/css/style.css">
   <!-- END: Custom CSS-->

</head>
<!-- END: Head-->

<style type="text/css">
   /*.nav.nav-tabs .nav-item .nav-link {
      color: #ffffff;
      font-size: 0.95rem;
      border: none;
      min-width: auto;
      font-weight: 450;
      padding: 0.61rem 0.635rem;
      border-radius: 2px;
   }*/

   .nama-user {
      font-size: 11px;
      animation: blink-animation 1s steps(3, start) infinite;
      -webkit-animation: blink-animation 1s steps(3, start) infinite;
   }

   .text-user {
      color: #86ff01;
      animation: blink-animation 1s steps(3, start) infinite;
      -webkit-animation: blink-animation 1s steps(3, start) infinite;
      text-shadow: 0 0 5px #86ff01, 0 0 10px #86ff01, 0 0 20px #86ff01, 0 0 45px #86ff01, 0 0 40px #86ff01;
   }

   @keyframes blink-animation {
      to {
         visibility: hidden;
      }
   }

   @-webkit-keyframes blink-animation {
      to {
         visibility: hidden;
      }
   }

   .badge.badge-up2 {
      position: absolute;
      top: -0.3rem;
      right: -2.5rem;
   }

   .filter-switch label {
      cursor: pointer;
   }

   .filter-switch-item input:checked+label {
      color: inherit;
   }

   .filter-switch-item input:not(:checked)+label {
      --bg-opacity: 0;
      box-shadow: none;
   }

   .btn-info:hover {
      border-color: #01b1B5 !important;
      background-color: #00CFE8 !important;
      color: #FFFFFF;
   }

   .nav.nav-tabs .nav-item .nav-link {
      /*        color: #ffffff;*/
      font-size: 0.95rem;
      border: none;
      min-width: auto;
      font-weight: 450;
      padding: 0.61rem 0.635rem;
      border-radius: 2px;
   }

   .has-icon-left .form-control-position i {
      position: relative;
      /*        top: 10px;*/
      left: 5px;
      color: rgba(34, 41, 47, 0.4);
   }

   .nav.nav-tabs .nav-item .nav-link.active {
      border: none;
      position: relative;
      color: #49b5c3 !important;
      -webkit-transition: all 0.2s ease;
      transition: all 0.2s ease;
      background-color: transparent;
   }

   .nav.nav-tabs .nav-item .nav-link.active:after {
      content: attr(data-before);
      height: 2px;
      width: 100%;
      left: 0;
      position: absolute;
      bottom: 0;
      top: 100%;
      background: -webkit-linear-gradient(60deg, #28838f, rgb(55 232 252)) !important;
      background: linear-gradient(30deg, #198593, rgb(73 181 195 / 55%)) !important;
      box-shadow: 0 0 8px 0 rgb(73 181 195 / 49%) !important;
      -webkit-transform: translateY(0px);
      -ms-transform: translateY(0px);
      transform: translateY(0px);
      -webkit-transition: all 0.2s linear;
      transition: all 0.2s linear;
   }
</style>

<!-- BEGIN: Body-->

<body class="horizontal-layout horizontal-menu 1-column  navbar-floating footer-static bg-full-screen-image blank-page"
   data-open="hover" data-menu="horizontal-menu" data-col="1-column" style="background:<?php echo $a['background']; ?>">
   <!-- BEGIN: Content-->
   <div class="app-content content pb-5 mb-5">
      <div class="content-overlay"></div>
      <div class="header-navbar-shadow"></div>
      <div class="content-wrapper">
         <div class="content-header row"></div>
         <div class="content-body m-2">
            <section class="row flexbox-container">
               <div class="col-xl-6 col-10 justify-content-center d-flex">
                  <div class="card rounded-0 mb-0 w-100">
                     <div class="row m-0">
                        <div class="col-lg-12 col-12 p-0">
                           <div class="card rounded-0 mb-5 p-0">
                              <div class="divider mt-1">
                                 <div class="divider-text mb-1">
                                    <h3 class="text-uppercase text-info border-info p-1">Daftar Akun Baru</h3>
                                 </div>
                              </div>

                              <div class="card-content">
                                 <ul class="nav nav-tabs justify-content-center" role="tablist">
                                    <li class="nav-item">
                                       <a class="nav-link active" href="#member" role="tab" data-toggle="tab">
                                          <i class="fa-solid fa-address-card"></i> MEMBER
                                       </a>
                                    </li>
                                 </ul>
                              </div>
                              <div class="tab-content">
                                 <div role="tabpanel" class="tab-pane fade show in active" id="member">
                                    <div class="card-body p-2">
                                       <p class="font-small-3 text-bold-700 text-danger text-center">Halaman Pendaftaran
                                          Member</p>
                                       <br><br>
                                       <form action="../aut/add_member_baru.php" method="POST"
                                          enctype="multipart/form-data">
                                          <input type="hidden" name="lat_member" id="lat_member" class="form-control"
                                             readonly>
                                          <input type="hidden" name="lon_member" id="lon_member" class="form-control"
                                             readonly>
                                          <fieldset class="form-label-group form-group position-relative has-icon-left">
                                             <input type="text" class="form-control" name="nama" placeholder="Nama"
                                                required>
                                             <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                             </div>
                                             <label for="user-name">Nama</label>
                                          </fieldset>

                                          <fieldset class="form-label-group form-group position-relative has-icon-left">
                                             <input type="email" class="form-control" name="email" placeholder="Email"
                                                required>
                                             <div class="form-control-position">
                                                <i class="feather icon-mail"></i>
                                             </div>
                                             <label for="user-name">Email</label>
                                          </fieldset>

                                          <fieldset class="form-label-group position-relative has-icon-left">
                                             <input type="password" class="form-control" name="pass"
                                                placeholder="Password" required>
                                             <div class="form-control-position">
                                                <i class="feather icon-lock"></i>
                                             </div>
                                             <label for="user-password">Password</label>
                                          </fieldset>

                                          <fieldset class="form-label-group position-relative has-icon-left">
                                             <input type="password" class="form-control" name="pass1"
                                                placeholder="Ketik Ulang Password" required>
                                             <div class="form-control-position">
                                                <i class="feather icon-lock"></i>
                                             </div>
                                             <label for="user-password">Ketik Ulang Password</label>
                                          </fieldset>

                                          <fieldset class="form-label-group form-group position-relative has-icon-left">
                                             <input type="number" class="form-control" name="no_tlv"
                                                placeholder="No. HP (Yang masih aktif)" required>
                                             <div class="form-control-position">
                                                <i class="feather icon-phone"></i>
                                             </div>
                                             <label for="user-name">No. HP (Yang masih aktif)</label>
                                          </fieldset>

                                          <fieldset class="form-label-group form-group position-relative has-icon-left">
                                             <input type="text" class="form-control" name="alamat"
                                                placeholder="Alamat Lengkap" required>
                                             <div class="form-control-position">
                                                <i class="feather icon-home"></i>
                                             </div>
                                             <label for="user-name">Alamat Lengkap</label>
                                          </fieldset>

                                          <fieldset class="form-label-group form-group position-relative has-icon-left">
                                             <select name="toko_select" class="form-control" id="toko_select">
                                                <option value="">Pilih Toko</option>
                                                <?php
                                                $query = mysqli_query($koneksi, "SELECT kd_toko FROM tabel_toko ");
                                                if (mysqli_num_rows($query) > 0) {
                                                   while ($row = mysqli_fetch_assoc($query)) {
                                                      echo '<option value="' . $row['kd_toko'] . '">' . $row['kd_toko'] . '</option>';
                                                   }
                                                } else {
                                                   echo '<option value="">Toko tidak ditemukan</option>';
                                                }
                                                ?>
                                             </select>
                                             <div class="form-control-position">
                                                <i class="feather icon-shopping-bag"></i>
                                             </div>
                                          </fieldset>



                                          <fieldset class="form-label-group form-group position-relative has-icon-left">
                                             <input type="text" class="form-control" name="password_toko"
                                                placeholder="Massukan Password toko anda" required>
                                             <div class="form-control-position">
                                                <i class="feather icon-command"></i>
                                             </div>
                                             <label for="user-name">Password Toko</label>
                                          </fieldset>

                                          <fieldset class="form-label-group form-group position-relative has-icon-left">
                                             <select name="akses" class="form-control" id="akses">
                                                <option value="">Pilih Akses</option>
                                                <option value="kepala_toko">Kepala Toko</option>
                                                <option value="admin">Admin</option>
                                                <option value="gudang">Gudang</option>
                                                <option value="kasir">Kasir</option>
                                             </select>
                                             <div class="form-control-position">
                                                <i class="feather icon-shopping-bag"></i>
                                             </div>
                                          </fieldset>

                                          <div class="form-group row">
                                             <div class="col-12">
                                                <fieldset class="checkbox">
                                                   <div class="vs-checkbox-con vs-checkbox-primary">
                                                      <input type="checkbox" checked name="validasi">
                                                      <span class="vs-checkbox">
                                                         <span class="vs-checkbox--check">
                                                            <i class="vs-icon feather icon-check"></i>
                                                         </span>
                                                      </span>
                                                      <span class="font-small-2"> Saya setuju dengan seluruh kebijakkan
                                                         <?php echo $a['nm_toko']; ?>.</span>
                                                   </div>
                                                </fieldset>
                                             </div>
                                          </div>

                                          <a href="login.php" class="btn btn-outline-primary btn-inline mb-50">
                                             Masuk
                                          </a>
                                          <button type="submit" name="daftar-merchant"
                                             class="btn btn-primary btn-inline mb-50" name="submit_member"
                                             id="submit_member">
                                             Daftar
                                          </button>
                                       </form>
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
   <script src="../app-assets/js/scripts/extensions/sweet-alerts.js"></script>
   <!-- END: Theme JS-->

   <!-- BEGIN: Page JS-->
   <!-- END: Page JS-->

   <script>
      $(document).ready(function () {

         navigator.geolocation.getCurrentPosition((position) => {
            $("#lat_member").val(`${position.coords.latitude}`);
            $("#lon_member").val(`${position.coords.longitude}`);
         });

         navigator.geolocation.getCurrentPosition((position) => {
            $("#lat_merchant").val(`${position.coords.latitude}`);
            $("#lon_merchant").val(`${position.coords.longitude}`);
         });

         navigator.geolocation.getCurrentPosition((position) => {
            $("#lat_kurir").val(`${position.coords.latitude}`);
            $("#lon_kurir").val(`${position.coords.longitude}`);
         });

         navigator.geolocation.getCurrentPosition((position) => {
            $("#lat_marketing").val(`${position.coords.latitude}`);
            $("#lon_marketing").val(`${position.coords.longitude}`);
         });

         $("#submit_kurir").click(() => {
            if (!navigator.geolocation)
               return alert("Geolocation is not supported.");

            navigator.geolocation.getCurrentPosition((position) => {
               $("#lat_kurir").val(`${position.coords.latitude}`);
               $("#lon_kurir").val(`${position.coords.longitude}`);
            });
         });

         $('#submit_merchant').click(() => {
            if (!navigator.geolocation)
               return alert("Geolocation is not supported.");

            navigator.geolocation.getCurrentPosition((position) => {
               $("#lat_merchant").val(`${position.coords.latitude}`);
               $("#lon_merchant").val(`${position.coords.longitude}`);
            });
         });

         $('#submit_marketing').click(() => {
            if (!navigator.geolocation)
               return alert("Geolocation is not supported.");

            navigator.geolocation.getCurrentPosition((position) => {
               $("#lat_marketing").val(`${position.coords.latitude}`);
               $("#lon_marketing").val(`${position.coords.longitude}`);
            });
         });

      });
   </script>


</body>
<!-- END: Body-->

</html>