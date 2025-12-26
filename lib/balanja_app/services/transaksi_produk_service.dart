import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';

class TransaksiProdukService extends GetConnect {
  Future<List<Transaksi>> getTransaksiProdukPending() async {
    final String? tokens = GetStorage().read('tokens');
    // final memberId = GetStorage().read('member_id');
    if (tokens == null) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Sesi login tidak ditemukan.');
      throw Exception('Sesi login tidak ditemukan.');
    }
    final url =
        '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=pending&view_as_invoice=1&start=0&length=20&transaction_type=barang';
    final headers = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    EasyLoading.show(status: 'Memuat transaksi...');
    Response conn;
    try {
      conn = await get(url, headers: headers);
      print(conn.statusCode);
      print(conn.body);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error Transaksi Produk Pending', e.toString());
      rethrow;
    }
    EasyLoading.dismiss();
    if (conn.statusCode == 200 && (conn.body is Map || conn.body is List)) {
      final body = conn.body;
      List result = [];
      if (body is List) {
        result = body;
      } else if (body is Map && body['data'] is List) {
        result = body['data'];
      }
      final typed = result.whereType<Map<String, dynamic>>().toList();
      final transaksi = typed.map((json) => Transaksi.fromJson(json)).toList();
      return transaksi;
    } else {
      String errorMessage;
      if (conn.body is Map && (conn.body as Map)['message'] != null) {
        errorMessage = (conn.body as Map)['message'].toString();
      } else {
        errorMessage = conn.body.toString();
      }
      Get.snackbar('Error Transaksi Produk Pending', errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<List<Transaksi>> getTransaksiProdukDiproses() async {
    final String? tokens = GetStorage().read('tokens');
    // final memberId = GetStorage().read('member_id');
    if (tokens == null) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Sesi login tidak ditemukan.');
      throw Exception('Sesi login tidak ditemukan.');
    }
    final url =
        '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=diproses&view_as_invoice=1&start=0&length=20&transaction_type=barang';
    final headers = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'web',
    };
    EasyLoading.show(status: 'Memuat transaksi diproses...');
    Response conn;
    try {
      conn = await get(url, headers: headers);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error Transaksi Produk Diproses', e.toString());
      rethrow;
    }
    EasyLoading.dismiss();
    if (conn.statusCode == 200 && (conn.body is Map || conn.body is List)) {
      final body = conn.body;
      List result = [];
      if (body is List) {
        result = body;
      } else if (body is Map && body['data'] is List) {
        result = body['data'];
      }
      final typed = result.whereType<Map<String, dynamic>>().toList();
      final transaksi = typed.map((json) => Transaksi.fromJson(json)).toList();
      return transaksi;
    } else {
      String errorMessage;
      if (conn.body is Map && (conn.body as Map)['message'] != null) {
        errorMessage = (conn.body as Map)['message'].toString();
      } else {
        errorMessage = conn.body.toString();
      }
      Get.snackbar('Error Transaksi Produk Diproses', errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<List<Transaksi>> getTransaksiProdukDikirim() async {
    final String? tokens = GetStorage().read('tokens');
    // final memberId = GetStorage().read('member_id');
    if (tokens == null) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Sesi login tidak ditemukan.');
      throw Exception('Sesi login tidak ditemukan.');
    }
    final url =
        '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=dikirim&view_as_invoice=1&start=0&length=20&transaction_type=barang';
    final headers = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'web',
    };
    EasyLoading.show(status: 'Memuat transaksi Dikirim...');
    Response conn;
    try {
      conn = await get(url, headers: headers);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error Transaksi Produk Dikirim', e.toString());
      rethrow;
    }
    EasyLoading.dismiss();
    if (conn.statusCode == 200 && (conn.body is Map || conn.body is List)) {
      final body = conn.body;
      List result = [];
      if (body is List) {
        result = body;
      } else if (body is Map && body['data'] is List) {
        result = body['data'];
      }
      final typed = result.whereType<Map<String, dynamic>>().toList();
      final transaksi = typed.map((json) => Transaksi.fromJson(json)).toList();
      return transaksi;
    } else {
      String errorMessage;
      if (conn.body is Map && (conn.body as Map)['message'] != null) {
        errorMessage = (conn.body as Map)['message'].toString();
      } else {
        errorMessage = conn.body.toString();
      }
      Get.snackbar('Error Transaksi Produk Dikirim', errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<List<Transaksi>> getTransaksiProdukDiterima() async {
    final String? tokens = GetStorage().read('tokens');
    // final memberId = GetStorage().read('member_id');
    if (tokens == null) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Sesi login tidak ditemukan.');
      throw Exception('Sesi login tidak ditemukan.');
    }
    final url =
        '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=diterima&view_as_invoice=1&start=0&length=20&transaction_type=barang';
    final headers = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'web',
    };
    EasyLoading.show(status: 'Memuat transaksi Diterima...');
    Response conn;
    try {
      conn = await get(url, headers: headers);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error Transaksi Produk Diterima', e.toString());
      rethrow;
    }
    EasyLoading.dismiss();
    if (conn.statusCode == 200 && (conn.body is Map || conn.body is List)) {
      final body = conn.body;
      List result = [];
      if (body is List) {
        result = body;
      } else if (body is Map && body['data'] is List) {
        result = body['data'];
      }
      final typed = result.whereType<Map<String, dynamic>>().toList();
      final transaksi = typed.map((json) => Transaksi.fromJson(json)).toList();
      return transaksi;
    } else {
      String errorMessage;
      if (conn.body is Map && (conn.body as Map)['message'] != null) {
        errorMessage = (conn.body as Map)['message'].toString();
      } else {
        errorMessage = conn.body.toString();
      }
      Get.snackbar('Error Transaksi Produk Diterima', errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<List<Transaksi>> getTransaksiProdukSelesai() async {
    final String? tokens = GetStorage().read('tokens');
    // final memberId = GetStorage().read('member_id');
    if (tokens == null) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Sesi login tidak ditemukan.');
      throw Exception('Sesi login tidak ditemukan.');
    }
    final url =
        '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=selesai&view_as_invoice=1&start=0&length=20&transaction_type=barang';
    final headers = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'web',
    };
    EasyLoading.show(status: 'Memuat transaksi Selesai...');
    Response conn;
    try {
      conn = await get(url, headers: headers);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error Transaksi Produk Selesai', e.toString());
      rethrow;
    }
    EasyLoading.dismiss();
    if (conn.statusCode == 200 && (conn.body is Map || conn.body is List)) {
      final body = conn.body;
      List result = [];
      if (body is List) {
        result = body;
      } else if (body is Map && body['data'] is List) {
        result = body['data'];
      }
      final typed = result.whereType<Map<String, dynamic>>().toList();
      final transaksi = typed.map((json) => Transaksi.fromJson(json)).toList();
      return transaksi;
    } else {
      String errorMessage;
      if (conn.body is Map && (conn.body as Map)['message'] != null) {
        errorMessage = (conn.body as Map)['message'].toString();
      } else {
        errorMessage = conn.body.toString();
      }
      Get.snackbar('Error Transaksi Produk Selesai', errorMessage);
      throw Exception(errorMessage);
    }
  }

  Future<List<Transaksi>> getTransaksiProdukDibatalkan() async {
    final String? tokens = GetStorage().read('tokens');
    // final memberId = GetStorage().read('member_id');
    if (tokens == null) {
      EasyLoading.dismiss();
      Get.snackbar('Error', 'Sesi login tidak ditemukan.');
      throw Exception('Sesi login tidak ditemukan.');
    }
    final url =
        '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=dibatalkan&view_as_invoice=1&start=0&length=20&transaction_type=barang';
    final headers = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'web',
    };
    EasyLoading.show(status: 'Memuat transaksi Dibatalkan...');
    Response conn;
    try {
      conn = await get(url, headers: headers);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error Transaksi Produk Dibatalkan', e.toString());
      rethrow;
    }
    EasyLoading.dismiss();
    if (conn.statusCode == 200 && (conn.body is Map || conn.body is List)) {
      final body = conn.body;
      List result = [];
      if (body is List) {
        result = body;
      } else if (body is Map && body['data'] is List) {
        result = body['data'];
      }
      final typed = result.whereType<Map<String, dynamic>>().toList();
      final transaksi = typed.map((json) => Transaksi.fromJson(json)).toList();
      return transaksi;
    } else {
      String errorMessage;
      if (conn.body is Map && (conn.body as Map)['message'] != null) {
        errorMessage = (conn.body as Map)['message'].toString();
      } else {
        errorMessage = conn.body.toString();
      }
      Get.snackbar('Error Transaksi Produk Dibatalkan', errorMessage);
      throw Exception(errorMessage);
    }
  }
}
