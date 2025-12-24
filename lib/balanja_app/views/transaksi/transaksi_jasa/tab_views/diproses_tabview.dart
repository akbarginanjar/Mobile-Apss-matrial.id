import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_jasa_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/jasa_card/diproses_card.dart'; 

class DiprosesTabView extends StatelessWidget {
  const DiprosesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiJasaController());

    if (controller.transaksiDiproses.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadDiproses();
      });
    }

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiDiproses.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Diproses"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadDiproses(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiDiproses.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiDiproses[index];
              return DiprosesCard(transaksi: transaksi); 
            },
          ),
        );
      }),
    );
  }
}