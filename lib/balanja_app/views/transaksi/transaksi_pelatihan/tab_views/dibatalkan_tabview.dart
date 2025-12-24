import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_pelatihan_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_pelatihan/pelatihan_card/dibatalkan_card.dart'; 

class DibatalkanTabView extends StatelessWidget {
  const DibatalkanTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiPelatihanController());

    if (controller.transaksiDibatalkan.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadDibatalkan();
      });
    }

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiDibatalkan.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Dibatalkan"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadDibatalkan(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiDibatalkan.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiDibatalkan[index];
              return DibatalkanCard(transaksi: transaksi); 
            },
          ),
        );
      }),
    );
  }
}