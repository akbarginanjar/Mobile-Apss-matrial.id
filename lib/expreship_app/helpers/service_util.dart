import 'package:mobile_balanja_id/expreship_app/global_resources.dart';
import 'dart:async';

class ServiceUtil extends GetConnect {
  Future<bool> checkInternetConnection() async {
    try {
      final response = await get('https://www.google.com');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Response<dynamic> call({required Response<dynamic> execute}) {
    final Logger log = Logger();
    Response<dynamic> conn = const Response<dynamic>();
    try {
      conn = execute;
      final status = conn.status;

      if (status.connectionError) {
        Get.snackbar(
          "Terjadi masalah koneksi!",
          "Tolong periksa koneksi anda untuk menjelajahi aplikasi dengan baik",
        );
        log.e("Error connection at service: ${conn.request?.url}");
      } else if (status.isServerError) {
        Get.snackbar(
          "Server aplikasi terjadi masalah!",
          "Tunggu beberapa saat, dan coba masuk kembali aplikasi",
        );
        log.e(
          "Error server at service: ${conn.request?.url}",
          error: conn.body,
          stackTrace: StackTrace.current,
        );
      } else if (status.isNotFound) {
        Get.snackbar(
          "Service ini tidak diketahui!",
          "Tunggu beberapa saat, dan coba masuk kembali aplikasi",
        );
        log.e(
          "Error not found at service: ${conn.request?.url}",
          error: conn.body,
          stackTrace: StackTrace.current,
        );
      } else if (status.isForbidden) {
        Get.snackbar(
          "Terjadi masalah yang tidak terduga",
          "Tunggu beberapa saat, dan coba masuk kembali aplikasi",
        );
        log.e(
          "Error forbidden at service: ${conn.request?.url}",
          error: conn.body,
          stackTrace: StackTrace.current,
        );
      } else if (status.isUnauthorized) {
        Get.offAll(() => const LoginScreen());
        GetStorage().remove('token');
        Get.snackbar("Sesi kamu telah habis!", "Silahkan login kembali");
        log.i(
          "you are un-authorized at service: ${conn.request?.url}",
          error: conn.body,
          stackTrace: StackTrace.current,
        );
      } else {
        log.i(
          "Success execute: ${conn.request?.method} ${conn.request?.url}, at ${Get.currentRoute}\nResponse:\n${conn.bodyString}",
        );
      }
    } catch (e) {
      log.f(e.toString(), stackTrace: StackTrace.current);
      Response resErr = Response(statusCode: 404, body: e.toString());

      return resErr;
    }

    return conn;
  }
}
