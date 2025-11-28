import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/services/toko_service.dart';

abstract class TokoStates {}

class InitTokoStates extends TokoStates {}

class FilledTokoStates extends TokoStates {
  final List<Toko>? data;
  final bool isfull;

  FilledTokoStates({this.data, this.isfull = false});
}

class TokoEvent {}

class GetToko extends GetxController {
  @override
  void onInit() async {
    // ignore: todo
    // TODO: implement onInit
    inisialState();
    super.onInit();
  }

  static GetToko get to => Get.find();

  TokoStates state = InitTokoStates();

  void inisialState() async {
    if (state is InitTokoStates) {
      state = FilledTokoStates(data: await TokoController().getToko());
      update();
    }
  }

  void refreshState() {
    if (state is FilledTokoStates) {
      state = InitTokoStates();
      update();
    }
  }
}
