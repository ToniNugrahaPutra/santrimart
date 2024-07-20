<style type="text/css">
    table.dataTable thead tr {
        background-color: #337ab7;
        color: #fff;
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
        color: #fff;
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

    .nama-user {
        font-size: 12px;
        animation: blink-animation 1s steps(3, start) infinite;
        -webkit-animation: blink-animation 1s steps(3, start) infinite;
    }

    .text-user {
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
        top: 19.5rem;
        right: -0.5rem;
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

    .horizontal-menu.navbar-floating:not(.blank-page) .app-content {
        padding-top: -6.25rem;
    }

    html body .content.app-content {
        overflow: hidden;
        margin-top: -130px;
    }
</style>


<!-- BEGIN: Content-->
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
                                <li class="breadcrumb-item"><a href="#" class="text-dark">Sales Report</a>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <?php
                include "../inc/koneksi.php";
                //untuk menantukan tanggal awal dan tanggal akhir data di database
                
                $min_tanggal_query = "SELECT MIN(tgl_penjualan) AS min_tanggal FROM tabel_penjualan";
                $max_tanggal_query = "SELECT MAX(tgl_penjualan) AS max_tanggal FROM tabel_penjualan";

                $min_tanggal_result = mysqli_fetch_assoc(mysqli_query($koneksi, $min_tanggal_query));
                $max_tanggal_result = mysqli_fetch_assoc(mysqli_query($koneksi, $max_tanggal_query));

                // Ambil nilai tanggal dari hasil query
                $min_tanggal = $min_tanggal_result['min_tanggal'];
                $max_tanggal = $max_tanggal_result['max_tanggal'];

                // Ubah format tanggal ke 'j F Y'
                if ($min_tanggal !== null) {
                $min_date = DateTime::createFromFormat('Y-m-d H:i:s', $min_tanggal);
                $max_date = DateTime::createFromFormat('Y-m-d H:i:s', $max_tanggal);

                $formatted_min_date = $min_date->format('j F, Y');
                $formatted_max_date = $max_date->format('j F, Y');
                }
                ?>
                <!-- Column selectors with Export Options and print table -->
                <section id="column-selectors">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="divider">
                                    <div class="divider-text">
                                        <h3 class="mb-3 display-5 text-uppercase">Laporan Penjualan</h3>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <div class="card-body card-dashboard">
                                        <div class="row">
                                            <?php
                                            if ($min_tanggal !== null) {
                                                ?>
                                                <div class="col-lg-3 col-12 mb-3">
                                                    <form action="index.php?menu=sales" method="post" name="postform">
                                                        <div class="divider">
                                                            <div class="divider-text">
                                                                <h5 class="mb-3 font-medium-1 text-uppercase">Tanggal Awal
                                                                </h5>
                                                            </div>
                                                        </div>
                                                        <div class="input-group">
                                                            <input type='text' name="tanggal_awal"
                                                                class="form-control pickadate"
                                                                value="<?php echo $formatted_min_date ?>" />
                                                            <div class="input-group-append" id="button-addon2">
                                                                <button class="btn btn-primary rounded-0" type="button"><i
                                                                        class="far fa-calendar-minus"></i></button>
                                                            </div>
                                                        </div>
                                                        <div class="divider">
                                                            <div class="divider-text">
                                                                <h5 class="mb-3 font-medium-1 text-uppercase">Tanggal Akhir
                                                                </h5>
                                                            </div>
                                                        </div>
                                                        <div class="input-group">
                                                            <input type='text' name="tanggal_akhir"
                                                                class="form-control pickadate"
                                                                value="<?php echo $formatted_max_date ?>" />
                                                            <div class="input-group-append" id="button-addon2">
                                                                <button class="btn btn-primary rounded-0" type="button"><i
                                                                        class="far fa-calendar-plus"></i></button>
                                                            </div>
                                                        </div>
                                                        <button type="submit" name="cari"
                                                            class="btn btn-block btn-info mt-2 text-white rounded-0">TAMPIL</button>
                                                    </form>
                                                </div>
                                                <?php
                                            }
                                            ?>
                                            <div class="col-lg-9 col-12 mb-1">
                                                <?php
                                                if (isset($_POST['cari'])) {
                                                    $tanggal_awal1 = isset($_POST['tanggal_awal']) ? $_POST['tanggal_awal'] : '';
                                                    $tanggal_akhir1 = isset($_POST['tanggal_akhir']) ? $_POST['tanggal_akhir'] : '';

                                                    $tanggal_awal = $tanggal_akhir = '';

                                                    if (!empty($tanggal_awal1) && !empty($tanggal_akhir1)) {
                                                        try {
                                                            $tanggal_awal2 = DateTime::createFromFormat('j F, Y', $tanggal_awal1);
                                                            $tanggal_akhir2 = DateTime::createFromFormat('j F, Y', $tanggal_akhir1);

                                                            if ($tanggal_awal2 && $tanggal_akhir2) {
                                                                $tanggal_awal = $tanggal_awal2->format('Y-m-d') . ' 00:00:00';
                                                                $tanggal_akhir = $tanggal_akhir2->format('Y-m-d') . ' 23:59:59';
                                                            }
                                                        } catch (Exception $e) {
                                                            echo "Error: " . $e->getMessage();
                                                        }
                                                    }

                                                    // Prepare database queries
                                                    if (empty($tanggal_awal) && empty($tanggal_akhir)) {
                                                        $stmt = $koneksi->prepare("SELECT * FROM tabel_penjualan ORDER BY tgl_penjualan DESC");
                                                        $stmt_total = $koneksi->prepare("SELECT SUM(total_penjualan) AS total FROM tabel_penjualan");
                                                    } else {
                                                        $stmt = $koneksi->prepare("SELECT * FROM tabel_penjualan WHERE tgl_penjualan BETWEEN ? AND ? ORDER BY tgl_penjualan DESC");
                                                        $stmt->bind_param("ss", $tanggal_awal, $tanggal_akhir);
                                                        $stmt_total = $koneksi->prepare("SELECT SUM(total_penjualan) AS total FROM tabel_penjualan WHERE tgl_penjualan BETWEEN ? AND ?");
                                                        $stmt_total->bind_param("ss", $tanggal_awal, $tanggal_akhir);
                                                    }

                                                    $stmt->execute();
                                                    $query = $stmt->get_result();

                                                    $stmt_total->execute();
                                                    $jumlah = $stmt_total->get_result()->fetch_assoc();
                                                    ?>

                                                    <span class="nama-user" style="color: #d16010;">
                                                        <i><b>Data Penjualan : </b> Pencarian dari tanggal
                                                            <b><?php echo htmlspecialchars($tanggal_awal1) ?></b> sampai
                                                            dengan
                                                            tanggal <b><?php echo htmlspecialchars($tanggal_akhir1) ?></b>
                                                        </i>
                                                    </span>

                                                    <div class="badge badge-primary float-right">
                                                        Total Penjualan
                                                        <span class="font-small-3 nama-user">
                                                            Rp. <?php echo number_format($jumlah['total'], 0, ',', '.') ?>
                                                        </span>
                                                    </div>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped dataex-html5-selectors"
                                                            id="example-table">
                                                            <button id="export-button"
                                                                class="btn btn-secondary">Excel</button>
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col" width="5%">No</th>
                                                                    <th scope="col" width="10%">Faktur</th>
                                                                    <th scope="col" width="15%">Tanggal</th>
                                                                    <th scope="col" width="15%">Penjualan</th>
                                                                    <th scope="col" width="25%">Barang</th>
                                                                    <th scope="col" width="10%">Member</th>
                                                                    <th scope="col" width="25%">Keterangan</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <?php
                                                                $no = 0;
                                                                while ($row = $query->fetch_assoc()) {
                                                                    $no++;
                                                                    ?>
                                                                    <tr>
                                                                        <td style="vertical-align: top;"><?php echo $no; ?></td>
                                                                        <td style="vertical-align: top;">
                                                                            <?php echo htmlspecialchars($row['no_faktur_penjualan']); ?>
                                                                        </td>
                                                                        <td style="vertical-align: top;">
                                                                            <?php echo htmlspecialchars($row['tgl_penjualan']); ?>
                                                                        </td>
                                                                        <td style="vertical-align: top;">
                                                                            <?php echo htmlspecialchars($row['total_penjualan']); ?>
                                                                        </td>
                                                                        <td>
                                                                            <?php
                                                                            $stmt_barang = $koneksi->prepare("SELECT b.nm_barang, r.jumlah, r.harga 
                                                                  FROM tabel_barang b 
                                                                  JOIN tabel_rinci_penjualan r ON b.kd_barang = r.kd_barang 
                                                                  WHERE r.no_faktur_penjualan = ?");
                                                                            $stmt_barang->bind_param("s", $row['no_faktur_penjualan']);
                                                                            $stmt_barang->execute();
                                                                            $result_barang = $stmt_barang->get_result();

                                                                            while ($d = $result_barang->fetch_assoc()) {
                                                                                $total_hrg = $d['harga'] * $d['jumlah'];
                                                                                echo htmlspecialchars($d['jumlah']) . " &nbsp; " . htmlspecialchars($d['nm_barang']) . "<hr />";
                                                                            }
                                                                            ?>
                                                                        </td>
                                                                        <td style="vertical-align: top;">
                                                                            <?php
                                                                            $stmt_member = $koneksi->prepare("SELECT nm_user FROM tabel_member WHERE id_user = ?");
                                                                            $stmt_member->bind_param("s", $row['id_user']);
                                                                            $stmt_member->execute();
                                                                            $result_member = $stmt_member->get_result();
                                                                            $e = $result_member->fetch_assoc();
                                                                            echo htmlspecialchars(rtrim($e['nm_user']));
                                                                            ?>
                                                                        </td>
                                                                        <td style="vertical-align: top;">
                                                                            <?php echo htmlspecialchars($row['ket']); ?>
                                                                        </td>
                                                                    </tr>
                                                                <?php } ?>
                                                            </tbody>
                                                            <tfoot>
                                                                <tr>
                                                                    <th colspan="3">TOTAL</th>
                                                                    <th>
                                                                        Rp.
                                                                        <?php echo number_format($jumlah['total'], 2, ',', '.'); ?>
                                                                    </th>
                                                                    <th colspan="3"></th>
                                                                </tr>
                                                            </tfoot>
                                                        </table>
                                                    </div>
                                                    <?php
                                                    if ($query->num_rows == 0) {
                                                        echo "<p class='text-danger'><i>Tidak ada data yang dicari!</i></p>";
                                                    }
                                                } else {
                                                    echo "<p>Silakan masukkan kriteria pencarian.</p>";
                                                }
                                                ?>
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
        <!-- END: Content-->
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#export-button").click(function () {
            // Mendapatkan tanggal saat ini
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            var filename = 'sales_' + yyyy + '-' + mm + '-' + dd + '.xlsx'; // Nama file dengan format 'example_tahun-bulan-tanggal.xlsx'

            var wb = XLSX.utils.table_to_book(document.getElementById('example-table'), { sheet: "Sheet JS" });
            var wbout = XLSX.write(wb, { bookType: 'xlsx', type: 'binary' });

            function s2ab(s) {
                var buf = new ArrayBuffer(s.length);
                var view = new Uint8Array(buf);
                for (var i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
                return buf;
            }

            saveAs(new Blob([s2ab(wbout)], { type: "application/octet-stream" }), filename);
        });
    });

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>