import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/widgets/button.dart';

class UlasanWidget extends StatelessWidget {
  final int idTransaksi;
  final String noInvoice;
  final List item;
  UlasanWidget({
    super.key,
    required this.idTransaksi,
    required this.noInvoice,
    required this.item,
  });

  final controller = Get.put(TransaksiController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: dark,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Text(
              'Penilaian Produk',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (i) {
                return IconButton(
                  icon: Icon(
                    size: 35,
                    controller.rating.value > i
                        ? Icons.star
                        : Icons.star_border_outlined,
                    color: controller.rating.value > i
                        ? Colors.orange
                        : Colors.orange,
                  ),
                  onPressed: () => controller.setRating(i + 1),
                );
              }),
            ),

            const SizedBox(height: 30),

            /// ✏️ Komentar
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Tulis ulasan...',
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                filled: true,
              ),
              onChanged: (v) => controller.komentar.value = v,
            ),

            const SizedBox(height: 12),

            /// 📷 Foto & 🎥 Video
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultButtonOutline(
                        press: controller.pickFoto,
                        text: 'Pilih Foto',
                      ),

                      const SizedBox(height: 5),
                      Text(
                        'Maksimal (${controller.fotos.length}/2)',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultButtonOutline(
                        press: controller.pickVideo,
                        text: 'Pilih Video',
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Maksimal (${controller.videos.length}/2)',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// 🔘 Action
            DefaultButton(
              press: controller.isLoadingUlasan.value
                  ? null
                  : () async {
                      Get.back();
                      await controller.simpanUlasan(
                        item, // ⬅️ kirim LIST item
                        noInvoice,
                      );
                      Get.back();
                    },

              text: 'Kirim Semua Ulasan',
              color: primary,
            ),
          ],
        ),
      );
    });
  }
}
