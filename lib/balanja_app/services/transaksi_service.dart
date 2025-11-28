import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/checkout_model.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/utils/page_pemberitahuan.dart';

class TransaksiServiceController extends GetConnect {
  Future<Checkout> getKonfirmasiPembayaran(int id) async {
    final String tokens = GetStorage().read('tokens');
    final conn = await get(
      '${Base.url}/v1/transaksi-online/$id?view_as_invoice=1',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        // 'Authorization': 'bearer $tokens',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      final jsonData = Checkout.fromJson(conn.body);
      // print('jadi ${jsonData.noInvoice}');
      return jsonData;
    } else {
      throw EasyLoading.showInfo('Perbaiki Koneksi Internet');
    }
  }

  Future<Checkout> getDetailTransaksi(int id) async {
    final String tokens = GetStorage().read('tokens');
    final conn = await get(
      '${Base.url}/v1/transaksi-online/$id?view_as_invoice=1',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        // 'Authorization': 'bearer $tokens',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      final jsonData = Checkout.fromJson(conn.body);
      // print('jadi ${jsonData.noInvoice}');
      return jsonData;
    } else {
      throw EasyLoading.showInfo('Perbaiki Koneksi Internet');
    }
  }

  Future<Checkout> uploadBuktiBayar({
    required String noInvoice,
    required File file,
    required int rekeningId,
    required String namaFile,
  }) async {
    var body = FormData({
      'no_invoice': noInvoice,
      // 'file': file,
      'file': MultipartFile(file, filename: namaFile),
      'rekening_id': rekeningId,
    });

    EasyLoading.show(status: 'Transaksi Diproses...');

    final Response conn = await post(
      '${Base.url}/v1/conf-order',
      body,
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq', // Atur header sesuai kebutuhan Anda
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      EasyLoading.showSuccess('Transaksi Terkirim');
      Get.offAll(
        PagePemberitahuan(
          title: 'Transaksi Berhasil',
          deskripsi: conn.body['message'],
          fotoLocal: 'assets/transaksi-sukses.jpg',
          fotoNetwork: '',
        ),
      );
      // return User.fromJson(conn.body);
    } else if (conn.statusCode == null) {
      EasyLoading.showInfo('Perbaiki Koneksi Internet');
    } else if (conn.statusCode == 400) {
      EasyLoading.showError(conn.body['message']);
    }
    return Checkout();
  }

  Future<List<Transaksi>> getTransaksiBelumDibayar() async {
    final String tokens = GetStorage().read('tokens');
    final conn = await get(
      '${Base.url}/v1/transaksi-online?show_bukti_tf=1&konsumen_member_id=${GetStorage().read('member_id')}&status=pending&start=0&length=10',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      final List result = conn.body['data'];
      return result.map((e) => Transaksi.fromJson(e)).toList();
    } else if (conn.statusCode == 401) {
      Get.offAll(const LoginScreen());
      Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
    } else if (conn.statusCode == null) {
      noInternet();
    }

    return [];
  }

  Future<List<Transaksi>> getTransaksiDiproses() async {
    final String tokens = GetStorage().read('tokens');
    final conn = await get(
      '${Base.url}/v1/transaksi-online?show_bukti_tf=1&konsumen_member_id=${GetStorage().read('member_id')}&status=diproses&start=0&length=10',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      final List result = conn.body['data'];
      return result.map((e) => Transaksi.fromJson(e)).toList();
    } else if (conn.statusCode == 401) {
      Get.offAll(const LoginScreen());
      Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
    } else if (conn.statusCode == null) {
      noInternet();
    }

    return [];
  }

  Future<List<Transaksi>> getTransaksiDikirim() async {
    final String tokens = GetStorage().read('tokens');
    final conn = await get(
      '${Base.url}/v1/transaksi-online?show_bukti_tf=1&konsumen_member_id=${GetStorage().read('member_id')}&status=dikirim',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      final List result = conn.body['data'];
      return result.map((e) => Transaksi.fromJson(e)).toList();
    } else if (conn.statusCode == 401) {
      Get.offAll(const LoginScreen());
      Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
    } else if (conn.statusCode == null) {
      noInternet();
    }

    return [];
  }

  Future<List<Transaksi>> getTransaksiDiterima() async {
    final String tokens = GetStorage().read('tokens');
    final conn = await get(
      '${Base.url}/v1/transaksi-online?show_bukti_tf=1&konsumen_member_id=${GetStorage().read('member_id')}&status=diterima',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      final List result = conn.body['data'];
      return result.map((e) => Transaksi.fromJson(e)).toList();
    } else if (conn.statusCode == 401) {
      Get.offAll(const LoginScreen());
      Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
    } else if (conn.statusCode == null) {
      noInternet();
    }

    return [];
  }

  Future<List<Transaksi>> getTransaksiSelesai() async {
    final String tokens = GetStorage().read('tokens');
    final conn = await get(
      '${Base.url}/v1/transaksi-online?show_bukti_tf=1&konsumen_member_id=${GetStorage().read('member_id')}&status=selesai',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      final List result = conn.body['data'];
      return result.map((e) => Transaksi.fromJson(e)).toList();
    } else if (conn.statusCode == 401) {
      Get.offAll(const LoginScreen());
      Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
    } else if (conn.statusCode == null) {
      noInternet();
    }

    return [];
  }

  Future<List<Transaksi>> getTransaksiBatal() async {
    final String tokens = GetStorage().read('tokens');
    final conn = await get(
      '${Base.url}/v1/transaksi-online?show_bukti_tf=1&konsumen_member_id=${GetStorage().read('member_id')}&status=dibatalkan',
      headers: {
        'secret':
            'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
        'Author': 'bearer $tokens',
        'device': 'mobile',
      },
    );
    if (conn.statusCode == 200) {
      final List result = conn.body['data'];
      return result.map((e) => Transaksi.fromJson(e)).toList();
    } else if (conn.statusCode == 401) {
      Get.offAll(const LoginScreen());
      Get.snackbar('Masa Aktif Akun Habis', 'Silahkan login kembali');
    } else if (conn.statusCode == null) {
      noInternet();
    }

    return [];
  }
}
