import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_jasa_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/jasa_card/ditujuan_card.dart'; 

class DitujuanTabView extends StatelessWidget {
  const DitujuanTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiJasaController());

    if (controller.transaksiDitujuan.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadDitujuan();
      });
    }

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiDitujuan.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Ditujuan"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadDitujuan(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiDitujuan.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiDitujuan[index];
              return DitujuanCard(transaksi: transaksi); 
            },
          ),
        );
      }),
    );
  }
}