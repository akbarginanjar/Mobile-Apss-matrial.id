import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/checkout_controller.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/ganti_kurir_controller.dart';
import 'package:mobile_balanja_id/balanja_app/utils/loading.dart';
import 'package:mobile_balanja_id/balanja_app/utils/value_formatter.dart';
import 'package:mobile_balanja_id/balanja_app/views/ganti_kurir_screen/kurir_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/batas_akhir.dart';

class GantiKurirScreen extends StatefulWidget {
  const GantiKurirScreen({super.key});

  @override
  State<GantiKurirScreen> createState() => _GantiKurirScreenState();
}

class _GantiKurirScreenState extends State<GantiKurirScreen> {
  final CheckoutController controller = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text('Opsi Pengiriman'),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GetBuilder<GantiKurirController>(
          init: Get.put(GantiKurirController()),
          builder: (c) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<List<dynamic>>(
                        future: GantiKurirController().getPengiriman(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(
                              height: 160,
                              child: LoadingProses(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length + 1,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final int idx = index + 1;
                                return idx != (snapshot.data!.length + 1)
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${snapshot.data![index].name}',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleSmall,
                                          ),
                                          const SizedBox(height: 5),
                                          ListView.builder(
                                            itemCount: snapshot
                                                .data![index]
                                                .items
                                                .length,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, item) {
                                              return Card(
                                                color: Colors.white,
                                                surfaceTintColor: Colors.white,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color: Colors.grey[300]!,
                                                    width: 1.2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ListTile(
                                                  onTap: () {},
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  title: Text(
                                                    '${snapshot.data![index].items[item].name}',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    '${snapshot.data![index].items[item].description}',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  trailing: const Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    size: 15,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      )
                                    : const BatasAkhir(
                                        customName: 'Pengiriman',
                                      );
                              },
                            );
                          }
                        },
                      ),
                      SizedBox(height: c.select != null ? 60 : 0),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
