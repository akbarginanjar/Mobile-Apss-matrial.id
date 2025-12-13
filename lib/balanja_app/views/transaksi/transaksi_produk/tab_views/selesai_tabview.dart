import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_produk_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/views/transaksi/selesai_card.dart';

class SelesaiTabView extends StatelessWidget {
  SelesaiTabView({super.key});

  final TransaksiProdukController controller = Get.find<TransaksiProdukController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark2,
      child: Obx(() {
        if (controller.isLoadingSelesai.value && controller.selesaiList.isEmpty) {
          return const SizedBox(
            height: 160,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (controller.selesaiList.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchTransaksi('selesai'),
            child: ListView(
              children: [
                const SizedBox(height: 200),
                Center(child: Text('Tidak ada transaksi Selesai.',style: TextStyle(color: textdark))),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchTransaksi('selesai'),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: controller.selesaiList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Transaksi transaksi = controller.selesaiList[index];
                    // return SelesaiCard(transaksi: transaksi);
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}