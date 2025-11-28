import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/services/checkout_service.dart';

class CheckoutController extends GetxController {
  RxInt quantity = 1.obs;
  int subtotalPengiriman = 6000;
  int biayaLayanan = 1000;
  int? harga;
  RxInt totalHarga = 0.obs;
  RxInt totalBayar = 0.obs;
  RxInt totalBayarCheckout = 0.obs;

  int? selectBank;
  String? judul;
  String? metode;
  String? noRekening;

  int? selectAlamat;
  int? idProvinsi;
  int? idKabKot;
  int? idKecamatan;
  int? idKelurahan;
  String? namaKontak;
  String? nomorKontak;
  String? alamat;
  String? labelAlamat;

  int? selectKurir;
  String? namePengirimanKurir;
  String? nameKurir;
  int? priceKurir;
  int? minDayKurir;
  int? maxDayKurir;

  final List<Map> listKurir = [
    {
      'name_pengiriman': 'JNE',
      'name': 'Reguler',
      'price': 12000,
      'minDay': 3,
      'maxDay': 6,
    },
    {
      'name_pengiriman': 'JNT',
      'name': 'Ngegas',
      'price': 16000,
      'minDay': 2,
      'maxDay': 4,
    },
    {
      'name_pengiriman': 'JNE',
      'name': 'Ngegas Gila',
      'price': 25000,
      'minDay': 1,
      'maxDay': 2,
    },
  ];

  void changeSelectKurir(
    int value,
    String namePengiriman,
    String name,
    int price,
    int minDay,
    int maxDay,
  ) {
    selectKurir = value;
    namePengirimanKurir = namePengiriman;
    nameKurir = name;
    priceKurir = price;
    minDayKurir = minDay;
    maxDayKurir = maxDay;
    update();
  }

  void changeSelectAlamat(
    int value,
    String nama,
    String nomor,
    String detailAlamat,
    String label,
    int provinsi,
    int kabkot,
    int kecamatan,
    int kelurahan,
  ) {
    selectAlamat = value;
    namaKontak = nama;
    nomorKontak = nomor;
    alamat = detailAlamat;
    labelAlamat = label;
    idProvinsi = provinsi;
    idKabKot = kabkot;
    idKecamatan = kecamatan;
    idKelurahan = kelurahan;
    update();
    Get.back();
  }

  void changeSelectBank(
    int value,
    String metodePembayaran,
    String tujuan,
    String number,
  ) {
    selectBank = value;
    judul = metodePembayaran;
    metode = tujuan;
    noRekening = number;
    update();
  }

  void increment(int harga) {
    quantity.value++;
    totalHarga.value = harga * quantity.value;
    totalBayar.value = totalHarga.value + subtotalPengiriman + biayaLayanan;
    totalBayarCheckout.value = totalHarga.value + biayaLayanan;
  }

  void decrement(int harga) {
    if (quantity.value > 1) {
      quantity.value--;
      totalHarga.value = harga * quantity.value;
      totalBayar.value = totalHarga.value + subtotalPengiriman + biayaLayanan;
      totalBayarCheckout.value = totalHarga.value + biayaLayanan;
    }
  }

  @override
  void onInit() {
    super.onInit();

    loadProduk(); // load pertama
    initScrollListener(); // lazy load
  }

  //TAMBAH PRODUK
  RxList produkList = [].obs;

  RxBool isLoading = false.obs;
  RxBool isMoreLoading = false.obs;

  int length = 9; // jumlah data per load
  int start = 0; // offset untuk lazyload

  String token = "";

  ScrollController scrollC = ScrollController();

  void initScrollListener() {
    scrollC.addListener(() {
      if (scrollC.position.pixels == scrollC.position.maxScrollExtent) {
        loadMore();
      }
    });
  }

  Future<void> loadProduk() async {
    isLoading.value = true;

    final params = {
      "harga": "retail",
      "show_as_product": "1",
      "length": length.toString(),
      "start": start.toString(),
    };

    try {
      final res = await CheckoutService().pilihProduk(params);

      if (res.statusCode == 200) {
        produkList.assignAll(res.body['data']);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMore() async {
    if (isMoreLoading.value) return;

    isMoreLoading.value = true;
    start += length;

    final params = {
      "harga": "retail",
      "show_as_product": "1",
      "length": length.toString(),
      "start": start.toString(),
    };

    try {
      final res = await CheckoutService().pilihProduk(params);

      if (res.statusCode == 200) {
        final newData = res.body['data'];
        if (newData != null && newData.length > 0) {
          produkList.addAll(newData);
        }
      }
    } finally {
      isMoreLoading.value = false;
    }
  }

  // List produk terpilih
  RxList<Map<String, dynamic>> selectedProduk = <Map<String, dynamic>>[].obs;

  // Qty untuk tiap produk (gunakan id sebagai key)
  RxMap<int, int> qtyPerProduk = <int, int>{}.obs;

  void addProduct(Map<String, dynamic> produk) {
    selectedProduk.add(produk);
    qtyPerProduk[produk['id']] = 1;
    update();
  }

  /// SET QTY
  void incrementQty(int index) {
    qtyPerProduk[index] = (qtyPerProduk[index] ?? 0) + 1;
    update();
  }

  void decrementQty(int index) {
    if ((qtyPerProduk[index] ?? 0) > 0) {
      qtyPerProduk[index] = qtyPerProduk[index]! - 1;
      update();
    }
  }

  /// SIMPAN PRODUK YANG DIPILIH
  void simpanProdukTerpilih() {
    selectedProduk.clear();

    for (var i = 0; i < produkList.length; i++) {
      int qty = qtyPerProduk[i] ?? 0;
      if (qty > 0) {
        selectedProduk.add({"produk": produkList[i], "qty": qty});
      }
    }

    print("Produk tersimpan: $selectedProduk");
    Get.back(); // kembali ke halaman sebelumnya
  }
}
