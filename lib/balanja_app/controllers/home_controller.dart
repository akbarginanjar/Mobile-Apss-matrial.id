import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/banner_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/home_service.dart';

class HomeController extends GetxController {
  RxList<BannerModel> bannerList = <BannerModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadBanner();
  }

  Future<void> loadBanner() async {
    isLoading.value = true;

    final params = {'app_code': 'MATRIAL.ID', 'status': 'true'};

    try {
      final res = await HomeService().getBanner(params);
      if (res.statusCode == 200) {
        final List data = res.body['data'];
        bannerList.value = data.map((e) => BannerModel.fromJson(e)).toList();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
