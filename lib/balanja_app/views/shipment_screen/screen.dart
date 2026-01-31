import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/checkout_controller.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/kurir_controller.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/shipment_controller.dart';
import 'package:mobile_balanja_id/balanja_app/utils/loading.dart';
import 'package:mobile_balanja_id/balanja_app/utils/value_formatter.dart';
import 'package:mobile_balanja_id/balanja_app/views/ganti_kurir_screen/kurir_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/batas_akhir.dart';

class ShipmentScreen extends StatelessWidget {
  final controller = Get.put(ShipmentController());
  final checkoutController = Get.put(CheckoutController());

  ShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadShipmentOptions({}); // panggil API

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Pilih Metode Pengiriman",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.loadShipmentOptions({});
        },
        child: Obx(() {
          if (controller.loading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.categories.length,
            itemBuilder: (ctx, i) {
              final cat = controller.categories[i];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat.name ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// LIST ITEM DI DALAM CATEGORY
                  ...cat.items!.map((item) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: dark2,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          // lakukan sesuatu ketika item dipilih
                          checkoutController.changeSelectShipment(
                            item.id!,
                            item.name!,
                            item.description!,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name ?? "",
                                      style: const TextStyle(
                                        color: Colors.white,

                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.description ?? "",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Icon(
                              //   Icons.chevron_right,
                              //   color: Colors.white.withOpacity(0.8),
                              //   size: 26,
                              // ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 20),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
