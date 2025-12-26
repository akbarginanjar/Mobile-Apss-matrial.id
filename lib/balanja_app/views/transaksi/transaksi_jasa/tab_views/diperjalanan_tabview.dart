import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_jasa_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/jasa_card/diperjalanan_card.dart'; 

class DiperjalananTabView extends StatelessWidget {
  const DiperjalananTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiJasaController());

    if (controller.transaksiDiperjalanan.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadDiperjalanan();
      });
    }

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiDiperjalanan.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Diperjalanan"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadDiperjalanan(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiDiperjalanan.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiDiperjalanan[index];
              return DiperjalananCard(transaksi: transaksi); 
            },
          ),
        );
      }),
    );
  }
}