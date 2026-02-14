import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_balanja_id/balanja_app/services/griya_service.dart';

class GriyaController extends GetxController {
  final GriyaService _service = GriyaService();

  var isLoading = false.obs;

  Future<void> registerGriya({
    required String nama,
    required String deskripsi,
    required String alamat,
  }) async {
    try {
      isLoading.value = true;
      EasyLoading.show(status: 'Mendaftarkan...');

      final response = await _service.registerGriya(
        nama: nama,
        deskripsi: deskripsi,
        alamat: alamat,
      );

      if (response.statusCode == 200) {
        EasyLoading.showSuccess('Berhasil daftar Griya Sehat');
        Get.back(result: 'success');
      } else {
        EasyLoading.showError(
            response.body['message'] ?? 'Gagal daftar Griya Sehat');
      }
    } catch (e) {
      EasyLoading.showError('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}