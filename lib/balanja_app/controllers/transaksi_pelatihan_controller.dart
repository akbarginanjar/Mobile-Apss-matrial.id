import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/transaksi_pelatihan_service.dart';

class TransaksiPelatihanController extends GetxController {
  final TransaksiPelatihanService _service = TransaksiPelatihanService();

  var transaksiPending = <Transaksi>[].obs;
  var transaksiExpired = <Transaksi>[].obs;
  var transaksiSelesai = <Transaksi>[].obs;
  var transaksiDibatalkan = <Transaksi>[].obs;

  var isLoading = false.obs;

  var isExpiredLoaded = false.obs;
  var isSelesaiLoaded = false.obs;
  var isDibatalkanLoaded = false.obs;

  Future<void> loadPending() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiPelatihanByStatus("pending");
      transaksiPending.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadExpired({bool force = false}) async {
    if (isSelesaiLoaded.value && !force) return;
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiPelatihanByStatus("expired");
      transaksiSelesai.assignAll(result);
      isSelesaiLoaded.value = true;
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
      final result = await _service.getTransaksiPelatihanByStatus("selesai");
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
      final result = await _service.getTransaksiPelatihanByStatus("dibatalkan");
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