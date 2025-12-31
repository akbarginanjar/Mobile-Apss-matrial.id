import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/widgets/button.dart';

class TransaksiController extends GetxController {
  var tokens = GetStorage().read('tokens');
  var countdown = '-'.obs;
  var countdownProsesOrder = '-'.obs;
  Timer? _timer;
  Timer? _timerProsesOrder;

  var invoiceData = Rxn<Map<String, dynamic>>();
  var isLoading = true.obs;
  var isError = false.obs;

  Rx<File?> selectedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      selectedImage.value = File(result.files.single.path!);
    }
  }

  void clearImage() {
    selectedImage.value = null;
  }
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void getInvoice(noInvoice) async {
    try {
      isLoading(true);
      isError(false);

      final params = {'no_invoice': '$noInvoice'};

      final response = await TransaksiService().getInvoice(params);

      if (response.statusCode == 200 && response.body != null) {
        invoiceData.value = response.body;
        final expireDateTime = DateTime.parse(
          response.body['expire_time'].replaceAll(' ', 'T'),
        );

        if (expireDateTime.isBefore(DateTime.now()) &&
            response.body['status_bayar'] == 'belum_lunas') {
          Get.defaultDialog(
            titlePadding: EdgeInsets.only(top: 20),
            title: "Pembayaran Gagal",
            titleStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            content: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Icon(Icons.close, size: 50, color: Colors.red[800]),
                  const SizedBox(height: 10),
                  const Text(
                    'Batas pembayaran sudah berakhir',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            contentPadding: EdgeInsets.only(
              bottom: 20,
              top: 10,
              left: 20,
              right: 20,
            ),
            actions: [
              DefaultButtonSecond(
                text: "Tutup",
                press: () {
                  Navigator.of(Get.overlayContext!).pop();
                },
              ),
              DefaultButton(
                text: "OK",
                press: () {
                  Get.offAll(MainScreen());
                },
                color: primary,
              ),
            ],
          );
        }

        if (response.body['status_bayar'] == 'lunas' &&
            response.body['status'] == 'pending' &&
            response.body['status'] == 'diproses') {
          Get.defaultDialog(
            titlePadding: const EdgeInsets.only(top: 20),
            title: "Pembayaran Berhasil",
            titleStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            content: const Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: 50,
                    color: Colors.green,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Terimakasih Pembayaranmu Berhasil.',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            contentPadding: const EdgeInsets.only(
              bottom: 20,
              top: 10,
              left: 20,
              right: 20,
            ),
            actions: [
              DefaultButtonSecond(
                text: "Tutup",
                press: () {
                  Navigator.of(Get.overlayContext!).pop(); // ✅ TANPA Get.back()
                },
              ),
              DefaultButton(
                text: "OK",
                press: () {
                  Get.offAll(() => MainScreen());
                },
                color: primary,
              ),
            ],
          );
        }
      } else {
        isError(true);
      }
    } catch (e) {
      isError(true);
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }

  void startCountdown(String expireTime) {
    _timer?.cancel();

    final DateTime expireDateTime = DateTime.parse(expireTime);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final Duration difference = expireDateTime.difference(DateTime.now());

      if (difference.inSeconds > 0) {
        countdown.value = _formatDuration(difference);
      } else {
        countdown.value = '00:00:00';
        timer.cancel();
      }
    });
  }

  void startCountdownProsesOrder(String expireTime) {
    _timerProsesOrder?.cancel();

    final DateTime expireDateTime = DateTime.parse(expireTime);

    _timerProsesOrder = Timer.periodic(const Duration(seconds: 1), (timer) {
      final Duration difference = expireDateTime.difference(DateTime.now());

      if (difference.inSeconds > 0) {
        countdownProsesOrder.value = _formatDuration(difference);
      } else {
        countdownProsesOrder.value = '00:00:00';
        timer.cancel();
      }
    });
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours : $minutes : $seconds';
  }

  Future<http.Response> uploadBuktiBayar({
    required String noInvoice,
    required int rekeningId,
    required File file,
  }) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${Base.url}/v1/conf-order'),
    );

    request.headers.addAll({
      'secret':
          'aKndsan23928h98hKJbkjwlKHD9dsbjwiobqUJGHBDWHvkHSJQUBSQOPSAJHVwoihdapq',
      'Author': 'bearer $tokens',
      'device': 'mobile',
    });

    request.fields.addAll({
      'no_invoice': noInvoice,
      'rekening_id': rekeningId.toString(),
    });

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        file.path,
        // optional:
        // contentType: MediaType('image', 'jpeg'),
      ),
    );
    print(request);

    final response = await request.send();
    return http.Response.fromStream(response);
  }

  Future<void> batalkanPesanan(String noInvoice) async {
    try {
      EasyLoading.show(status: 'Membatalkan pesanan...');

      final formData = FormData({'no_invoice': noInvoice});

      final response = await TransaksiService().batalkanPesanan(formData);

      EasyLoading.dismiss();

      if (response.statusCode == 200) {
        EasyLoading.showSuccess('Pesanan berhasil dibatalkan');

        getInvoice(noInvoice);
      } else {
        EasyLoading.showError(
          response.body['message'] ?? 'Gagal membatalkan pesanan',
        );
        getInvoice(noInvoice);
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Terjadi kesalahan');
    }
  }

  final kategoriList = <String>[].obs;
  final selectedKategori = ''.obs;
  final alasanController = TextEditingController();

  final isLoadingKomplain = false.obs;

  Future<void> loadKategoriKomplain() async {
    try {
      isLoadingKomplain.value = true;

      final Response response = await TransaksiService().getKategoriKomplain();

      if (response.statusCode == 200 && response.body != null) {
        final List data = response.body['data'];
        kategoriList.assignAll(data.map((e) => e.toString()).toList());

        if (kategoriList.isNotEmpty) {
          selectedKategori.value = kategoriList.first;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat kategori komplain');
    } finally {
      isLoadingKomplain.value = false;
    }
  }

  Future<void> kirimKomplain(idTransaksi, noInvoice) async {
    if (selectedKategori.isEmpty || alasanController.text.isEmpty) {
      EasyLoading.showToast('Kategori dan alasan wajib diisi');
      return;
    }
    try {
      EasyLoading.show(status: 'Proses Komplain...');

      final formData = FormData({
        'transaksi_id': idTransaksi,
        'kategori_refund': selectedKategori,
        'alasan': alasanController.text,
      });

      final response = await TransaksiService().kirimKomplain(formData);
      print(response.statusCode);
      print(response.body);
      EasyLoading.dismiss();

      if (response.statusCode == 200) {
        EasyLoading.showSuccess('Komplain Berhasil Terkirim');
        getInvoice(noInvoice);
      } else {
        EasyLoading.showError(
          response.body['message'] ?? 'Gagal membatalkan pesanan',
        );
        getInvoice(noInvoice);
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError('Terjadi kesalahan');
    }
  }
}
