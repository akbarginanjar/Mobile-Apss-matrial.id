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
              Text(varian!.gudang!.namaGudang!),
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
                                        color: Colors.white,
                                      ),
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
                                  child: Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        iconSize: 18,
                                        onPressed: () {
                                          controller.decrement(idProduk);
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
                                          controller.increment(idProduk);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                  Get.to(TambahProduk());
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
