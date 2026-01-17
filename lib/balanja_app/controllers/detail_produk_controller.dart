import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/produk_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/produk_service.dart';

class DetailProdukController extends GetxController {
  final ProdukService service = ProdukService();

  RxBool isLoading = false.obs;
  Rx<Produk?> detailProduk = Rx<Produk?>(null);

  Future<void> loadDetailProduk(String slug) async {
    isLoading.value = true;

    try {
      final params = {
        'harga': 'retail',
        'show_as_product': '1',
        'konsumen_member_id': '${GetStorage().read('member_id')}',
      };

      final response = await service.detailProduk(params, slug);
      if (response.statusCode == 200 && response.body != null) {
        detailProduk.value = Produk.fromJson(response.body);
        initWishlist(response.body['varian_barang'][0]['is_wishlist']);
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

  final isWishlist = false.obs;
  final isLoadingWishlist = false.obs;

  void initWishlist(bool value) {
    isWishlist.value = value;
  }

  Future<void> toggleWishlistAction({
    required int barangId,
    required int memberId,
  }) async {
    if (isLoadingWishlist.value) return;

    isLoadingWishlist.value = true;

    // optimistic update (langsung berubah)
    isWishlist.toggle();

    try {
      final response = await ProdukService().toggleWishlist({
        'barang_id': barangId,
        'member_id': memberId,
      });

      print(response.statusCode);
      print(response.body);

      if (response.statusCode != 200) {
        // rollback kalau gagal
        isWishlist.toggle();
        Get.snackbar('Error', 'Gagal update wishlist');
      }
    } catch (e) {
      // rollback kalau error
      isWishlist.toggle();
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingWishlist.value = false;
    }
  }
}
