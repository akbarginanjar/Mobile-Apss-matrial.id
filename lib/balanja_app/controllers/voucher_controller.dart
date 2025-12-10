import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/voucher_mode.dart';
import 'package:mobile_balanja_id/balanja_app/services/checkout_service.dart';

class VoucherController extends GetxController {
  var isLoading = false.obs;
  var vouchers = <VoucherModel>[].obs;

  // HIT API
  Future<void> loadVouchers() async {
    isLoading.value = true;

    final params = {};

    try {
      final response = await CheckoutService().getVoucher(params);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        final body = response.body;

        if (body is List) {
          vouchers.value = body
              .map((e) => VoucherModel.fromJson(Map<String, dynamic>.from(e)))
              .toList();
        } else {
          vouchers.clear();
        }
      }
    } catch (e) {
      print("Error load vouchers: $e");
    }

    isLoading.value = false;
  }
}
