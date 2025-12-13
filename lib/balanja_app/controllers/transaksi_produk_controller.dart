import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/transaksi_produk_service.dart'; 

class TransaksiProdukController extends GetxController {
  final TransaksiProdukService _service = TransaksiProdukService();

  var pendingList = <Transaksi>[].obs;
  var diprosesList = <Transaksi>[].obs;
  var dikirimList = <Transaksi>[].obs;
  var diterimaList = <Transaksi>[].obs;
  var selesaiList = <Transaksi>[].obs;
  var dibatalkanList = <Transaksi>[].obs;

  var isLoadingPending = false.obs;
  var isLoadingDiproses = false.obs;
  var isLoadingDikirim = false.obs;
  var isLoadingDiterima = false.obs;
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
      fetchTransaksi('dikirim'),
      fetchTransaksi('diterima'),
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
      case 'dikirim':
        loadingState = isLoadingDikirim;
        listState = dikirimList;
        break;
      case 'diterima':
        loadingState = isLoadingDiterima;
        listState = diterimaList;
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
      final result = await _service.getTransaksiProdukByStatus(status);
      listState.assignAll(result);
    } catch (e) {
      print('Error Transaksi Produk $status: $e');
    } finally {
      loadingState.value = false;
    }
  }
}