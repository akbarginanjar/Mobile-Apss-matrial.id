import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class WishListController extends GetxController {
  RxList produkList = [].obs;

  RxBool isLoading = false.obs;
  RxBool isMoreLoading = false.obs;

  int length = 6; // jumlah data per load
  int start = 0; // offset untuk lazyload

  ScrollController scrollC = ScrollController();

  @override
  void onInit() {
    super.onInit();
    initScrollListener();
    loadProduk();
    ;
  }

  void initScrollListener() {
    scrollC.addListener(() {
      if (scrollC.position.pixels >= scrollC.position.maxScrollExtent - 200) {
        loadMore();
      }
    });
  }

  Future<void> loadProduk() async {
    isLoading.value = true;
    start = 0; // 🔥 WAJIB reset

    final params = {
      "harga": "retail",
      "show_as_product": "1",
      "wishlist": "1",
      "length": length.toString(),
      "start": start.toString(),
      "konsumen_member_id": GetStorage().read('member_id').toString(),
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

  bool hasMore = true;

  Future<void> loadMore() async {
    if (isMoreLoading.value || !hasMore) return;

    isMoreLoading.value = true;
    start += length;

    final res = await ProdukService().listProduk({
      "harga": "retail",
      "show_as_product": "1",
      "wishlist": "1",
      "length": length.toString(),
      "start": start.toString(),
      "konsumen_member_id": GetStorage().read('member_id').toString(),
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
}
