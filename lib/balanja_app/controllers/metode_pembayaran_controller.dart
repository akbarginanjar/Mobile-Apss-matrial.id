import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/payment_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/checkout_service.dart';

class PaymentMethodController extends GetxController {
  var groups = <PaymentMethodGroup>[].obs;
  var isLoading = false.obs;

  Future<void> loadPaymentMethod(idToko) async {
    try {
      isLoading.value = true;

      final res = await CheckoutService().getPaymentMethod({
        "member_id": idToko,
      });

      if (res.statusCode == 200) {
        final List data = res.body['data'];
        groups.value = data.map((e) => PaymentMethodGroup.fromJson(e)).toList();
      }
    } catch (e) {
      print("ERR: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
