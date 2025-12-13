import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_jasa_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/views/transaksi/pending_jasa_card.dart';

class PendingTabView extends StatelessWidget {
  PendingTabView({super.key});

  final TransaksiJasaController controller = Get.find<TransaksiJasaController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark2,
      child: Obx(() {
        if (controller.isLoadingPending.value && controller.pendingList.isEmpty) {
          return const SizedBox(
            height: 160,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (controller.pendingList.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchTransaksi('pending'),
            child: ListView(
              children: [
                const SizedBox(height: 200),
                Center(
                  child: Text(
                    'Tidak ada transaksi Jasa Pending.',
                    style: TextStyle(color: textdark),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchTransaksi('pending'),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: controller.pendingList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Transaksi transaksi = controller.pendingList[index];
                    // return PendingJasaCard(transaksi: transaksi);
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