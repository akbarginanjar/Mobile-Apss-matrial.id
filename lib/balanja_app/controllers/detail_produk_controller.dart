import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/produk_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/produk_service.dart';

class DetailProdukController extends GetxController {
  final ProdukService service = ProdukService();

  RxBool isLoading = false.obs;
  Rx<Produk?> detailProduk = Rx<Produk?>(null);

  Future<void> loadDetailProduk(String slug) async {
    isLoading.value = true;

    try {
      final params = {'harga': 'retail', 'show_as_product': '1'};

      final response = await service.detailProduk(params, slug);

      if (response.statusCode == 200 && response.body != null) {
        detailProduk.value = Produk.fromJson(response.body);
      } else {
        Get.snackbar(
          'Error',
          'Gagal memuat produk',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
