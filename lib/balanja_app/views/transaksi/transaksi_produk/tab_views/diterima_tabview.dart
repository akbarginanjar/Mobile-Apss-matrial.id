import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_produk_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/views/transaksi/diterima_card.dart';

class DiterimaTabView extends StatelessWidget {
  DiterimaTabView({super.key});

  final TransaksiProdukController controller = Get.find<TransaksiProdukController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark2,
      child: Obx(() {
        if (controller.isLoadingDiterima.value && controller.diterimaList.isEmpty) {
          return const SizedBox(
            height: 160,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (controller.diterimaList.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchTransaksi('diterima'),
            child: ListView(
              children: [
                const SizedBox(height: 200),
                Center(child: Text('Tidak ada transaksi Diterima.',style: TextStyle(color: textdark))),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchTransaksi('diterima'),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: controller.diterimaList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Transaksi transaksi = controller.diterimaList[index];
                    // return DiterimaCard(transaksi: transaksi);
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