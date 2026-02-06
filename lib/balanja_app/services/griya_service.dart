import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class GriyaService extends GetConnect {
  Future<Response> registerGriya({
    required String nama,
    required String deskripsi,
    required String alamat,
  }) async {
    final body = {
      "member_id": GetStorage().read('member_id'),
      "nama": nama,
      "deskripsi": deskripsi,
      "alamat": alamat,
    };

    final response = await post(
      '${Base.url}/v1/griya-sehat/register',
      body,
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer ${GetStorage().read('tokens')}',
        'device': 'mobile',
      },
    );

    return response;
  }
}