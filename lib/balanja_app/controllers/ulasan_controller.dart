import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/ulasan_model.dart';

class UlasanController extends GetxController {
  final isLoading = true.obs;

  final summary = <String, dynamic>{}.obs;
  final ulasans = <dynamic>[].obs;

  Future<void> loadUlasan(barangId) async {
    try {
      isLoading(true);

      final res = await ProdukService().ulasanProduk({'barang_id': barangId});

      summary.value = res.body['summary'] ?? {};
      ulasans.assignAll(res.body['ulasans'] ?? []);
    } finally {
      isLoading(false);
    }
  }
}
