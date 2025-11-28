import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class TransaksiController extends GetxController {
  var countdown = '-'.obs;
  late Timer _timer;
  final _imagePicker = ImagePicker();
  var imageFile = Rx<File?>(null);

  Future<void> selectImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  void startCountdown(String expireTime) {
    DateTime expireDateTime = DateTime.parse(expireTime);
    Duration difference = expireDateTime.difference(DateTime.now());

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (difference.inSeconds > 0) {
        difference = difference - const Duration(seconds: 1);
        countdown.value = _formatDuration(difference);
      } else {
        _timer.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)} : $twoDigitMinutes : $twoDigitSeconds ";
  }
}
