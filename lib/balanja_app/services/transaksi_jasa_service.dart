import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';

class TransaksiJasaService extends GetConnect {
  Future<List<Transaksi>> getTransaksiJasaByStatus(String status) async {
    final String? tokens = GetStorage().read('tokens');
    if (tokens == null) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Sesi login tidak ditemukan.');
      throw Exception('Sesi login tidak ditemukan.');
    }
    final url =
        '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=$status&view_as_invoice=1&start=0&length=20&transaction_type=jasa';
    final headers = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'web',
    };
    EasyLoading.show(status: 'Memuat transaksi $status...');
    Response conn;
    try {
      conn = await get(url, headers: headers);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error Transaksi Jasa $status', e.toString());
      rethrow;
    }
    EasyLoading.dismiss();
    if (conn.statusCode == 200 && (conn.body is Map || conn.body is List)) {
      final body = conn.body;
      List result = [];
      if (body is List) {
        result = body;
      } else if (body is Map && body['data'] is List) {
        result = body['data'];
      }
      final typed = result.whereType<Map<String, dynamic>>().toList();
      final transaksi = typed.map((json) => Transaksi.fromJson(json)).toList();
      return transaksi;
    } else {
      String errorMessage;
      if (conn.body is Map && (conn.body as Map)['message'] != null) {
        errorMessage = (conn.body as Map)['message'].toString();
      } else {
        errorMessage = conn.body.toString();
      }
      Get.snackbar('Error Transaksi Jasa $status', errorMessage);
      throw Exception(errorMessage);
    }
  }
}