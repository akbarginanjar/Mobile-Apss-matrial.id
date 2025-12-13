import 'dart:io';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class AuthenticationException implements Exception {
  final String message;
  const AuthenticationException(this.message);

  @override
  String toString() => 'AuthenticationException: $message';
}

class TransaksiJasaService extends GetConnect {
  final _storage = GetStorage();

  Future<List<Transaksi>> getTransaksiJasaByStatus(String status) async {
    final String? tokens = _storage.read('tokens');

    if (tokens == null) {
      throw const AuthenticationException('Sesi login tidak ditemukan.');
    }

    try {
      final Response conn = await get(
        '${Base.url}/v1/transaksi-online?konsumen_member_id=${GetStorage().read('member_id')}&show_bukti_tf=1&status=$status&view_as_invoice=1&start=0&length=20&transaction_type=jasa',
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
          'Authorization': 'bearer $tokens',
          'device': 'mobile',
        },
      );

      if (conn.statusCode == 200) {
        final body = conn.body;

        List result = [];

        if (body is List) {
          result = body;
        } else if (body is Map && body['data'] is List) {
          result = body['data'];
        } else if (body is Map && body['data'] is Map) {
          result = (body['data'] as Map).values.toList();
        } else {
          result = [];
        }

        return result
            .whereType<Map<String, dynamic>>()
            .map((json) => Transaksi.fromJson(json))
            .toList();
      } else if (conn.statusCode == 401) {
        throw const AuthenticationException('Masa Aktif Akun Habis');
      } else if (conn.statusCode == null) {
        noInternet();
        throw Exception('Koneksi terputus.');
      } else {
        final errorMessage = conn.body['message'] ??
            'Gagal memuat data transaksi jasa. Status: ${conn.statusCode}';
        throw Exception(errorMessage);
      }
    } on TimeoutException {
      throw Exception('Jaringan lemah. Timeout.');
    } on SocketException {
      throw Exception('Data dalam keadaan mati. Periksa koneksi.');
    } on HttpException catch (e) {
      throw Exception('Masalah HTTP: ${e.message}');
    } catch (e) {
      throw Exception('Error Sistem: ${e.toString()}');
    }
  }
}