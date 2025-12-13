import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/transaksi_jasa_service.dart';

class TransaksiJasaController extends GetxController {
  final TransaksiJasaService _service = TransaksiJasaService();

  var pendingList = <Transaksi>[].obs;
  var diprosesList = <Transaksi>[].obs;
  var diperjalananList = <Transaksi>[].obs;
  var ditujuanList = <Transaksi>[].obs;
  var selesaiList = <Transaksi>[].obs;
  var dibatalkanList = <Transaksi>[].obs;

  var isLoadingPending = false.obs;
  var isLoadingDiproses = false.obs;
  var isLoadingDiperjalanan = false.obs;
  var isLoadingDitujuan = false.obs;
  var isLoadingSelesai = false.obs;
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
      fetchTransaksi('diproses'),
      fetchTransaksi('diperjalanan'),
      fetchTransaksi('ditujuan'),
      fetchTransaksi('selesai'),
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
      case 'diproses':
        loadingState = isLoadingDiproses;
        listState = diprosesList;
        break;
      case 'diperjalanan':
        loadingState = isLoadingDiperjalanan;
        listState = diperjalananList;
        break;
      case 'ditujuan':
        loadingState = isLoadingDitujuan;
        listState = ditujuanList;
        break;
      case 'selesai':
        loadingState = isLoadingSelesai;
        listState = selesaiList;
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
      final result = await _service.getTransaksiJasaByStatus(status);
      listState.assignAll(result);
    } catch (e) {
      print('Error Transaksi Jasa $status: $e');
    } finally {
      loadingState.value = false;
    }
  }
}