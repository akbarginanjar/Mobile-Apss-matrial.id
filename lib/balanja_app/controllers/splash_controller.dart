import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class SplashController extends GetxController {
  GetStorage box = GetStorage();

  @override
  void onInit() {
    startSplashScreen();
    super.onInit();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Get.offAll(
        box.read('tokens') != null ? const MainScreen() : const LoginScreen(),
      );
    });
  }
}
