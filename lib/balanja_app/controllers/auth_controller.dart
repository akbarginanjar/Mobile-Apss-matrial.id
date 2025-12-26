import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/login_nohp_screen/otp_screen.dart';

class AuthController extends GetxController {
  final phoneController = TextEditingController();
  final otp = ''.obs;
  final countdown = 60.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    _timer?.cancel(); // 🔥 penting
    countdown.value = 60;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value <= 0) {
        timer.cancel();
      } else {
        countdown.value--;
      }
    });
  }

  void updateOtp(String value) {
    otp.value = value;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> requestOtp() async {
    print(phoneController);
    EasyLoading.show(status: 'Mengirim OTP...');

    try {
      final body = {"phone": phoneController.text, "action": "login"};

      final response = await AuthService().loginNoHp(body);

      EasyLoading.dismiss();

      if (response.statusCode == 200) {
        startCountdown(); // 🔥 restart countdown
        Get.to(() => OtpInputScreen(), arguments: phoneController.text);
      } else {
        EasyLoading.showError(response.body['message']);
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Gagal menghubungi server');
    }
  }

  Future<void> otpVerifikasi() async {
    EasyLoading.show(status: 'Mengirim OTP...');

    try {
      final body = {
        "phone": phoneController.text,
        "otp": otp.value,
        "action": "login",
      };

      final response = await AuthService().otpVerifikasi(body);
      print(response.statusCode);
      print(response.body);

      EasyLoading.dismiss();

      if (response.statusCode == 200) {
        EasyLoading.showSuccess('Login Berhasil!');
        GetStorage().write('tokens', response.body['tokens']);
        GetStorage().write('id', response.body['data']['id']);
        GetStorage().write('no_hp', response.body['data']['no_hp']);
        GetStorage().write('email', response.body['data']['email']);
        GetStorage().write(
          'nama_lengkap',
          response.body['data']['karyawan']['nama_lengkap'],
        );
        GetStorage().write(
          'member_id',
          response.body['data']['karyawan']['id'],
        );
        Get.offAll(MainScreen());
      } else {
        EasyLoading.showError(response.body['message']);
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Gagal menghubungi server');
      print(e);
    }
  }
}
