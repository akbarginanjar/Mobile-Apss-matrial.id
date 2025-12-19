import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Ambil isi storage
  final box = GetStorage();
  final memberId = box.read('member_id');
  final tokens = box.read('tokens');

  // Print ke log
  debugPrint('=== Debug Storage ===');
  debugPrint('Member ID: $memberId');
  debugPrint('Token: $tokens');
  debugPrint('=====================');

  Get.put(GetProduk());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const App());
}