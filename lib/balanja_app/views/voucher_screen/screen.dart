import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/checkout_controller.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/voucher_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VoucherController());
    final checkoutController = Get.put(CheckoutController());

    controller.loadVoucher({});

    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Voucher"),
        backgroundColor: Colors.transparent,
        actions: [
          if (checkoutController.selectedVoucherId.value != '')
            TextButton(
              onPressed: () {
                checkoutController.deleteVoucher();
              },
              child: Text('Hapus Voucher'),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() {
          if (controller.loading.value) {
            return Column(
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      // Avatar shimmer
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),

                      SizedBox(width: 16),

                      // Text shimmer
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 140,
                              height: 16,
                              color: Colors.grey[700],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 100,
                              height: 14,
                              color: Colors.grey[700],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }

          return Column(
            children: controller.vouchers.map((v) {
              bool isSelected =
                  checkoutController.selectedVoucherId.value == v.id.toString();

              return Card(
                color: dark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: isSelected ? primary : Colors.transparent,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () => checkoutController.changeVoucher(
                    v.id.toString(),
                    v.name.toString(),
                    v.ownedBy.toString(),
                    v.member.toString(),
                    v.type,
                    v.value,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        /// ICON
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: primary,
                          child: Icon(Icons.local_offer, color: Colors.white),
                        ),

                        SizedBox(width: 16),

                        /// TEXT VOUCHER
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                v.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${v.type} : ${toCurrency(v.value)}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// CHECKMARK
                        if (isSelected)
                          Icon(Icons.check_circle, color: primary, size: 20),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ),
    );
  }
}
