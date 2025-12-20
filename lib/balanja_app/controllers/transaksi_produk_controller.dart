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

  Future<void> loadPending() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukPending();
      transaksiPending.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDiproses() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukDiproses();
      transaksiDiproses.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDikirim() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukDikirim();
      transaksiDikirim.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDiterima() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukDiterima();
      transaksiDiterima.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadSelesai() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukSelesai();
      transaksiSelesai.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDibatalkan() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiProdukDibatalkan();
      transaksiDibatalkan.assignAll(result);
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
    loadDiproses();
    loadDikirim();
    loadDiterima();
    loadSelesai();
    loadDibatalkan();
  }
}