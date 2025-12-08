import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/alamat_model.dart';

class GantiAlamatController extends GetxController {
  int? select;

  void changeSelect(int value) {
    select = value;
    update();
  }

  Future<void> refreshData() async {}

  void onRefresh() async {
    await getAlamat(GetStorage().read('member_id'));
  }

  Future<List<Alamat>> getAlamat(int idMember) async {
    try {
      final String tokens = GetStorage().read('tokens');
      final conn = await GetConnect().get(
        '${Base.url}/v1/member/index-alamat?member_id=$idMember',
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
          'Author': 'bearer $tokens',
          'device': 'mobile',
        },
      );
      print(conn.body);
      if (conn.statusCode == 200) {
        final List result = conn.body['data'];
        return result.map((e) => Alamat.fromJson(e)).toList();
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
