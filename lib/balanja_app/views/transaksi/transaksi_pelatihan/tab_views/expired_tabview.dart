import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_pelatihan_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_pelatihan/pelatihan_card/expired_card.dart'; 

class ExpiredTabView extends StatelessWidget {
  const ExpiredTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiPelatihanController());

    if (controller.transaksiExpired.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadExpired();
      });
    }

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiExpired.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Expired"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadExpired(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiExpired.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiExpired[index];
              return ExpiredCard(transaksi: transaksi); 
            },
          ),
        );
      }),
    );
  }
}