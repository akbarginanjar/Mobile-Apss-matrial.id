import 'package:flutter/material.dart';
import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/kurir_model.dart';

class KurirTokoCard extends StatelessWidget {
  final KurirToko item;

  const KurirTokoCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    return Card(
      color: dark,
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          checkoutController.changeSelectKurirToko(
            item.id,
            item.namaKurir,
            item.hargaOngkir,
            item.isActive,
          );
          Get.back();
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.namaKurir,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "Dikirim langsung oleh toko",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      toCurrency(item.hargaOngkir),
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // const Icon(
              //   Icons.arrow_forward_ios_rounded,
              //   color: Colors.white54,
              //   size: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
