import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_produk_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/views/transaksi/dikirim_card.dart';

class DikirimTabView extends StatelessWidget {
  DikirimTabView({super.key});

  final TransaksiProdukController controller = Get.find<TransaksiProdukController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark2,
      child: Obx(() {
        if (controller.isLoadingDikirim.value && controller.dikirimList.isEmpty) {
          return const SizedBox(height: 160, child: Center(child: CircularProgressIndicator()));
        }

        if (controller.dikirimList.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchTransaksi('dikirim'),
            child: ListView(
              children: [
                const SizedBox(height: 200),
                Center(child: Text('Tidak ada transaksi Dikirim.',style: TextStyle(color: textdark))),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchTransaksi('dikirim'),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: controller.dikirimList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Transaksi transaksi = controller.dikirimList[index];
                    // return DikirimCard(transaksi: transaksi);
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