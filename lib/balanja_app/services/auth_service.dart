import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/user_model.dart';

class AuthService extends GetConnect {
  var tokens = GetStorage().read('tokens');
  Future<Response> loginNoHp(body) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return post('${Base.url}/v1/otp/request', headers: header, body);
  }

  Future<Response> otpVerifikasi(body) {
    final header = {
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    };
    return post('${Base.url}/v1/otp/verify', headers: header, body);
  }

  Future<User> login({required String email, required String password}) async {
    try {
      if (password.isNotEmpty && email.isNotEmpty) {
        GetStorage box = GetStorage();
        var body = {"email": email, "password": password};

        // loadingPage();
        EasyLoading.show(status: 'Loading...');

        final Response conn = await post(
          '${Base.url}v1/auth/user-login',
          body,
          headers: {
            'secret':
                'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq', // Atur header sesuai kebutuhan Anda
            'device': 'mobile', // Atur token akses sesuai kebutuhan Anda
          },
        );
        if (conn.statusCode == 200) {
          EasyLoading.showSuccess('Login Berhasil!');
          box.write('tokens', conn.body['tokens']);
          box.write('id', conn.body['data']['id']);
          box.write('no_hp', conn.body['data']['no_hp']);
          box.write('email', conn.body['data']['email']);
          box.write(
            'nama_lengkap',
            conn.body['data']['karyawan']['nama_lengkap'],
          );
          box.write('member_id', conn.body['data']['karyawan']['id']);
          // return User.fromJson(conn.body);
        } else if (conn.statusCode == null) {
          EasyLoading.showInfo('Perbaiki Koneksi Internet');
        } else {
          EasyLoading.dismiss();
          Get.dialog(
            barrierDismissible: false,
            barrierColor: Colors.black.withOpacity(0.2),
            AlertDialog(
              title: const Text('Login Gagal!'),
              content: const Text('Akun tidak ditemukan!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                    Get.back();
                  },
                  child: const Text('OKE'),
                ),
              ],
            ),
          );
        }
        // Get.snackbar("Gagal Login", conn.body['message']);
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
    return User();
  }

  Future<User> register({
    required String namaLengkap,
    required String nomorHp,
    required String email,
    required String password,
    required String konfirmasiPassword,
  }) async {
    try {
      var body = {
        "nama_lengkap": namaLengkap,
        "jk": null,
        "email": email,
        "no_hp": nomorHp,
        "provinsi_id": null,
        "kab_kota_id": null,
        "kecamatan_id": null,
        "kelurahan_id": null,
        "alamat": null,
        "password": password,
        "konfirmasi_password": konfirmasiPassword,
      };

      // loadingPage();
      EasyLoading.show(status: 'Loading...');

      final Response conn = await post(
        '${Base.url}v1/affiliator/register',
        body,
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq', // Atur header sesuai kebutuhan Anda
          'device': 'mobile', // Atur token akses sesuai kebutuhan Anda
        },
      );
      if (conn.statusCode == 200) {
        EasyLoading.showSuccess('Pendaftar Berhasil!');
        Get.offAll(const LoginScreen());
        // return User.fromJson(conn.body);
      } else if (conn.statusCode == null) {
        EasyLoading.showInfo('Perbaiki Koneksi Internet');
      } else {
        EasyLoading.dismiss();
        Get.dialog(
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.2),
          AlertDialog(
            title: const Text('Daftar Gagal!'),
            content: Text('${conn.body}'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('OKE'),
              ),
            ],
          ),
        );
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
    return User();
  }
}
