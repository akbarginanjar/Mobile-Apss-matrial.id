import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class TransaksiService extends GetConnect {
  var tokens = GetStorage().read('tokens');

  Future<Response> getInvoice(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get(
      '${Base.url}/v1/view-invoice-by-number',
      headers: header,
      query: params,
    );
  }

  Future<Response> uploadBuktiBayar(body) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return post('${Base.url}/v1/conf-order', headers: header, body);
  }
}
