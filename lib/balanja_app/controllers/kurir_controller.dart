import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/kurir_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/checkout_service.dart';

class KurirController extends GetxController {
  var isLoading = false.obs;
  var listKurir = <Kurir>[].obs;

  Future<void> loadKurir(body) async {
    isLoading.value = true;

    final res = await CheckoutService().getKurir(body);
    print(res.body);
    if (res.statusCode == 200) {
      listKurir.value = (res.body['data'] as List)
          .map((e) => Kurir.fromJson(e))
          .toList();
    }

    isLoading.value = false;
  }

  var isLoadingKurirToko = false.obs;
  var listKurirToko = <KurirToko>[].obs;

  Future<void> loadKurirToko(idToko) async {
    isLoadingKurirToko.value = true;

    final res = await CheckoutService().getKurirToko({"toko_id": '$idToko'});
    print(res.body);
    if (res.statusCode == 200) {
      listKurirToko.value = (res.body['data'] as List)
          .map((e) => KurirToko.fromJson(e))
          .toList();
    }

    isLoadingKurirToko.value = false;
  }
}
