import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/transaksi_jasa_service.dart';

class TransaksiJasaController extends GetxController {
  final TransaksiJasaService _service = TransaksiJasaService();

  var transaksiPending = <Transaksi>[].obs;
  var transaksiDiproses = <Transaksi>[].obs;
  var transaksiDiperjalanan = <Transaksi>[].obs;
  var transaksiDitujuan = <Transaksi>[].obs;
  var transaksiSelesai = <Transaksi>[].obs;
  var transaksiDibatalkan = <Transaksi>[].obs;

  var isLoading = false.obs;

  Future<void> loadPending() async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiJasaByStatus("pending");
      transaksiPending.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDiproses({bool force = false}) async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiJasaByStatus("diproses");
      transaksiDiproses.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDiperjalanan({bool force = false}) async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiJasaByStatus("Diperjalanan");
      transaksiDiperjalanan.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDitujuan({bool force = false}) async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiJasaByStatus("Ditujuan");
      transaksiDitujuan.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadSelesai({bool force = false}) async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiJasaByStatus("selesai");
      transaksiSelesai.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadDibatalkan({bool force = false}) async {
    try {
      isLoading.value = true;
      final result = await _service.getTransaksiJasaByStatus("dibatalkan");
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
  }
}