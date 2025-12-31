import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_produk_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/jasa_card/pending_card.dart';

class DiterimaTabView extends StatelessWidget {
  const DiterimaTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiProdukController());

    if (controller.transaksiDiterima.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadDiterima();
      });
    }

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiDiterima.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Diterima"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadDiterima(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiDiterima.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiDiterima[index];
              return PendingCard(transaksi: transaksi);
            },
          ),
        );
      }),
    );
  }
}
