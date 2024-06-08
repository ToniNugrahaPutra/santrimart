<style type="text/css">
  
  table.dataTable thead tr {
    background-color: #337ab7;
    color:#fff;
    font-size: 11px;
  }

  .modal-title {
    margin-bottom: 0;
    line-height: 1.45;
    color: white;
  }

  .modal .modal-header {
    background-color: #49b5c3;
    border-radius: 0.42rem;
    padding: 0.8rem;
    color: white;
    border-bottom: none;
  }

  .header-tabel {
    color:#fff;
    font-size: 11px;
    background-color: #337ab7;
  }

  .pagination .page-item.active .page-link {
    z-index: 3;
    border-radius: 5rem;
    background-color: #337ab7;
    color: #FFFFFF;
    -webkit-transform: scale(1.05);
    -ms-transform: scale(1.05);
    transform: scale(1.05); 
  }

  table.dataTable.table-striped tbody tr:nth-of-type(even) {
    background-color: #e9fcfe;
  }

  .nama-user{
      font-size: 12px;
      animation: blink-animation 1s steps(3, start) infinite;
      -webkit-animation: blink-animation 1s steps(3, start) infinite;
  }

  .text-user{
      color: #df0a0a;
      animation: blink-animation 1s steps(3, start) infinite;
      -webkit-animation: blink-animation 1s steps(3, start) infinite;
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

  .badge.badge-up {
    position: absolute;
    top: -1.0rem;
    right: -0.8rem;
  }

  .badge.badge-up2 {
    position: absolute;
    top: -0.3rem;
    right: -2.5rem;
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
<!-- BEGIN: Content-->
<br><br>
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-9 col-12 mb-2">
                <div class="row breadcrumbs-top">
                    <div class="col-12">
                        <h2 class="content-header-title float-left mb-0 text-dark text-capitalize">
                            <?php echo $_SESSION['akses']; ?></h2>
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.php?menu=home" class="text-dark">Home</a>
                                </li>
                                <li class="breadcrumb-item"><a href="#" class="text-dark">Product Display</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Statistics card section start -->
        <section id="statistics-card">
            
            <?php
            $satQuery = "SELECT COUNT(nm_user) as nm_user FROM tabel_member WHERE akses='member'";
            $executeSat = mysqli_query($koneksi, $satQuery);
            while ($count = mysqli_fetch_array($executeSat)) {
            ?>
            <div class="row">

                <?php } ?>

                <?php
                $satQuery   = "SELECT SUM(jumlah) AS jumlah FROM tabel_rinci_penjualan,tabel_barang WHERE tabel_rinci_penjualan.kd_barang = tabel_barang.kd_barang AND tabel_barang.kd_merchant = $_SESSION[id_user]";
                $executeSat = mysqli_query($koneksi, $satQuery);
                while ($count = mysqli_fetch_array($executeSat)) {
                    // print_r($count)

                ?>

                <!-- <div class="col-lg-4 col-sm-6 col-12"> -->
                <div class="col-lg-6 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex flex-column align-items-start pb-0">
                            <div class="avatar bg-rgba-success p-50 m-0">
                                <div class="avatar-content">
                                    <i class="feather icon-credit-card text-success font-medium-5"></i>
                                </div>
                            </div>
                            <h2 class="text-bold-700 mt-1"><?= $count['jumlah'] ?></h2>
                            <p class="mb-0">Transaksi</p>
                        </div>
                        <div class="card-content">
                            <div id="line-area-chart-2"></div>
                        </div>
                    </div>
                </div>

                <?php } ?>

                <?php
                $satQuery   = "SELECT SUM(jumlah), SUM(stok_awal) FROM tabel_rinci_penjualan,tabel_barang WHERE tabel_rinci_penjualan.kd_barang = tabel_barang.kd_barang AND tabel_barang.kd_merchant = $_SESSION[id_user]";
                $executeSat = mysqli_query($koneksi, $satQuery);
                while ($count = mysqli_fetch_array($executeSat)) {
                    // var_dump($count[0]); die();
                    $countPersen = isset($count[0]) ? substr($count[0] / $count[1] * 100, 0, 4) : '';
                ?>

                <!-- <div class="col-lg-4 col-sm-6 col-12"> -->
                <div class="col-lg-6 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-header d-flex flex-column align-items-start pb-0">
                            <div class="avatar bg-rgba-danger p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fas fa-truck-loading text-danger font-medium-5"></i>
                                </div>
                            </div>
                            <h2 class="text-bold-700 mt-1"><?= $countPersen ?> %</h2>
                            <p class="mb-0">Sirkulasi Produk</p>
                        </div>
                        <div class="card-content">
                            <div id="line-area-chart-3"></div>
                        </div>
                    </div>
                </div>
                <?php } ?>


            </div>

        </section>
        <!-- // Statistics Card section end-->


        <div class="content-detached content-right">
            <div class="content-body">
                <!-- Ecommerce Content Section Starts -->
                <section id="ecommerce-header">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ecommerce-header-items">
                                <div class="result-toggler">
                                    <button class="navbar-toggler shop-sidebar-toggler" type="button"
                                        data-toggle="collapse">
                                        <span class="navbar-toggler-icon d-block d-lg-none"><i
                                                class="feather icon-menu"></i></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Ecommerce Content Section Starts -->

                <!-- background Overlay when sidebar is shown  starts-->
                <div class="shop-content-overlay"></div>
                <!-- background Overlay when sidebar is shown  ends-->

                <!-- Ecommerce Search Bar Starts -->
                <section id="ecommerce-searchbar">
                    <div class="row mt-1">
                        <div class="col-sm-12">
                            <fieldset class="form-group position-relative">
                                <?php
                                    if (isset($_GET['search'])) {
                                        $search         = $_GET['search'];
                                        $data_search    = mysqli_query($koneksi, "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko WHERE tabel_barang.nm_barang LIKE '%.$search.%' AND tabel_barang.kd_barang = tabel_barang_gambar.id_brg AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang AND tabel_barang.kd_kategori = '$kd_kategori'");
                                        echo 'string';

                                    }
                                ?>
                                <input type="text" class="form-control search-product" id="iconLeft5"
                                    placeholder="Search here" name="search">
                                <div class="form-control-position">
                                    <i class="feather icon-search"></i>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </section>
                <!-- Ecommerce Search Bar Ends -->

                <!-- Ecommerce Products Starts -->
                <section id="basic-examples">
                    <div class="row match-height">
                        <?php

                        $batas = 6;
                        $halaman = isset($_GET['halaman']) ? (int)$_GET['halaman'] : 1;
                        $halaman_awal = ($halaman > 1) ? ($halaman * $batas) - $batas : 0;
                        $previous = $halaman - 1;
                        $next = $halaman + 1;

                        if(isset($_GET['kd_kategori']) && !isset($_GET['pricerange'])) {
                        
                            $query_barang = "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko 
                                            WHERE tabel_barang.kd_barang = tabel_barang_gambar.id_brg 
                                            AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang
                                            AND tabel_barang.kd_kategori = $kd_kategori
                                            ";

                            $query_barang_2 = "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko 
                                            WHERE tabel_barang.kd_barang = tabel_barang_gambar.id_brg 
                                            AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang
                                            AND tabel_barang.kd_kategori = $kd_kategori
                                            limit $halaman_awal, $batas";
                        
                        } elseif(!isset($_GET['kd_kategori']) && isset($_GET['pricerange'])) {
                            
                            $n = explode("-", $_GET['pricerange']);
                            $n1 = $n[0];
                            $n2 = $n[1]; 

                            $query_barang = "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko 
                                            WHERE tabel_barang.kd_barang = tabel_barang_gambar.id_brg 
                                            AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang
                                            AND tabel_barang.hrg_jual BETWEEN $n1 AND $n2";

                            $query_barang_2 = "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko 
                                            WHERE tabel_barang.kd_barang = tabel_barang_gambar.id_brg 
                                            AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang
                                            AND tabel_barang.hrg_jual BETWEEN $n1 AND $n2 limit $halaman_awal, $batas";

                        } elseif (isset($_GET['kd_kategori']) && isset($_GET['pricerange'])) {

                            $n = explode("-", $_GET['pricerange']);
                            $n1 = $n[0];
                            $n2 = $n[1]; 

                            $query_barang = "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko 
                                            WHERE tabel_barang.kd_barang = tabel_barang_gambar.id_brg 
                                            AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang
                                            AND tabel_barang.hrg_jual BETWEEN $n1 AND $n2 AND tabel_barang.kd_kategori = $kd_kategori";

                            $query_barang_2 = "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko 
                                            WHERE tabel_barang.kd_barang = tabel_barang_gambar.id_brg 
                                            AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang
                                            AND tabel_barang.hrg_jual BETWEEN $n1 AND $n2 AND tabel_barang.kd_kategori = $kd_kategori limit $halaman_awal, $batas";

                        } else {

                            $query_barang = "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko 
                                            WHERE tabel_barang.kd_barang = tabel_barang_gambar.id_brg 
                                            AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang";

                            $query_barang_2 = "SELECT * FROM tabel_barang,tabel_barang_gambar,tabel_stok_toko 
                                            WHERE tabel_barang.kd_barang = tabel_barang_gambar.id_brg 
                                            AND tabel_barang.kd_barang = tabel_stok_toko.kd_barang
                                            limit $halaman_awal, $batas";

                        }

                        $data = mysqli_query($koneksi, $query_barang);
                        $jumlah_data = mysqli_num_rows($data);
                        $total_halaman = ceil($jumlah_data / $batas);

                        $data_barang = mysqli_query($koneksi, $query_barang_2);
                        $nomor = $halaman_awal + 1;
                        
                        while ($d = mysqli_fetch_array($data_barang)) {
                            // print_r($d);
                            $gambars = $d['gambar'];
                            $gambars = explode(",", $gambars);
                            $harga = $d['hrg_jual'];

                        ?>
                        <div class="col-xl-4 col-md-6 col-sm-12 col-6">
                            <div class="card">
                                <div class="card-content">
                                    <input type="hidden" name="kd_toko" id="kd_toko" value="<?php echo $d['kd_toko']; ?> ">
                                    <img class="card-img-top img-fluid" width="20px" height="100px"
                                        src="../img/produk/<?php echo $gambars[0]; ?>" />
                                    <div class="card-img-overlay overflow-hidden">
                                        <h4 class="card-title mt-0 pt-0">
                                            <!--<img src="w/img/logo.png" class="img-left float-left" width="35">-->
                                            <?php 
                                            if ($d['diskon'] != null) { 
                                                $diskon = ($d['hrg_jual']*$d['diskon'])/100;
                                                $harga = $harga - $diskon;
                                            ?>
                                            <div class="product-image">
                                              <span class="onsale-section">
                                              <span class="onsale"><?php echo $d['diskon']; ?>%<br>OFF</span></span>
                                            </div> 
                                            <?php } else {  ?>  
                                            <?php  } ?> 
                                        </h4>
                                    </div> 
                                    <div class="card-body text-center">
                                        <h5><?php echo $d['nm_barang']; ?></h5>
                                        <div class="divider">
                                            <div class="divider-text">
                                                <h3 class="font-medium-1 bg-info p-1">
                                                    <?php 
                                                    if ($d['diskon'] != null) { 
                                                        echo "<span class='price-normal'><sup>Rp.</sup>".$d['hrg_jual']."</span>&nbsp; ";
                                                    }?>
                                                    <strong><sup>Rp.</sup><?php echo number_format($harga, 0, ",", "."); ?></strong>
                                                </h3>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <div class="float-left">
                                                <i class="far fa-heart text-warning mr-50"></i> 4.9
                                            </div>
                                            <div class="float-right">
                                                <i class="fas fa-boxes text-info mr-50"></i> <?php echo $d['stok']; ?>
                                            </div>
                                        </div>
                                        <div class="btn-group d-xl-block d-none justify-content-between mt-2 m-0 p-0">
                                            <a href="index.php?menu=detail&kd_barang=<?php echo $d['kd_barang']; ?>"
                                                class="btn btn-info rounded-0"><i class="far fa-eye"></i> Cek Detail</a>
                                            <a onclick="add_cart(`<?php echo $d['stok'] ?>`,`<?php echo $d['kd_barang']; ?>`)" class="btn btn-secondary disabled rounded-0"><i class="fas fa-shopping-cart"></i> Beli</a>
                                        </div>
                                        <div class="card-btns d-xl-none justify-content-between mt-2 float-right">
                                            <a href="index.php?menu=detail&kd_barang=<?php echo $d['kd_barang']; ?>"
                                                class="btn btn-info btn-icon rounded-0"><i class="far fa-eye"></i>
                                            </a>
                                            <a href="index.php?menu=checkout&kd_barang=<?php echo $d['kd_barang']; ?>"
                                                class="btn btn-warning btn-icon rounded-0">
                                                <i class="fas fa-shopping-cart"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                </section>
                <!-- Ecommerce Products Ends -->

                <!-- Ecommerce Pagination Starts -->
                <section id="ecommerce-pagination" class="pb-5">
                    <div class="row">
                        <div class="col-sm-12">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center mt-2">
                                    <li class="page-item prev-item"><a class="page-link" 
                                        <?php if ($halaman > 1) {
                                        echo "href='index.php?menu=list&halaman=$previous'";
                                        } ?>></a></li>
                                    <?php for ($x = 1; $x <= $total_halaman; $x++) { ?>
                                    <li class="page-item active"><a class="page-link mr-1"
                                            href="index.php?menu=list&halaman=<?php echo $x ?>"><?php echo $x; ?></a>
                                    </li>
                                    <?php  } ?>
                                    <li class="page-item next-item">
                                        <a class="page-link mr-5" <?php if ($halaman < $total_halaman) {
                                            echo "href='index.php?menu=list&halaman=$next'";
                                        } ?>>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </section>
                <!-- Ecommerce Pagination Ends -->

            </div>
        </div>
        <div class="sidebar-detached sidebar-left">
            <div class="sidebar">
                <!-- Ecommerce Sidebar Starts -->
                <div class="sidebar-shop" id="ecommerce-sidebar-toggler">
                    <div class="row">
                        <div class="col-sm-12">
                            <h6 class="filter-heading d-none d-lg-block">Filter pencarian</h6>
                        </div>
                    </div>
                    <span class="sidebar-close-icon d-block d-md-none">
                        <i class="feather icon-x"></i>
                    </span>
                    <div class="card">
                        <div class="card-body">
                            <div class="multi-range-price">
                                <div class="multi-range-title pb-75">
                                    <h6 class="filter-title mb-0">Harga</h6>
                                </div>
                                <input type="hidden" id="pricerange" value="<?= $_GET['pricerange'] ?>">
                                <?php $price = isset($_GET['pricerange']) ? $_GET['pricerange'] : ""; ?>
                                <ul class="list-unstyled price-range" id="price-range">
                                    <li onClick="filterproduk('price','')">
                                        <span class="vs-radio-con vs-radio-primary py-25">
                                            <input type="radio" name="price-range" value="all" <?= ($price == '' ? "checked" : "") ?>>
                                            <span class="vs-radio">
                                                <span class="vs-radio--border"></span>
                                                <span class="vs-radio--circle"></span>
                                            </span>
                                            <span class="ml-50">All</span>
                                        </span>
                                    </li>
                                    <li onClick="filterproduk('price','0-50000')">
                                        <span class="vs-radio-con vs-radio-primary py-25">
                                            <input type="radio" name="price-range" value="false" <?= ($price == '0-50000' ? "checked" : "") ?>>
                                            <span class="vs-radio">
                                                <span class="vs-radio--border"></span>
                                                <span class="vs-radio--circle"></span>
                                            </span>
                                            <span class="ml-50"> &lt;=IDR 50.000</span>
                                        </span>
                                    </li>
                                    <li onClick="filterproduk('price','50000-100000')">
                                        <span class="vs-radio-con vs-radio-primary py-25">
                                            <input type="radio" name="price-range" value="false" <?= ($price == '50000-100000' ? "checked" : "") ?>>
                                            <span class="vs-radio">
                                                <span class="vs-radio--border"></span>
                                                <span class="vs-radio--circle"></span>
                                            </span>
                                            <span class="ml-50">IDR 50.000 - IDR 100.000</span>
                                        </span>
                                    </li>
                                    <li onClick="filterproduk('price','100000-200000')">
                                        <span class="vs-radio-con vs-radio-primary py-25">
                                            <input type="radio" name="price-range" value="false" <?= ($price == '100000-200000' ? "checked" : "") ?>>
                                            <span class="vs-radio">
                                                <span class="vs-radio--border"></span>
                                                <span class="vs-radio--circle"></span>
                                            </span>
                                            <span class="ml-50">IDR 100.000 - IDR 200.000</span>
                                        </span>
                                    </li>
                                    <li onClick="filterproduk('price','200000-999999999')">
                                        <span class="vs-radio-con vs-radio-primary py-25">
                                            <input type="radio" name="price-range" value="false" <?= ($price == '200000-999999999' ? "checked" : "") ?>>
                                            <span class="vs-radio">
                                                <span class="vs-radio--border"></span>
                                                <span class="vs-radio--circle"></span>
                                            </span>
                                            <span class="ml-50">&gt;= IDR 200.000</span>
                                        </span>
                                    </li>

                                </ul>
                            </div>
                            <!-- /Price Filter -->
                            <hr>

                            <!-- Categories Starts -->
                            <div id="product-categories">
                                <input type="hidden" id="kdkategori" value="<?= $_GET['kd_kategori'] ?>">
                                <?php $kat = isset($_GET['kd_kategori']) ? $_GET['kd_kategori'] : ""; ?>
                                <div class="product-category-title">
                                    <h6 class="filter-title mb-1">Kategori</h6>
                                </div>
                                <ul class="list-unstyled categories-list">
                                    <li onClick="filterproduk('kategori','')">
                                        <span class="vs-radio-con vs-radio-primary py-25">
                                            <input type="radio" name="category-filter" value="all" <?= ($kat == "" ? "checked" : "") ?>>
                                            <span class="vs-radio">
                                                <span class="vs-radio--border"></span>
                                                <span class="vs-radio--circle"></span>
                                            </span>
                                            <span class="ml-50">All</span>
                                        </span>
                                    </li>
                                    <?php error_reporting(0);
                                    $ketQuery = "SELECT * FROM tabel_kategori_barang ORDER BY nm_kategori ASC";
                                    $executeSat = mysqli_query($koneksi, $ketQuery);
                                    while ($k = mysqli_fetch_array($executeSat)) {
                                        

                                        ?>
                                    <li onClick="filterproduk('kategori','<?= $k['kd_kategori'] ?>')">
                                        <span class="vs-radio-con vs-radio-primary py-25">
                                            <input type="radio" name="category-filter" value="false" <?= ($kat == $k['kd_kategori'] ? "checked" : "") ?>>
                                            <span class="vs-radio">
                                                <span class="vs-radio--border"></span>
                                                <span class="vs-radio--circle"></span>
                                            </span>
                                            <span class="ml-50"><?php echo $k['nm_kategori']; ?></span>
                                        </span>
                                    </li>
                                    <?php

                                    }
                                    ?>
                                </ul>
                            </div>
                            <!-- Categories Ends -->
                            <hr>
                            
                            <!-- Brands -->
                            
                            <!--<div class="brands">
                                <div class="brand-title mt-1 pb-1">
                                    <h6 class="filter-title mb-0">Brands/ Merk</h6>
                                </div>
                                <div class="brand-list" id="brands">
                                    <ul class="list-unstyled">
                                        <?php error_reporting(0);
                                        $ketQuery = "SELECT * FROM tabel_merk_barang ORDER BY merk ASC";
                                        $executeSat = mysqli_query($koneksi, $ketQuery);
                                        while ($m = mysqli_fetch_array($executeSat)) {
                                        ?>
                                        <li class="d-flex justify-content-between align-items-center py-25">
                                            <span class="vs-checkbox-con vs-checkbox-primary">
                                                <input type="checkbox" value="false">
                                                <span class="vs-checkbox">
                                                    <span class="vs-checkbox--check">
                                                        <i class="vs-icon feather icon-check"></i>
                                                    </span>
                                                </span>
                                                <span class=""><?php echo $m['merk']; ?></span>
                                            </span>
                                            <?php $sql = mysqli_query($koneksi, "SELECT * FROM tabel_barang WHERE merek ='$m[id_merk]' ");
                                                $jumlah = mysqli_num_rows($sql); ?>
                                            <span><?php echo $jumlah ?></span>
                                        </li>
                                        <?php } ?>

                                    </ul>
                                </div>
                            </div>-->
                            <!-- /Brand -->
                            <hr>
                            <!-- Clear Filters Starts -->
                            <div id="clear-filters">
                                <button class="btn btn-block btn-primary" onClick="clearfilter()">CLEAR ALL FILTERS</button>
                            </div>
                            <!-- Clear Filters Ends -->
                        </div>
                    </div>
                </div>
                <!-- Ecommerce Sidebar Ends -->
            </div>
        </div>

    </div>
</div>
<!-- END: Content-->