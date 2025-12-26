import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/login_nohp_screen/screen.dart';

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
        box.read('tokens') != null
            ? const MainScreen()
            : const LoginNoHpScreen(),
      );
    });
  }
}
