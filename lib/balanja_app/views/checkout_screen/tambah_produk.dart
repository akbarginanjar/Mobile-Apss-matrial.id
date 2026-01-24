import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/widgets/button.dart';
import 'package:mobile_balanja_id/expreship_app/helpers/constant.dart'
    hide primary;

class TambahProduk extends StatelessWidget {
  final String memberId;
  TambahProduk({super.key, required this.memberId});

  final controller = Get.put(CheckoutController());
  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.loadProduk(memberId.toString(), search.text);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        title: Text("Tambah Produk "),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // SEARCH BAR (fungsi belum diaktifkan)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: search,
              decoration: InputDecoration(
                hintText: "Cari produk...",

                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.loadProduk(memberId, search.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Cari', style: TextStyle(color: Colors.white)),
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(Icons.search),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.circular(15),
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

                      title: Text(
                        item['nama'].toString(),
                        style: TextStyle(fontSize: 12),
                      ),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 2),
                          Text(
                            'Berat : ${item['berat']}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              if (item['is_pre_order'] == true)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text(
                                    "Pre Order",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              if (item['is_pre_order'] == true)
                                SizedBox(width: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue[800],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "Stok : ${item['jumlah']}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            toCurrency(item['harga']),
                            style: TextStyle(color: primary),
                          ),

                          // QTY BUTTON
                          // QTY BUTTON
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),

                              GetBuilder<CheckoutController>(
                                builder: (c) {
                                  final qty = c.getQty(idProduk);
                                  final qtyController = TextEditingController(
                                    text: qty.toString(),
                                  );

                                  return Align(
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // MINUS
                                        Material(
                                          color: dark2,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            splashColor: primary.withOpacity(
                                              0.3,
                                            ),
                                            highlightColor: primary.withOpacity(
                                              0.15,
                                            ),
                                            onTap: () => c.decrement(idProduk),
                                            child: const SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: Icon(
                                                Icons.remove,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 7),

                                        // QTY INPUT
                                        Container(
                                          height: 35,
                                          width: 65,
                                          decoration: BoxDecoration(
                                            color: dark,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: Colors.white24,
                                              width: 1.2,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: TextField(
                                            controller: qtyController,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              border: InputBorder.none,
                                              isDense: true,
                                              contentPadding: EdgeInsets.zero,
                                            ),
                                            onChanged: (value) {
                                              final parsed = int.tryParse(
                                                value,
                                              );
                                              if (parsed == null) return;

                                              final stok = item['jumlah'];
                                              final isPreOrder =
                                                  item['is_pre_order'] == true;

                                              int finalQty = parsed;

                                              if (!isPreOrder &&
                                                  parsed > stok) {
                                                finalQty = stok;
                                                qtyController
                                                    .value = TextEditingValue(
                                                  text: stok.toString(),
                                                  selection:
                                                      TextSelection.collapsed(
                                                        offset: stok
                                                            .toString()
                                                            .length,
                                                      ),
                                                );
                                              }

                                              if (finalQty < 1) {
                                                finalQty = 1;
                                                qtyController.value =
                                                    const TextEditingValue(
                                                      text: '1',
                                                      selection:
                                                          TextSelection.collapsed(
                                                            offset: 1,
                                                          ),
                                                    );
                                              }

                                              c.setQty(idProduk, finalQty);
                                            },
                                          ),
                                        ),

                                        const SizedBox(width: 7),

                                        // PLUS
                                        Material(
                                          color: dark2,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            splashColor: primary.withOpacity(
                                              0.3,
                                            ),
                                            highlightColor: primary.withOpacity(
                                              0.15,
                                            ),
                                            onTap:
                                                (!item['is_pre_order'] &&
                                                    qty >= item['jumlah'])
                                                ? null
                                                : () => c.increment(idProduk),
                                            child: SizedBox(
                                              height: 35,
                                              width: 35,
                                              child: Icon(
                                                Icons.add,
                                                size: 18,
                                                color:
                                                    (!item['is_pre_order'] &&
                                                        qty >= item['jumlah'])
                                                    ? Colors.grey
                                                    : primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
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
            child: DefaultButton(
              text: 'Simpan',
              press: () {
                var selected = controller.getSelectedProducts();

                // contoh: kirim kembali ke halaman sebelumnya
                Get.back(result: selected);
              },
              color: primary,
            ),
          ),
        ],
      ),
    );
  }
}

Widget productSkeletonItem() {
  return Card(
    color: dark,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(width: 10),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: double.infinity,
                  color: Colors.white24,
                ),
                const SizedBox(height: 6),
                Container(height: 10, width: 100, color: Colors.white24),
                const SizedBox(height: 8),
                Container(height: 10, width: 80, color: Colors.white24),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
