<head>
  <script src="https://cdn.jsdelivr.net/npm/quagga"></script>
</head>
<style type="text/css">
  .horizontal-menu.navbar-floating:not(.blank-page) .app-content {
    padding-top: -6.25rem;
  }

  html body .content.app-content {
    overflow: hidden;
    margin-top: -130px;
  }
</style>

<!-- BEGIN: Content -->
<div class="app-content content">
  <div class="content-overlay"></div>
  <div class="header-navbar-shadow"></div>
  <div class="content-wrapper">
    <div class="content-header row">
      <div class="content-header-left col-md-9 col-12 mb-2">
        <div class="row breadcrumbs-top">
          <div class="col-12">
            <h2 class="content-header-title float-left mb-0 text-dark text-capitalize"><?php echo $_SESSION['akses']; ?>
            </h2>
            <div class="breadcrumb-wrapper col-12">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.php?menu=home" class="text-dark">Home</a>
                </li>
                <li class="breadcrumb-item"><a href="#" class="text-dark">BON</a>
                </li>
              </ol>
            </div>
          </div>
        </div>
      </div>
    </div>



    <div class="row">
      <div class="col-lg-8 col-md-12 col-sm-12">
        <!-- Data list view starts -->
        <section id="horizontal-vertical">
          <!-- dataTable starts -->
          <div class="card">
            <div class="row mt-2 p-1">
              <div class="col-lg-12 col-12">
                <div class="form-group">
                  <label for="kd_barang_input">Kode Barang</label>
                  <input type="text" class="form-control" id="kd_barang_input" placeholder="Masukkan Kode Barang">
                </div>
              </div>
              <div class="col-lg-12 col-12">
                <div class="form-group">
                  <label for="nm_barang_input">Nama Barang</label>
                  <input type="text" class="form-control" id="nm_barang_input" placeholder="Masukkan Nama Barang">
                </div>
              </div>
              <div class="col-lg-12 col-12">
                <div class="form-group">
                  <label for="hrg_jual_input">Harga Jual</label>
                  <input type="number" class="form-control" id="hrg_jual_input" placeholder="Masukkan Harga Jual">
                </div>
              </div>
              <div class="col-lg-12 col-12">
                <div class="form-group">
                  <label for="jumlah_input">Jumlah</label>
                  <input type="number" class="form-control" id="jumlah_input" placeholder="Masukkan Jumlah">
                </div>
              </div>
              <div class="col-lg-12 col-12">
                <button class="btn btn-primary" onclick="add_data()">Simpan Data</button>
              </div>
            </div>

            <div class="table-responsive p-1">
              <table class="table text-center table-striped" id="tableTransaksi">
                <thead>
                  <tr>
                    <th>ID.BARANG</th>
                    <th>PRODUK</th>
                    <th>HARGA</th>
                    <th>JUMLAH</th>
                    <th>SUBTOTAL</th>
                    <th>HAPUS</th>
                  </tr>
                </thead>
                <tbody id="isi-tabel">
                  <tr id="tabel-contoh">
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-
                      <!-- <form> -->
                      <!-- <div class="d-inline-block mb-1">
                   <div class="input-group">
                     <input type="number" class="touchspin rounded-0" value="1">
                   </div>
                 </div> -->
                      <!-- </form>  -->
                    </td>
                    <!-- <td>-</td> -->
                    <td>-</td>
                    <td><a href="#" class="action-delete"><i class="far fa-trash-alt"></i></a></td>
                  </tr>


                </tbody>
              </table>
              <hr class="mt-2 mb-2">
              <table class="table">

                <tbody class="text-center">

                  <tr class="footer-tr">

                    <td>Disc</td>

                    <td>0</td>

                    <td>Total Barang</td>

                    <td id="sum-product">0</td>

                    <td>Total Harga</td>

                    <td id="sum_price">Rp.0</td>

                  </tr>

                </tbody>

              </table>
            </div>
            <!-- dataTable ends -->
          </div>
        </section>
        <!-- Data list view end -->
      </div>
      <div class="col-lg-4 col-md-12 col-sm-12">
        <div class="card">
          <div class="content-body">
            <div class="card-body">
              <div class="card">
                <div class="card-content">
                  <div class="card-body">
                    <form class="form form-horizontal" method="post" action="../aksi/add_penjualan2.php">
                      <div class="form-body">
                        <div class="row">
                          <div class="col-12 mb-2">
                            <?php
                            $kd_toko = $_SESSION['kd_toko'];
                            // membuat nomor faktur
                            $nomorFaktur = "OFF";
                            $query_tabel_toko = "SELECT * FROM `tabel_toko` WHERE `kd_toko` = '$kd_toko'";
                            $hasil_tabel_toko = mysqli_fetch_array(mysqli_query($koneksi, $query_tabel_toko));
                            $nama_toko_upper = strtoupper(substr($hasil_tabel_toko['nm_toko'], 0, 3));
                            // no faktur + nama toko
                            $nomorFaktur .= $nama_toko_upper;

                            $query_tabel_penjualan = "SELECT * FROM `tabel_penjualan` WHERE `no_faktur_penjualan` LIKE '%$nama_toko_upper%'";
                            $hasil_tabel_penjualan = mysqli_query($koneksi, $query_tabel_penjualan);
                            $old_faktur = "";
                            $new_faktur = "";
                            while ($h = mysqli_fetch_array($hasil_tabel_penjualan)) {
                              $old_faktur = $h['no_faktur_penjualan'];
                            }

                            // no faktur + urutan
                            if ($old_faktur == null) {
                              $new_faktur .= "00001";
                            } else {
                              $old_faktur = substr($old_faktur, strlen($old_faktur) - 5) + 1;
                              $nol = 5 - strlen($old_faktur);
                              while ($nol > 0) {
                                $new_faktur .= '0';
                                $nol--;
                              }
                              $new_faktur = $new_faktur . $old_faktur;
                            }
                            $nomorFaktur .= $new_faktur;
                            ?>
                            <h3 class="display-4 text-center m-1"><?php echo $nomorFaktur; ?></h3>
                          </div>

                          <input type="text" name="kd_barang" id="id_barang" hidden>
                          <input type="text" name="hrg_produk" id="hrg_produk" hidden>

                          <input type="text" name="jumlah" id="jumlah" hidden>

                          <input type="text" name="faktur" value="<?php echo $nomorFaktur; ?>" hidden>

                          <div class="col-12">
                            <div class="form-group row">
                              <div class="col-md-4"><span>Harga Total</span></div>
                              <div class="col-md-8">
                                <div class="position-relative has-icon-left">
                                  <input type="text" readonly class="form-control" id="must-price" name="total"
                                    placeholder="Total">
                                  <div class="form-control-position"><i class="fas fa-tasks"></i></div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div class="col-12">
                            <div class="form-group row">
                              <div class="col-md-4"><span>Bayar</span></div>
                              <div class="col-md-8">
                                <div class="position-relative has-icon-left">
                                  <input type="text" readonly class="form-control" id="price" name="bayar"
                                    placeholder="Bayar">
                                  <input type="text" id="price-awal" name="price-awal" hidden>
                                  <div class="form-control-position"><i class="fas fa-money-bill-wave-alt"></i></div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div class="col-12">
                            <div class="form-group row">
                              <div class="col-md-4"><span>Kembali</span></div>
                              <div class="col-md-8">
                                <div class="position-relative has-icon-left">
                                  <input type="text" readonly class="form-control" id="change-price" name="kembalian"
                                    placeholder="Kembali">
                                  <div class="form-control-position"><i class="fas fa-money-bill-wave-alt"></i></div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div class="col-12 mb-2">
                            <fieldset>
                              <label for="basicInput">Cash</label>
                              <div class="input-group">
                                <input type="text" id="cash" class="form-control" placeholder="Masukkan Jumlah Uang"
                                  aria-describedby="button-addon2">
                                <div class="input-group-append" id="button-addon2">
                                  <button class="btn btn-primary rounded-0" type="button"
                                    onclick="hitung_kembalian()">HITUNG</button>
                                </div>
                              </div>
                            </fieldset>
                          </div>
                          <div class="col-12 mb-3" id="action-buttons">
                            <div class="d-flex flex-column flex-xxl-column w-100" role="group">
                              <button type="submit" class="btn btn-primary mb-2 w-100" name="add_penjualan">
                                Print
                              </button>
                              <button type="button" class="btn btn-danger w-100" onclick="window.location.reload()">
                                Batal
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </form>
                    <!-- <button type="button" onclick="hitungDataTabel()">hi</button> -->
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>


</div>
</div>
<script type="text/javascript">
  function add_data() {
    // Ambil nilai dari input form menggunakan jQuery
    var kd_barang = $("#kd_barang_input").val();
    var nm_barang = $("#nm_barang_input").val();
    var hrg_jual = $("#hrg_jual_input").val();
    var jumlah = $("#jumlah_input").val();

    // Hitung total harga
    var total_harga = hrg_jual * jumlah;

    // Buat baris baru untuk ditambahkan ke tabel
    var text = `<tr id="kode${kd_barang}">                                    
                    <td id="kd_barang">${kd_barang}</td>
                    <td>${nm_barang}</td>
                    <td>
                      <div class="d-inline-block mb-1">
                        <div class="input-group">
                          <input type="text" value="${hrg_jual}" onkeyup="cek_jumlah()" disabled>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="d-inline-block mb-1">
                        <div class="input-group">
                          <input type="number" class="touchspin rounded-0" value="${jumlah}" onchange="cek_jumlah()">
                        </div>
                      </div>
                    </td>
                    <td id="sum_harga">${total_harga}</td>
                    <td><a href="#" class="action-delete" onclick="delete_(this)"><i class="far fa-trash-alt"></i></a></td>
                </tr>`;

    // Hapus baris contoh jika ada
    $("#tabel-contoh").remove();

    // Tambahkan baris baru ke tabel menggunakan jQuery
    $("#tableTransaksi > tbody").append(text);

    // Panggil fungsi untuk menghitung jumlah total atau melakukan aksi lainnya
    cek_jumlah();
    set_jumlah();
    hitungDataTabel();
  }

  function delete_(btn) {
    // console.log("kode"+id)
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
    // $("#kode"+id+"").remove();

    cek_jumlah();

    set_jumlah();
  }

  function cek_jumlah() {

    $("#tableTransaksi tr").each(function (i) {

      var self = $(this);

      var col_3 = self.find("td:eq(2) input[type='text']").val();

      var col_4 = self.find("td:eq(3) input[type='number']").val();

      var jumlah = parseInt(col_3) * parseInt(col_4);

      if (i > 0) {

        var col_5 = self.find("td:eq(4)").text(jumlah);

      }

    });

    set_jumlah();

  }



  function set_jumlah() {

    var totalHarga = 0;

    var jumlah = 0;

    var jumlahBarang = 0;

    $("#tableTransaksi tr").each(function (i) {

      var self = $(this);

      var col_3 = self.find("td:eq(2) input[type='text']").val();

      var col_4 = self.find("td:eq(3) input[type='number']").val();

      if (i > 0) {

        jumlah = parseInt(col_3) * parseInt(col_4);

        var col_5 = self.find("td:eq(4)").text(jumlah);

        jumlahBarang = jumlahBarang + parseInt(col_4);

      }

      totalHarga = totalHarga + jumlah;

    });

    $("#sum_price").text("Rp." + totalHarga);

    $("#price-awal").val(totalHarga);

    $("#must-price").val(totalHarga);

    $("#sum-product").text(jumlahBarang);

    // hitung_kembalian();

  }

  function hitung_total() {
    var total_bayar = $("#sum_price").text();
    total_bayar = total_bayar.substring(3);

    var totalBayar = $("#must-price").val();
    var pengiriman = $("#pengiriman").val();
    var total = "";
    console.log(total_bayar);
    if (pengiriman == "") {
      total = total_bayar
    } else {
      total = parseInt(total_bayar) + parseInt(pengiriman);
    }
    $("#must-price").val(total);
  }

  function hitung_kembalian() {


    var bayar = $("#cash").val();

    var totalBayar = $("#must-price").val();

    var kembalian = bayar - totalBayar;

    $("#price").val(bayar);

    $("#change-price").val(kembalian);

    $("#cash").val("");

    $("#sum-price").val("Rp." + bayar);

    hitungDataTabel()

  }

  function hitungDataTabel() {
    var kode = "";
    var hrg = "";
    var jml = "";

    $("#isi-tabel tr").each(function (i) {

      var self = $(this);

      var col_0 = self.find("td:eq(0)").text().trim();

      var col_3 = self.find("td:eq(2) input[type='text']").val();

      var col_4 = self.find("td:eq(3) input[type='number']").val();

      kode += col_0 + ',';
      hrg += col_3 + ',';
      jml += col_4 + ',';

    });


    kode = kode.substring(0, kode.length - 1);
    hrg = hrg.substring(0, hrg.length - 1);
    jml = jml.substring(0, jml.length - 1);

    $('#id_barang').val(kode);
    $('#hrg_produk').val(hrg);
    $('#jumlah').val(jml);

    // console.log(kode)

  }
</script>
<!-- END: Content