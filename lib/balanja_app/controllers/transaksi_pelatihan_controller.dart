import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/transaksi_pelatihan_service.dart';

class TransaksiPelatihanController extends GetxController {
  final TransaksiPelatihanService _service = TransaksiPelatihanService();

  var pendingList = <Transaksi>[].obs;
  var selesaiList = <Transaksi>[].obs;
  var expiredList = <Transaksi>[].obs;
  var dibatalkanList = <Transaksi>[].obs;

  var isLoadingPending = false.obs;
  var isLoadingSelesai = false.obs;
  var isLoadingExpired = false.obs;
  var isLoadingDibatalkan = false.obs;

  var isRefreshing = false.obs;

  @override
  void onInit() {
    fetchAllTransaksi();
    super.onInit();
  }

  Future<void> fetchAllTransaksi() async {
    isRefreshing.value = true;
    await Future.wait([
      fetchTransaksi('pending'),
      fetchTransaksi('selesai'),
      fetchTransaksi('expired'),
      fetchTransaksi('dibatalkan'),
    ]);
    isRefreshing.value = false;
  }

  Future<void> fetchTransaksi(String status) async {
    RxBool loadingState;
    RxList<Transaksi> listState;

    switch (status) {
      case 'pending':
        loadingState = isLoadingPending;
        listState = pendingList;
        break;
      case 'selesai':
        loadingState = isLoadingSelesai;
        listState = selesaiList;
        break;
      case 'expired':
        loadingState = isLoadingExpired;
        listState = expiredList;
        break;
      case 'dibatalkan':
        loadingState = isLoadingDibatalkan;
        listState = dibatalkanList;
        break;
      default:
        return;
    }

    try {
      loadingState.value = true;
      final result = await _service.getTransaksiPelatihanByStatus(status);
      listState.assignAll(result);
    } catch (e) {
      print('Error Transaksi Pelatihan $status: $e');
    } finally {
      loadingState.value = false;
    }
  }
}