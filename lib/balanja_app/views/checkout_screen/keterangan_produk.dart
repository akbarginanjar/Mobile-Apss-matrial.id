import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/checkout_screen/tambah_produk.dart';
import 'package:mobile_balanja_id/balanja_app/views/checkout_screen/voucher.dart';

class KetProduk extends StatelessWidget {
  final VarianBarang? varian;
  const KetProduk({super.key, required this.varian});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey<FormState>();
    final TextEditingController pesan = TextEditingController();
    // Ambil controller tanpa late
    final CheckoutController controller = Get.find();

    // Pastikan setProdukUtama hanya dipanggil sekali
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setProdukUtama({
        "id": varian!.id,
        "nama": varian!.nama,
        "barang_id": varian!.barangId,
        "berat": varian!.berat,
        "harga": varian!.harga,
        "is_pre_order": varian!.isPreOrder,
        "jumlah": varian!.jumlah,
        "photo": [
          {"path": varian!.photo[0].path},
        ],
      });
    });

    return Container(
      color: dark,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.storefront_sharp,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 6.0),
              Text(
                varian!.gudang!.namaGudang!,
                style: TextStyle(color: textTheme),
              ),
            ],
          ),
          Obx(() {
            if (controller.cart.isEmpty) {
              return Center(child: Text("Belum ada produk ditambahkan"));
            }

            // Konversi map cart menjadi list produk
            final entries = controller.cart.entries.toList();

            // Tentukan list yang mau ditampilkan (2 item atau semua)
            final displayedItems = controller.showAllProducts.value
                ? entries
                : entries.take(2).toList();

            return Column(
              children: [
                // LIST PRODUK
                ...displayedItems.map((e) {
                  String idProduk = e.key;
                  int qty = e.value;
                  final qtyController = TextEditingController(
                    text: qty.toString(),
                  );

                  var produk;

                  // check produk utama dulu
                  if (idProduk == controller.idProdukUtama &&
                      controller.produkUtama != null) {
                    produk = controller.produkUtama;
                  } else {
                    produk = controller.produkList.firstWhere(
                      (p) => p['id'].toString() == idProduk,
                      orElse: () => null,
                    );
                  }

                  if (produk == null) return SizedBox();

                  return Card(
                    color: dark2,
                    surfaceTintColor: dark2,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // FOTO
                              Flexible(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: Image.network(
                                    (produk['photo'] == null ||
                                            produk['photo'].isEmpty)
                                        ? "https://removal.ai/wp-content/uploads/2021/02/no-img.png"
                                        : produk['photo'][0]['path'],
                                    fit: BoxFit.cover,
                                    height: 60,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              // NAMA + HARGA
                              Flexible(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      produk['nama'],
                                      softWrap: true,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: textTheme,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Berat : ${produk['berat']}',
                                      softWrap: true,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        if (produk['is_pre_order'] == true)
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 7,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const Text(
                                              "Pre Order",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        if (produk['is_pre_order'] == true)
                                          SizedBox(width: 5),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 7,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[800],
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                          child: Text(
                                            "Stok : ${produk['jumlah']}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '${toCurrency(produk['harga'])} ($qty)',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // QTY BUTTON
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // MINUS BUTTON
                                Material(
                                  color: dark,
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: primary.withOpacity(0.3),
                                    highlightColor: primary.withOpacity(0.15),
                                    onTap: () => controller.decrement(idProduk),
                                    child: const SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 7),

                                // QTY INPUT
                                Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: dark2,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white24,
                                      width: 1.2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: TextField(
                                    controller: qtyController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontSize: 16,
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
                                      final parsed = int.tryParse(value);
                                      if (parsed == null) return;

                                      final stok = produk['jumlah'];
                                      final isPreOrder =
                                          produk['is_pre_order'] == true;

                                      int finalQty = parsed;

                                      if (!isPreOrder && parsed > stok) {
                                        finalQty = stok;
                                        qtyController.value = TextEditingValue(
                                          text: stok.toString(),
                                          selection: TextSelection.collapsed(
                                            offset: stok.toString().length,
                                          ),
                                        );
                                      }

                                      if (finalQty < 1) {
                                        finalQty = 1;
                                        qtyController
                                            .value = const TextEditingValue(
                                          text: '1',
                                          selection: TextSelection.collapsed(
                                            offset: 1,
                                          ),
                                        );
                                      }

                                      controller.setQty(idProduk, finalQty);
                                    },
                                  ),
                                ),

                                const SizedBox(width: 7),

                                // PLUS BUTTON
                                Material(
                                  color: dark,
                                  borderRadius: BorderRadius.circular(10),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    splashColor: primary.withOpacity(0.3),
                                    highlightColor: primary.withOpacity(0.15),
                                    onTap:
                                        (!produk['is_pre_order'] &&
                                            qty >= produk['jumlah'])
                                        ? null
                                        : () => controller.increment(idProduk),
                                    child: SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: Icon(
                                        Icons.add,
                                        color:
                                            (!produk['is_pre_order'] &&
                                                qty >= produk['jumlah'])
                                            ? Colors.grey
                                            : primary,
                                      ),
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
                }),

                // BUTTON LIHAT SEMUA / LEBIH SEDIKIT
                if (entries.length > 2)
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.showAllProducts.toggle();
                        },
                        child: Text(
                          controller.showAllProducts.value
                              ? "Lebih sedikit"
                              : "Lihat semua (${entries.length})",
                          style: GoogleFonts.montserrat(color: primary),
                        ),
                      ),
                      Divider(color: Colors.grey[800]),
                    ],
                  ),
              ],
            );
          }),
          const SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              TextButton(
                onPressed: () {
                  Get.to(TambahProduk(memberId: '${varian!.gudang!.memberId}'));
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primary.withOpacity(0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tambah Produk',
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.primary,
                      size: 16.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 3.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Catatan',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 60,
                      child: TextFormField(
                        maxLength: 200,
                        decoration: InputDecoration(
                          hintText: 'Masukan catatan disini...',
                          hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          fillColor: primary,
                        ),
                        controller: pesan,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Divider(color: dark2),
          const SizedBox(height: 2),
          const Voucher(),
        ],
      ),
    );
  }
}
