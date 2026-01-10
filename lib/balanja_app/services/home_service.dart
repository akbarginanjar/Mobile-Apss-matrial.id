import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class HomeService extends GetConnect {
  final String tokens = GetStorage().read('tokens');
  Future<Response> getBanner(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get('${Base.url}/v1/banner-public', headers: header, query: params);
  }
}
