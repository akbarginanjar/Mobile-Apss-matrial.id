import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/tracking_web_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrackingWebViewScreen extends GetView<TrackingWebController> {
  final String url;

  const TrackingWebViewScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    controller.loadUrl(url);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Lacak Pengiriman')),
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: controller.webViewController),
            Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
