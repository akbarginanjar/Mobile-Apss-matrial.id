import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_jasa_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/jasa_card/selesai_card.dart'; 

class SelesaiTabView extends StatelessWidget {
  const SelesaiTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiJasaController());

    if (controller.transaksiSelesai.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadSelesai();
      });
    }

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiSelesai.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Selesai"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadSelesai(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiSelesai.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiSelesai[index];
              return SelesaiCard(transaksi: transaksi); 
            },
          ),
        );
      }),
    );
  }
}