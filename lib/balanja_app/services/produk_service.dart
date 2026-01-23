import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class ProdukService extends GetConnect {
  final String tokens = GetStorage().read('tokens');
  Future<Response> listProduk(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get('${Base.url}/v1/products', headers: header, query: params);
  }

  Future<Response> cariProduk(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get('${Base.url}/v1/products', headers: header, query: params);
  }

  Future<Response> detailProduk(params, slug) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get('${Base.url}/v1/products/$slug', headers: header, query: params);
  }

  Future<Response> ulasanProduk(params) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return get('${Base.url}/v1/ulasan', headers: header, query: params);
  }

  Future<Response> toggleWishlist(body) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return post('${Base.url}/v1/wishlist/toggle', headers: header, body);
  }

  Future<Response> toggleFollowToko(body) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return post('${Base.url}/v1/follow-toko/toggle', headers: header, body);
  }

  Future<List<Produk>> getProduk({int start = 0, int length = 6}) async {
    try {
      final String tokens = GetStorage().read('tokens');
      if (GetStorage().read('id_toko') == null) {
        final conn = await get(
          '${Base.url}/v1/toko-penyimpanan-public?search=&harga=retail&start=$start&length=$length&order=desc&show_as_product=1',
          headers: {
            'secret':
                'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
            'Authorization': 'bearer $tokens',
            'device': 'mobile',
            'Author': 'bearer $tokens',
          },
        );

        if (conn.statusCode == 200) {
          final List result = conn.body['data'];
          return result.map((e) => Produk.fromJson(e)).toList();
        } else if (conn.statusCode == 401) {
          Get.offAll(const LoginScreen());
          Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
        } else if (conn.statusCode == null) {
          noInternet();
        }
      } else {
        final connGudang = await get(
          '${Base.url}/v1/gudang-public?member_id=${GetStorage().read('id_toko')}&start=0&length=10',
          headers: {
            'secret':
                'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
            'Authorization': 'bearer $tokens',
            'device': 'mobile',
            'Author': 'bearer $tokens',
          },
        );
        if (connGudang.statusCode == 200) {
          final List resultGudang = connGudang.body['data'];
          final conn = await get(
            '${Base.url}/v1/toko-penyimpanan?gudang_id=${resultGudang[0]['id']}&harga=retail&show_as_product=1',
            headers: {
              'secret':
                  'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
              'Authorization': 'bearer $tokens',
              'device': 'mobile',
              'Author': 'bearer $tokens',
            },
          );
          if (conn.statusCode == 200) {
            final List result = conn.body['data'];
            print(result);
            return result.map((e) => Produk.fromJson(e)).toList();
          } else if (conn.statusCode == 401) {
            Get.offAll(const LoginScreen());
            Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
          } else if (conn.statusCode == null) {
            Get.snackbar('Error', 'Koneksi internet');
            // Get.to(const Koneksi(), transition: Transition.downToUp);
          }
        } else if (connGudang.statusCode == 401) {
          Get.offAll(const LoginScreen());
          Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
        } else if (connGudang.statusCode == null) {
          noInternet();
        }
        // Get.snackbar('Terjadi Masalah', conn.body['message']);
      }
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

  Future<List<Produk>> searchProduk(String search) async {
    try {
      final String tokens = GetStorage().read('tokens');
      final conn = await get(
        '${Base.url}/v1/toko-penyimpanan-public?search=$search&harga=retail&show_as_product=1',
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
          'Authorization': 'bearer $tokens',
          'device': 'mobile',
          'Author': 'bearer $tokens',
        },
      );
      if (conn.statusCode == 200) {
        final List result = conn.body['data'];

        return result.map((e) => Produk.fromJson(e)).toList();
      } else if (conn.statusCode == 401) {
        Get.offAll(const LoginScreen());
        Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
      } else if (conn.statusCode == null) {
        noInternet();
      }
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
