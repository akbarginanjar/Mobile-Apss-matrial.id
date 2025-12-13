import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
final storage = GetStorage();
  print('DEBUG SESSION: Token tersimpan? ${storage.read('tokens') != null}');
  print('DEBUG SESSION: Member ID tersimpan? ${storage.read('member_id') != null}');
  Get.put(GetProduk());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const App());
}
