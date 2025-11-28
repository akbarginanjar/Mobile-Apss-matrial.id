import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class BankController extends GetConnect {
  Future<List<Bank>> getBank() async {
    try {
      final String tokens = GetStorage().read('tokens');
      final conn = await get(
        '${Base.url}/v1/p-method?rekening_utama=1',
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
          'Authorization': 'bearer $tokens',
          'device': 'mobile',
        },
      );
      if (conn.statusCode == 200) {
        final List result = conn.body['data'][0]['items'];
        return result.map((e) => Bank.fromJson(e)).toList();
      } else if (conn.statusCode == 401) {
        Get.offAll(const LoginScreen());
        Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
      } else if (conn.statusCode == null) {
        noInternet();
      }
      // Get.snackbar('Terjadi Masalah', conn.body['message']);
    } on TimeoutException {
      Get.snackbar(
        'Masalah Koneksi',
        'Jaringan lemah\nsilahkan perbaiki jaringan anda!',
      );
    } on SocketException {
      Get.snackbar(
        'Masalah Koneksi',
        'Data dalam keadaan mati\nsilahkan nyalakan data anda!',
      );
    } on HttpException catch (e) {
      Get.snackbar('Masalah Koneksi', e.message);
    } on Error catch (e) {
      Get.snackbar(e.toString(), e.stackTrace.toString());
    }

    return [];
  }
}
