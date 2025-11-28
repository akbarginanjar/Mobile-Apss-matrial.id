import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/pengiriman_model.dart';

class GantiKurirController extends GetxController {
  int? select;

  final List<Map> listKurir = [
    {
      'name_pengiriman': 'JNE',
      'name': 'Reguler',
      'price': 12000,
      'minDay': 3,
      'maxDay': 6,
    },
    {
      'name_pengiriman': 'JNT',
      'name': 'Ngegas',
      'price': 16000,
      'minDay': 2,
      'maxDay': 4,
    },
    {
      'name_pengiriman': 'JNE',
      'name': 'Ngegas Gila',
      'price': 25000,
      'minDay': 1,
      'maxDay': 2,
    },
  ];

  void changeSelect(int value) {
    select = value;
    update();
  }

  Future<List<Pengiriman>> getPengiriman() async {
    try {
      final String tokens = GetStorage().read('tokens');
      final conn = await GetConnect().get(
        '${Base.url}/v1/p-jasa-kirim',
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
          'Author': 'bearer $tokens',
          'device': 'mobile',
        },
      );
      if (conn.statusCode == 200) {
        final List result = conn.body;
        return result.map((e) => Pengiriman.fromJson(e)).toList();
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
    }
    return [];
  }
}
