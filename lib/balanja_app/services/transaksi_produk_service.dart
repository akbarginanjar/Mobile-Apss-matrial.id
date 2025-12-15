import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';

class TransaksiProdukService extends GetConnect {
  Future<List<Transaksi>> getTransaksiProdukByStatus(String status) async {
    final String? tokens = GetStorage().read('tokens');

    if (tokens == null) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Sesi login tidak ditemukan.');
      throw Exception('Sesi login tidak ditemukan.');
    }

    EasyLoading.show(status: 'Memuat transaksi $status...');

    final Response conn = await get(
      '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=$status&view_as_invoice=1&start=0&length=20&transaction_type=barang',
      headers: {
        'secret': 'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Authorization': 'Bearer $tokens',
        'device': 'mobile',
      },
    );

    EasyLoading.dismiss();

    if (conn.statusCode == 200 && (conn.body is Map || conn.body is List)) {
      final body = conn.body;
      List result = [];

      if (body is List) {
        result = body;
      } else if (body is Map && body['data'] is List) {
        result = body['data'];
      }

      return result
          .whereType<Map<String, dynamic>>()
          .map((json) => Transaksi.fromJson(json))
          .toList();
    } else {
      String errorMessage;
      if (conn.body is Map && conn.body['message'] != null) {
        errorMessage = conn.body['message'].toString();
      } else {
        errorMessage = conn.body.toString();
      }

      Get.snackbar('Error Transaksi $status', errorMessage);
      throw Exception(errorMessage);
    }
  }
}
