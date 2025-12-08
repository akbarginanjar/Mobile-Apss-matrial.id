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
  String? latAlamat;
  String? longAlamat;
  String? postalCode;

  String? selectShipment;
  String? namaShipment;
  String? deskripsiShipment;

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

  void changeSelectShipment(String value, String nama, String deskripsi) {
    selectShipment = value;
    namaShipment = nama;
    deskripsiShipment = deskripsi;
    update();
    Get.back();
  }

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
    String lat,
    String long,
    String kodepos,
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
    latAlamat = lat;
    longAlamat = long;
    postalCode = kodepos;
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

  // void increment(int harga) {
  //   quantity.value++;
  //   totalHarga.value = harga * quantity.value;
  //   totalBayar.value = totalHarga.value + subtotalPengiriman + biayaLayanan;
  //   totalBayarCheckout.value = totalHarga.value + biayaLayanan;
  // }

  // void decrement(int harga) {
  //   if (quantity.value > 1) {
  //     quantity.value--;
  //     totalHarga.value = harga * quantity.value;
  //     totalBayar.value = totalHarga.value + subtotalPengiriman + biayaLayanan;
  //     totalBayarCheckout.value = totalHarga.value + biayaLayanan;
  //   }
  // }

  Map<String, dynamic>? alamatToko;
  RxBool isLoadingAlamatToko = false.obs;

  Future<void> loadAlamatToko() async {
    isLoadingAlamatToko.value = true;

    final params = {"member_id": GetStorage().read('member_id').toString()};

    try {
      final res = await CheckoutService().alamatToko(params);
      print(res.body);
      if (res.statusCode == 200) {
        alamatToko = res.body;
        update(); // jika pakai GetBuilder
      }
    } finally {
      isLoadingAlamatToko.value = false;
    }
  }

  Map<String, dynamic>? produkUtama; // menyimpan data produk utama
  String idProdukUtama = ""; // akan di-set dari view

  void setProdukUtama(Map<String, dynamic> produk) {
    idProdukUtama = produk['id'].toString();
    produkUtama = produk;
    cart[idProdukUtama] = 1;

    update(); // untuk GetBuilder
  }

  @override
  void onInit() {
    super.onInit();
    loadAlamatToko();
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

  // key: idProduk, value: qty
  RxMap<String, int> cart = <String, int>{}.obs;

  // Mendapatkan qty berdasarkan id produk
  int getQty(String idProduk) {
    return cart[idProduk] ?? 0;
  }

  // Menambah qty
  void increment(String idProduk) {
    cart[idProduk] = (cart[idProduk] ?? 0) + 1;
    update();
  }

  // Mengurangi qty
  void decrement(String idProduk) {
    if (!cart.containsKey(idProduk)) return;

    int currentQty = cart[idProduk] ?? 0;

    // PRODUK UTAMA → minimal qty = 1
    if (idProduk == idProdukUtama) {
      if (currentQty > 1) {
        cart[idProduk] = currentQty - 1;
      }
      update();
      return;
    }

    // PRODUK BIASA
    if (currentQty <= 1) {
      cart.remove(idProduk);
    } else {
      cart[idProduk] = currentQty - 1;
    }

    update();
  }

  Map<String, dynamic>? findProdukById(String id) {
    // cek produk utama dulu
    if (produkUtama != null && produkUtama!['id'].toString() == id) {
      return produkUtama;
    }

    // cari di list produk lainnya
    return produkList.firstWhere(
      (p) => p['id'].toString() == id,
      orElse: () => null,
    );
  }

  // Ambil semua produk yang dipilih (id + qty)
  List<Map<String, dynamic>> getSelectedItemsKurir() {
    return cart.entries.map((e) {
      final id = e.key;
      final qty = e.value;

      final produk = findProdukById(id);

      if (produk == null) {
        return {"name": "Unknown", "value": 0, "quantity": qty, "weight": 0};
      }

      return {
        "name": produk['nama'] ?? '',
        "value": produk['barang_id'] ?? 0,
        "quantity": qty,
        "weight": produk['berat'] ?? 0,
      };
    }).toList();
  }

  List<Map<String, dynamic>> getSelectedProducts() {
    return cart.entries.map((e) {
      final id = e.key;
      final qty = e.value;

      final produk = findProdukById(id);

      if (produk == null) {
        return {"name": "Unknown", "value": 0, "quantity": qty, "weight": 0};
      }

      return {
        "penyimpanan_id": produk['id'] ?? 0,
        "barang_id": produk['barang_id'] ?? 0,
        "qty": qty,
        "harga": produk['harga'] ?? 0,
      };
    }).toList();
  }
}
