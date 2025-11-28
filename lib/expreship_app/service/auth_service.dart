import 'dart:async';
import 'package:mobile_balanja_id/expreship_app/global_resources.dart';
import 'package:mobile_balanja_id/expreship_app/models/user_model.dart';

class AuthController extends GetConnect {
  Future<User> login({required String email, required String password}) async {
    if (password.isNotEmpty && email.isNotEmpty) {
      var body = FormData({"email": email, "password": password});

      EasyLoading.show(status: 'loading...');

      final Response conn = await post(
        'https://api.balanja.id/v1/auth/user-login',
        body,
        headers: {
          'secret':
              'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
          'device': 'mobile',
        },
      );
      if (conn.statusCode == 200) {
        EasyLoading.showSuccess('Berhasil');
        box.write('tokens', conn.body['tokens']);
        box.write('id_user', conn.body['data']['id']);
        box.write('no_hp', conn.body['data']['no_hp']);
        box.write('email', conn.body['data']['email']);
        box.write(
          'nama_lengkap',
          conn.body['data']['karyawan']['nama_lengkap'],
        );
        box.write('alamat', conn.body['data']['karyawan']['alamat']);
        Get.offAll(
          const HomeScreenExpreship(),
          transition: Transition.rightToLeft,
        );
      } else {
        EasyLoading.dismiss();
        Get.dialog(
          barrierDismissible: false,
          barrierColor: Colors.black.withOpacity(0.2),
          AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: const Text('Login Gagal!'),
            content: const Text('Akun tidak ditemukan!'),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                child: Text('OKE', style: GoogleFonts.poppins(color: primary)),
              ),
            ],
          ),
        );
      }
      // Get.snackbar("Gagal Login", conn.body['message']);
    }

    return User();
  }
}
