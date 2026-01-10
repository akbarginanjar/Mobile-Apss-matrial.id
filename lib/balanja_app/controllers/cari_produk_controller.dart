import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class CariProdukController extends GetxController {
  RxList produkList = [].obs;

  RxBool isLoading = false.obs;
  RxBool isMoreLoading = false.obs;

  int length = 6;
  int start = 0;
  bool hasMore = true;

  String keyword = '';

  ScrollController scrollC = ScrollController();

  @override
  void onInit() {
    super.onInit();
    initScrollListener();
  }

  void initScrollListener() {
    scrollC.addListener(() {
      if (scrollC.position.pixels >= scrollC.position.maxScrollExtent - 200 &&
          !isLoading.value &&
          !isMoreLoading.value &&
          hasMore) {
        loadMore();
      }
    });
  }

  /// 🔍 dipanggil dari tombol search
  Future<void> changeData(String value) async {
    keyword = value;
    start = 0;
    hasMore = true;
    produkList.clear();
    await loadProduk();
  }

  /// 🔥 load pertama / refresh
  Future<void> loadProduk() async {
    isLoading.value = true;

    final params = {
      'search': keyword,
      'harga': 'retail',
      'show_as_product': '1',
      'length': length.toString(),
      'start': start.toString(),
      'order': 'desc',
      if (GetStorage().read('member_id') != null)
        'konsumen_member_id': GetStorage().read('member_id').toString(),
    };

    try {
      final res = await ProdukService().cariProduk(params);
      if (res.statusCode == 200) {
        final List data = res.body['data'];
        produkList.assignAll(data);
        hasMore = data.length == length;
      }
    } finally {
      isLoading.value = false;
    }
  }

  /// ⏬ lazy load
  Future<void> loadMore() async {
    if (!hasMore) return;

    isMoreLoading.value = true;
    start += length;

    final params = {
      'search': keyword,
      'harga': 'retail',
      'show_as_product': '1',
      'length': length.toString(),
      'start': start.toString(),
      'order': 'desc',
      if (GetStorage().read('member_id') != null)
        'konsumen_member_id': GetStorage().read('member_id').toString(),
    };

    try {
      final res = await ProdukService().cariProduk(params);
      if (res.statusCode == 200) {
        final List data = res.body['data'];
        produkList.addAll(data);
        hasMore = data.length == length;
      }
    } finally {
      isMoreLoading.value = false;
    }
  }
}
