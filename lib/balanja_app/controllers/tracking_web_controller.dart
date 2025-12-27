import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrackingWebController extends GetxController {
  late final WebViewController webViewController;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => isLoading.value = true,
          onPageFinished: (_) => isLoading.value = false,
        ),
      );
  }

  void loadUrl(String url) {
    webViewController.loadRequest(Uri.parse(url));
  }
}
