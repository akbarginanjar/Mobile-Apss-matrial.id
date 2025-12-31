import 'package:flutter/foundation.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/widgets/button.dart';

// ignore: must_be_immutable
class KomplainScreen extends StatelessWidget {
  int idTransaksi;
  String noInvoice;
  KomplainScreen({
    super.key,
    required this.idTransaksi,
    required this.noInvoice,
  });

  @override
  Widget build(BuildContext context) {
    final TransaksiController controller = Get.find();
    controller.loadKategoriKomplain();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Komplain'),
        actions: [
          IconButton(
            onPressed: () {
              controller.loadKategoriKomplain();
            },
            icon: Icon(Icons.refresh),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kategori Komplain',
                style: TextStyle(fontSize: 16, color: textTheme),
              ),
              const SizedBox(height: 8),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white54),
                ),
                child: controller.isLoadingKomplain.value
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.selectedKategori.value.isEmpty
                              ? null
                              : controller.selectedKategori.value,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isExpanded: true,
                          style: GoogleFonts.montserrat(color: textTheme),
                          items: controller.kategoriList
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            controller.selectedKategori.value = value ?? '';
                          },
                        ),
                      ),
              ),

              const SizedBox(height: 20),

              /// ==============================
              /// ALASAN KOMPLAIN
              /// ==============================
              Text('Alasan', style: TextStyle(fontSize: 16, color: textTheme)),
              const SizedBox(height: 8),

              TextField(
                controller: controller.alasanController,
                maxLines: 5,
                style: TextStyle(color: textTheme),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  hintText: 'Tuliskan alasan...',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.transparent,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white54),
                  ),
                ),
              ),

              const Spacer(),
              Obx(
                () => DefaultButton(
                  text: controller.isLoadingKomplain.value
                      ? 'Loading...'
                      : 'Kirim Komplain',
                  press: controller.isLoadingKomplain.value
                      ? null
                      : () {
                          Get.dialog(
                            AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              title: Text(
                                'Komplain',
                                style: GoogleFonts.montserrat(),
                              ),
                              content: const Text(
                                'Apakah kamu yakin ingin komplain pesanan ini?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(), // TIDAK
                                  child: Text(
                                    'Tidak',
                                    style: GoogleFonts.montserrat(
                                      color: textTheme,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    Get.back();
                                    await controller.kirimKomplain(
                                      idTransaksi,
                                      noInvoice,
                                    );
                                    Get.back(); // tutup SETELAH berhasil
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                  ),
                                  child: Text(
                                    'Ya, Komplain',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            barrierDismissible: false,
                          );
                        },
                  color: primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
