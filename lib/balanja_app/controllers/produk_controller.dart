import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class ProdukController extends GetxController {
  RxList produkList = [].obs;
  RxList produkUntukKamu = [].obs;

  RxBool isLoading = false.obs;
  RxBool isLoadingUntukKamu = false.obs;
  RxBool isMoreLoading = false.obs;
  RxBool isMoreLoadingUntukKamu = false.obs;

  int length = 6; // jumlah data per load
  int start = 0; // offset untuk lazyload
  int lengthUntukKamu = 6; // jumlah data per load
  int startUntukKamu = 0; // offset untuk lazyload

  ScrollController scrollC = ScrollController();
  ScrollController scrollCUntukKamu = ScrollController();

  @override
  void onInit() {
    super.onInit();
    initScrollListener();
    initScrollListenerUntukKamu();
    loadProduk();
    loadProdukUntukKamu();
  }

  void initScrollListener() {
    scrollC.addListener(() {
      if (scrollC.position.pixels >= scrollC.position.maxScrollExtent - 200) {
        loadMore();
      }
    });
  }

  void initScrollListenerUntukKamu() {
    scrollCUntukKamu.addListener(() {
      if (scrollCUntukKamu.position.pixels >=
          scrollCUntukKamu.position.maxScrollExtent - 200) {
        loadMoreUntukKamu();
      }
    });
  }

  Future<void> loadProduk() async {
    isLoading.value = true;
    start = 0; // 🔥 WAJIB reset

    final params = {
      "harga": "retail",
      "show_as_product": "1",
      "length": length.toString(),
      "start": start.toString(),
    };

    try {
      final res = await ProdukService().listProduk(params);
      if (res.statusCode == 200) {
        produkList.assignAll(res.body['data']);
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadProdukUntukKamu() async {
    isLoadingUntukKamu.value = true;
    startUntukKamu = 0; // 🔥 WAJIB reset

    final params = {
      "harga": "retail",
      "show_as_product": "1",
      "length": lengthUntukKamu.toString(),
      "start": startUntukKamu.toString(),
    };

    try {
      final res = await ProdukService().listProduk(params);
      if (res.statusCode == 200) {
        produkUntukKamu.assignAll(res.body['data']);
      }
    } finally {
      isLoadingUntukKamu.value = false;
    }
  }

  bool hasMore = true;
  bool hasMoreUntukKamu = true;

  Future<void> loadMore() async {
    if (isMoreLoading.value || !hasMore) return;

    isMoreLoading.value = true;
    start += length;

    final res = await ProdukService().listProduk({
      "harga": "retail",
      "show_as_product": "1",
      "length": length.toString(),
      "start": start.toString(),
    });

    if (res.statusCode == 200) {
      final newData = res.body['data'];
      if (newData == null || newData.isEmpty) {
        hasMore = false; // 🚫 stop load
      } else {
        produkList.addAll(newData);
      }
    }

    isMoreLoading.value = false;
  }

  Future<void> loadMoreUntukKamu() async {
    if (isMoreLoadingUntukKamu.value || !hasMore) return;

    isMoreLoadingUntukKamu.value = true;
    startUntukKamu += lengthUntukKamu;

    final res = await ProdukService().listProduk({
      "harga": "retail",
      "show_as_product": "1",
      "length": lengthUntukKamu.toString(),
      "start": startUntukKamu.toString(),
    });

    if (res.statusCode == 200) {
      final newData = res.body['data'];
      if (newData == null || newData.isEmpty) {
        hasMoreUntukKamu = false; // 🚫 stop load
      } else {
        produkUntukKamu.addAll(newData);
      }
    }

    isMoreLoadingUntukKamu.value = false;
  }
}

abstract class ProdukStates {}

class IniProdukStates extends ProdukStates {}

class FilledProdukStates extends ProdukStates {
  final List<Produk>? data;
  final bool isfull;
  final bool isLoadingMore;

  FilledProdukStates({
    this.data,
    this.isfull = false,
    this.isLoadingMore = false,
  });
}

class ProdukEvent {}

class GetProduk extends GetxController {
  final ProdukService _produkService = ProdukService();
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
    if (state is IniProdukStates ||
        (state is FilledProdukStates &&
            !(state as FilledProdukStates).isLoadingMore)) {
      _start = 0;

      if (state is FilledProdukStates) {
        state = FilledProdukStates(
          data: (state as FilledProdukStates).data,
          isLoadingMore: true,
        );
      } else {
        state = IniProdukStates();
      }
      update();

      final List<Produk> initialData = await _produkService.getProduk(
        start: _start,
        length: _length,
      );

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

      final List<Produk> newData = await _produkService.getProduk(
        start: _start,
        length: _length,
      );

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
