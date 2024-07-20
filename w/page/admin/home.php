<style type="text/css">
    .text-muted {
        color: #2a9d3d !important;
    }

    .nama-user {
        /*      font-size: 15px !;*/
        animation: blink-animation 1.1s steps(3, start) infinite;
        -webkit-animation: blink-animation 1.1s steps(3, start) infinite;
    }

    .horizontal-menu.navbar-floating:not(.blank-page) .app-content {
        padding-top: -6.25rem;
    }

    html body .content.app-content {
        overflow: hidden;
        margin-top: -130px;
    }
</style>

<!--BEGIN: Content-->

<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0 text-dark text-capitalize">
                            <?php echo $_SESSION['akses']; ?>
                        </h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.php?menu=home" class="text-dark">Home</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Statistics card section start -->

        <section id="statistics-card" style="margin-top: 15px;">
            <div class="row">
                <?php $satQuery = "SELECT COUNT(id_user) as user FROM tabel_member";
                $executeSat = mysqli_query($koneksi, $satQuery);
                while ($user = mysqli_fetch_array($executeSat)) {
                    ?>
                    <?php if ($_SESSION['akses'] == 'admin' || $_SESSION['akses'] == 'kasir') { ?>
                        <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                            <a href="index.php?menu=ipos" class="text-dark s">
                                <div class="card text-center">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                                <div class="avatar-content">
                                                    <i class="fa-solid fa-cash-register font-medium-5"></i>
                                                </div>
                                            </div>
                                            <h2 class="text-bold-700">iPOS</h2>
                                            <p class="mb-0 line-ellipsis">CASHIER</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    <?php } ?>
                <?php } ?>



                <?php $satQuery = "SELECT COUNT(id_user) as user FROM tabel_member WHERE akses = 'merchant'";
                $executeSat = mysqli_query($koneksi, $satQuery);
                while ($merchant = mysqli_fetch_array($executeSat)) {
                    ?>

                    <?php $b = mysqli_fetch_array(mysqli_query($koneksi, "SELECT * FROM tabel_member WHERE akses = 'merchant'")); ?>
                    <div class="col-xl-3 col-md-4 col-sm-6 col-6" style="display: none;">
                        <a href="index.php?menu=user&akses=<?php echo $b['akses']; ?>" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-user-tag font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700"><?= $merchant['user'] ?></h2>
                                        <p class="mb-0 line-ellipsis">Merchant</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>



                <?php $satQuery = "SELECT COUNT(kd_barang) as barang FROM tabel_barang";
                $executeSat = mysqli_query($koneksi, $satQuery);
                while ($barang = mysqli_fetch_array($executeSat)) {
                    ?>

                    <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                        <a href="index.php?menu=product" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-box-open font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700"><?= $barang['barang'] ?></h2>
                                        <p class="mb-0 line-ellipsis">PRODUK</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>

                <?php $satQuery = "SELECT COUNT(no_faktur_penjualan) as jml FROM tabel_penjualan";
                $executeSat = mysqli_query($koneksi, $satQuery);
                $jml = 0;
                while ($jml = mysqli_fetch_array($executeSat)) {
                    ?>

                    <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                        <a href="index.php?menu=sales" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-paste font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700"><?= $jml['jml']; ?></h2>
                                        <p class="mb-0 line-ellipsis">LAPORAN PENJUALAN</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>



                <?php $satQuery = "SELECT COUNT(no_faktur_penjualan) as jml FROM tabel_penjualan";
                $executeSat = mysqli_query($koneksi, $satQuery);
                $jml = 0;
                while ($jml = mysqli_fetch_array($executeSat)) {
                    ?>
                    <div class="col-xl-3 col-md-4 col-sm-6 col-6">

                        <a href="index.php?menu=balance" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-balance-scale font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700"><?= $jml['jml']; ?></h2>
                                        <p class="mb-0 line-ellipsis">LAPORAN LABA</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>



                <?php $satQuery = "SELECT COUNT(no_faktur_penjualan) as jml FROM tabel_penjualan";
                $executeSat = mysqli_query($koneksi, $satQuery);
                $jml = 0;
                while ($jml = mysqli_fetch_array($executeSat)) {
                    ?>

                    <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                        <a href="index.php?menu=stock" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-clipboard-list font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700"><?= $jml['jml']; ?></h2>
                                        <p class="mb-0 line-ellipsis">LAPORAN STOCK</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>



                <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                    <a href="index.php?menu=mchat" class="text-dark s">
                        <div class="card text-center">
                            <div class="card-content">
                                <div class="card-body">
                                    <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                        <div class="avatar-content">
                                            <i class="fas fa-comment font-medium-5"></i>
                                        </div>
                                    </div>
                                    <p class="mb-0 line-ellipsis"style="color: white;" >Chat</p>
                                    <h2 class="text-bold-700" >Chat</h2></h2>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="row">

                <?php if ($_SESSION['akses'] == 'admin' || $_SESSION['akses'] == 'gudang') { ?>

                    <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                        <a href="index.php?menu=input_barang" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-chart-line font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700" style="color: white;">0</h2>
                                        <p class="mb-0 line-ellipsis">INPUT BARANG MASUK</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>

                <?php if ($_SESSION['akses'] == 'admin' || $_SESSION['akses'] == 'gudang') { ?>

                    <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                        <a href="index.php?menu=supplier" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-truck-moving font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700" style="color: white;">0</h2>
                                        <p class="mb-0 line-ellipsis">DAFTAR SUPPLIER</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>

                <?php if ($_SESSION['akses'] == 'admin' || $_SESSION['akses'] == 'gudang') { ?>

                    <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                        <a href="index.php?menu=retur_beli" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-truck-loading font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700" style="color: white;">0</h2>
                                        <p class="mb-0 line-ellipsis">RETUR PEMBELIAN</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                <?php } ?>
                <?php if ($_SESSION['akses'] == 'admin' || $_SESSION['akses'] == 'kasir') { ?>
                    <div class="col-xl-3 col-md-4 col-sm-6 col-6">
                        <a href="index.php?menu=retur_jual" class="text-dark s">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="avatar p-50 m-0 mb-1" style="background:<?php echo $tombol; ?>">
                                            <div class="avatar-content">
                                                <i class="fas fa-dolly font-medium-5"></i>
                                            </div>
                                        </div>
                                        <h2 class="text-bold-700" style="color: white;">0</h2>
                                        <p class="mb-0 line-ellipsis">RETUR PENJUALAN</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                <?php } ?>
            </div>
        </section>
        <!-- // Statistics Card section end-->
    </div>
</div>

<!-- END: Content -->

<style>
    a.s {
        text-decoration: none;
    }
</style>