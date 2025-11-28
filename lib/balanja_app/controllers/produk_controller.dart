import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

abstract class ProdukStates {}

class IniProdukStates extends ProdukStates {}

class FilledProdukStates extends ProdukStates {
  final List<Produk>? data;
  final bool isfull;

  FilledProdukStates({this.data, this.isfull = false});
}

class ProdukEvent {}

class GetProduk extends GetxController {
  @override
  void onInit() async {
    inisialState();
    super.onInit();
  }

  static GetProduk get to => Get.find();
  ProdukStates state = IniProdukStates();
  void inisialState() async {
    if (state is IniProdukStates) {
      state = FilledProdukStates(data: await ProdukController().getProduk());
      update();
    }
  }

  void refreshState() async {
    await ProdukController().getProduk();
    // if (state is FilledProdukStates) {
    //   state = IniProdukStates();
    //   update();
    // }
  }
}
