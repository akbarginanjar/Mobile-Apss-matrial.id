import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_produk_controller.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_produk/produk_card/dikirim_card.dart'; 

class DikirimTabView extends StatelessWidget {
  const DikirimTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransaksiProdukController());

    if (controller.transaksiDikirim.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadDikirim();
      });
    }

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.transaksiDikirim.isEmpty) {
          return const Center(child: Text("Tidak ada transaksi Dikirim"));
        }

        return RefreshIndicator(
          onRefresh: () => controller.loadDikirim(),
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.transaksiDikirim.length,
            itemBuilder: (context, index) {
              final Transaksi transaksi = controller.transaksiDikirim[index];
              return DikirimCard(transaksi: transaksi); 
            },
          ),
        );
      }),
    );
  }
}