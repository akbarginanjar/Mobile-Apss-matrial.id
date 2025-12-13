import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_jasa_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/views/transaksi/diproses_jasa_card.dart';

class DiprosesTabView extends StatelessWidget {
  DiprosesTabView({super.key});

  final TransaksiJasaController controller = Get.find<TransaksiJasaController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark2,
      child: Obx(() {
        if (controller.isLoadingDiproses.value && controller.diprosesList.isEmpty) {
          return const SizedBox(
            height: 160,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (controller.diprosesList.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchTransaksi('diproses'),
            child: ListView(
              children: [
                const SizedBox(height: 200),
                Center(
                  child: Text(
                    'Tidak ada transaksi Jasa Diproses.',
                    style: TextStyle(color: textdark),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchTransaksi('diproses'),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: controller.diprosesList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Transaksi transaksi = controller.diprosesList[index];
                    // return DiprosesJasaCard(transaksi: transaksi);
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