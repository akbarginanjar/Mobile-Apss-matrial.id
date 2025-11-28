import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class MainController extends GetxController {
  int index = 0;

  void changeIndex(int value) {
    index = value;
    update();
  }
}
