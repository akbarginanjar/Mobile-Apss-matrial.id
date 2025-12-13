import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_jasa_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/views/transaksi/dibatalkan_jasa_card.dart';

class DibatalkanTabView extends StatelessWidget {
  DibatalkanTabView({super.key});

  final TransaksiJasaController controller = Get.find<TransaksiJasaController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark2,
      child: Obx(() {
        if (controller.isLoadingDibatalkan.value && controller.dibatalkanList.isEmpty) {
          return const SizedBox(
            height: 160,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (controller.dibatalkanList.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchTransaksi('dibatalkan'),
            child: ListView(
              children: [
                const SizedBox(height: 200),
                Center(
                  child: Text(
                    'Tidak ada transaksi Jasa Dibatalkan.',
                    style: TextStyle(color: textdark),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchTransaksi('dibatalkan'),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: controller.dibatalkanList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Transaksi transaksi = controller.dibatalkanList[index];
                    // return DibatalkanJasaCard(transaksi: transaksi);
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