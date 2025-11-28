import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

abstract class MetodePembayaranStates {}

class InitMetodePembayaranStates extends MetodePembayaranStates {}

class FilledMetodePembayaranStates extends MetodePembayaranStates {
  final List<Bank>? data;
  final bool isfull;

  FilledMetodePembayaranStates({this.data, this.isfull = false});
}

class MetodePembayaranEvent {}

class MetodePembayaranController extends GetxController {
  int? select;
  String? judul;
  String? metode;

  void changeSelect(int value, String metodePembayaran, String tujuan) {
    select = value;
    judul = metodePembayaran;
    metode = tujuan;
    update();
  }

  @override
  void onInit() async {
    // ignore: todo
    // TODO: implement onInit
    inisialState();
    super.onInit();
  }

  static MetodePembayaranController get to => Get.find();
  MetodePembayaranStates state = InitMetodePembayaranStates();
  void inisialState() async {
    if (state is InitMetodePembayaranStates) {
      state = FilledMetodePembayaranStates(
        data: await BankController().getBank(),
      );
      update();
    }
  }

  void refreshState() {
    if (state is FilledTokoStates) {
      state = InitMetodePembayaranStates();
      update();
    }
  }
}
