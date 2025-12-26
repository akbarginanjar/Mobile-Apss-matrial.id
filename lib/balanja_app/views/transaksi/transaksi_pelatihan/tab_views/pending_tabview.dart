import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_pelatihan_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_pelatihan/pelatihan_card/pending_card.dart';

class PendingTabView extends StatelessWidget {
  const PendingTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiPelatihanController());

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiPending.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Pending"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadPending(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiPending.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiPending[index];
              return PendingCard(transaksi: transaksi);
            },
          ),
        );
      }),
    );
  }
}