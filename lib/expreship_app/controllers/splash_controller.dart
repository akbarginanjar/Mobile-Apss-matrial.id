import 'dart:async';

import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    startSplashScreen();
    super.onInit();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);

    return Timer(duration, () async {
      Get.offAll(
        box.read('tokens') != null
            ? const HomeScreenExpreship()
            : const LoginScreen(),
      );
    });
  }
}
