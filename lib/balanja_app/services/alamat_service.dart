import '../global_resource.dart';
import '../models/alamat_model.dart';

class AlamatService extends GetConnect {
  Future<List<Alamat>> fetchAlamatList(int memberId) async {
    final response = await get(
      '${Base.url}/v1/member/index-alamat?member_id=$memberId',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer ${GetStorage().read('tokens')}',
        'device': 'mobile',
      },
    );

    if (response.statusCode == 200) {
      var jsonList = response.body['data'] as List;
      return jsonList.map((json) => Alamat.fromJson(json)).toList();
    } else {
      throw Exception("Gagal memuat alamat");
    }
  }

Future<bool> deleteAlamat(int idAlamat) async {
  final response = await post(
    '${Base.url}/v1/member/delete-alamat',
    {
      "id": idAlamat,
      "member_id": GetStorage().read('member_id'),
    },
    headers: {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer ${GetStorage().read('tokens')}',
      'device': 'mobile',
    },
  );

  print("Delete response: ${response.statusCode} - ${response.body}");

  return response.statusCode == 200;
}
}