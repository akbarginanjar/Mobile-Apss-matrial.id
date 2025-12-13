import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

abstract class ProdukStates {}

class IniProdukStates extends ProdukStates {}

class FilledProdukStates extends ProdukStates {
  final List<Produk>? data;
  final bool isfull;
  final bool isLoadingMore; 

  FilledProdukStates({this.data, this.isfull = false, this.isLoadingMore = false,});
}

class ProdukEvent {}

class GetProduk extends GetxController {
  final ProdukController _produkService = ProdukController();
  static GetProduk get to => Get.find();
  ProdukStates state = IniProdukStates();
  int _start = 0;
  final int _length = 6;

  @override
  void onInit() async {
    inisialState();
    super.onInit();
  }

  void inisialState() async {
    if (state is IniProdukStates || (state is FilledProdukStates && !(state as FilledProdukStates).isLoadingMore)) {
      _start = 0;
      
      if (state is FilledProdukStates) {
        state = FilledProdukStates(data: (state as FilledProdukStates).data, isLoadingMore: true);
      } else {
        state = IniProdukStates();
      }
      update();

      final List<Produk> initialData = await _produkService.getProduk(start: _start, length: _length);
      
      _start += _length;

      state = FilledProdukStates(
        data: initialData,
        isfull: initialData.length < _length, 
        isLoadingMore: false,
      );
      update();
    }
  }

  void loadMoreProduk() async {
    if (state is FilledProdukStates) {
      final current = state as FilledProdukStates;

      if (current.isLoadingMore || current.isfull) {
        return;
      }

      state = FilledProdukStates(
        data: current.data,
        isfull: current.isfull,
        isLoadingMore: true,
      );
      update();

      final List<Produk> newData = await _produkService.getProduk(start: _start, length: _length);

      _start += _length;

      final updatedData = [...?current.data, ...newData];

      state = FilledProdukStates(
        data: updatedData,
        isfull: newData.length < _length, 
        isLoadingMore: false,
      );
      update();
    }
  }

  void refreshState() {
    inisialState();
  }
}
