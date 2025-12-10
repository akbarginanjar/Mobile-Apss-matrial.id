import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/checkout_controller.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/voucher_controller.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoucherController());
    final checkoutController = Get.put(CheckoutController());

    controller.loadVouchers();

    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Voucher"),
        backgroundColor: Colors.transparent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.vouchers.isEmpty) {
          return Center(child: Text("Tidak ada voucher tersedia"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.vouchers.length,
          itemBuilder: (context, index) {
            final v = controller.vouchers[index];

            final isSelected = checkoutController.selectedVoucher.value == v.id;

            return Card(
              color: isSelected ? Colors.blueGrey[800] : Colors.grey[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: isSelected ? Colors.blue : Colors.transparent,
                  width: 2,
                ),
              ),
              margin: EdgeInsets.only(bottom: 15),
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => checkoutController.changeVoucher(v.id.toString()),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      /// ICON
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.local_offer, color: Colors.white),
                      ),

                      SizedBox(width: 16),

                      /// TEXT VOUCHER
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              v.name ?? "-",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${v.type ?? ''} : ${v.value ?? 0}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// CHECKMARK
                      if (isSelected)
                        Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent,
                          size: 28,
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
