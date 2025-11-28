import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class DetailPengirimanController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  RxString imagePath = ''.obs;

  Future<void> openCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        imagePath.value = pickedFile.path;
      } else {
        print('Tidak ada foto yang dipilih');
      }
    } catch (e) {
      print('Error saat membuka kamera: $e');
    }
  }
}
