import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_pelatihan_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/views/transaksi/expired_pelatihan_card.dart';

class ExpiredTabView extends StatelessWidget {
  ExpiredTabView({super.key});

  final TransaksiPelatihanController controller = Get.find<TransaksiPelatihanController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark2,
      child: Obx(() {
        if (controller.isLoadingExpired.value && controller.expiredList.isEmpty) {
          return const SizedBox(
            height: 160,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (controller.expiredList.isEmpty) {
          return RefreshIndicator(
            onRefresh: () => controller.fetchTransaksi('expired'),
            child: ListView(
              children: [
                const SizedBox(height: 200),
                Center(
                  child: Text(
                    'Tidak ada transaksi Pelatihan Expired.',
                    style: TextStyle(color: textdark),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchTransaksi('expired'),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  itemCount: controller.expiredList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Transaksi transaksi = controller.expiredList[index];
                    // return ExpiredPelatihanCard(transaksi: transaksi);
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