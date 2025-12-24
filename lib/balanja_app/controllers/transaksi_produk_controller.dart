import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/transaksi_produk_service.dart';

class TransaksiProdukController extends GetxController {
  final TransaksiProdukService _service = TransaksiProdukService();

  var transaksiPending = <Transaksi>[].obs;
  var transaksiDiproses = <Transaksi>[].obs;
  var transaksiDikirim = <Transaksi>[].obs;
  var transaksiDiterima = <Transaksi>[].obs;
  var transaksiSelesai = <Transaksi>[].obs;
  var transaksiDibatalkan = <Transaksi>[].obs;

  var isLoading = false.obs;

  var isDiprosesLoaded = false.obs;
  var isDikirimLoaded = false.obs;
  var isDiterimaLoaded = false.obs;
  var isSelesaiLoaded = false.obs;
  var isDibatalkanLoaded = false.obs;

  Future<void> loadPending() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukByStatus("pending");
      transaksiPending.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDiproses({bool force = false}) async {
    if (isDiprosesLoaded.value && !force) return;
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukByStatus("diproses");
      transaksiDiproses.assignAll(result);
      isDiprosesLoaded.value = true;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDikirim({bool force = false}) async {
    if (isDikirimLoaded.value && !force) return;
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukByStatus("dikirim");
      transaksiDikirim.assignAll(result);
      isDikirimLoaded.value = true;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDiterima({bool force = false}) async {
    if (isDiterimaLoaded.value && !force) return;
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukByStatus("diterima");
      transaksiDiterima.assignAll(result);
      isDiterimaLoaded.value = true;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadSelesai({bool force = false}) async {
    if (isSelesaiLoaded.value && !force) return;
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukByStatus("selesai");
      transaksiSelesai.assignAll(result);
      isSelesaiLoaded.value = true;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDibatalkan({bool force = false}) async {
    if (isDibatalkanLoaded.value && !force) return;
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukByStatus("dibatalkan");
      transaksiDibatalkan.assignAll(result);
      isDibatalkanLoaded.value = true;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  @override
  void onInit() {
    super.onInit();
    loadPending();
  }
}