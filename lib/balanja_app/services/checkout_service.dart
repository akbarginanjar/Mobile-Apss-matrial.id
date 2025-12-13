import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/checkout_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/screen_old.dart';

class CheckoutService extends GetConnect {
  var tokens = GetStorage().read('tokens');

  Future<Response> pilihProduk(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get('${Base.url}/v1/products', headers: header, query: params);
  }

  Future<Response> getShipmentOption(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get(
      '${Base.url}/v1/shipment-options',
      headers: header,
      query: params,
    );
  }

  Future<Response> getKurir(body) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return post('${Base.url}/v1/rates/category', headers: header, body);
  }

  Future<Response> getPaymentMethod(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get('${Base.url}/v1/p-method', headers: header, query: params);
  }

  Future<Response> getVoucher(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };

    return get(
      '${Base.url}/v1/get-available-discounts',
      headers: header,
      query: params,
    );
  }

  Future<Response> getTransaksi(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get(
      '${Base.url}/v1/get-transaction-fee',
      headers: header,
      query: params,
    );
  }

  Future<Response> alamatToko(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get(
      '${Base.url}/v1/member/get-alamat-toko',
      headers: header,
      query: params,
    );
  }

  Future<Response> prosesCheckout(body) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return post('${Base.url}/v1/checkout', headers: header, body);
  }
}
