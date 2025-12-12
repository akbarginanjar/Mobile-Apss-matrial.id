import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/voucher_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/checkout_service.dart';

class VoucherController extends GetxController {
  RxBool loading = false.obs;
  RxList<Voucher> vouchers = <Voucher>[].obs;

  Future<void> loadVoucher(Map<String, dynamic> params) async {
    try {
      loading.value = true;

      final res = await CheckoutService().getVoucher(params);

      if (res.statusCode == 200) {
        final List data = res.body;

        vouchers.value = data.map((e) => Voucher.fromJson(e)).toList();
      }
    } finally {
      loading.value = false;
    }
  }
}
