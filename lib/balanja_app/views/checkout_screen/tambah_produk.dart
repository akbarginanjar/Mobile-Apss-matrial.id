import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/expreship_app/helpers/constant.dart'
    hide primary;

class TambahProduk extends StatelessWidget {
  TambahProduk({super.key});

  final controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Produk"), centerTitle: true),

      body: Column(
        children: [
          // SEARCH BAR (fungsi belum diaktifkan)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (val) {},
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                controller: controller.scrollC,
                itemCount: controller.produkList.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.produkList.length) {
                    return controller.isMoreLoading.value
                        ? const Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : const SizedBox();
                  }

                  var item = controller.produkList[index];
                  var foto = item['photo'];
                  String idProduk = item['id'].toString();

                  return Card(
                    color: dark,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          (foto == null || foto.isEmpty)
                              ? "https://removal.ai/wp-content/uploads/2021/02/no-img.png"
                              : foto[0]['path'] ?? "",
                          width: 65,
                          height: 65,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Image.network(
                            "https://removal.ai/wp-content/uploads/2021/02/no-img.png",
                            width: 65,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      title: Text(item['nama'].toString()),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(toCurrency(item['harga'])),

                          // QTY BUTTON
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              SizedBox(
                                height: 40,
                                child: Card(
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: Colors.black26,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: GetBuilder<CheckoutController>(
                                    builder: (c) {
                                      int qty = c.getQty(idProduk);

                                      return Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            iconSize: 18,
                                            onPressed: () {
                                              c.decrement(idProduk);
                                            },
                                          ),
                                          Text(
                                            '$qty',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: primary,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.add),
                                            iconSize: 18,
                                            onPressed: () {
                                              c.increment(idProduk);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // BUTTON SIMPAN
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                var selected = controller.getSelectedProducts();

                // contoh: kirim kembali ke halaman sebelumnya
                Get.back(result: selected);
              },

              child: const Text(
                "Simpan",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
