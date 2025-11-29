import 'package:flutter/cupertino.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class CardSemuaProduk extends StatelessWidget {
  final VoidCallback? onPress;
  final Produk produk;
  const CardSemuaProduk({Key? key, this.onPress, required this.produk})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark,
      surfaceTintColor: dark,
      elevation: 0,
      shadowColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: dark),
      ),
      child: InkWell(
        onTap: () {
          Get.to(ProductScreen(produk: produk));
        },
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // GAMBAR PRODUK
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: produk.photo!.isEmpty
                      ? Image.network(
                          'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                          height: 135,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          produk.photo![0].path.toString(),
                          height: 135,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),

                // ===== BADGE DI BAGIAN BAWAH GAMBAR =====
                Positioned(
                  bottom: 8,
                  left: 5,
                  child: Row(
                    children: [
                      // BADGE PRE ORDER
                      if (produk.varianBarang![0].jumlah == 0 &&
                          produk.varianBarang![0].barang!.isPreOrder == false)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: danger,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Stok Habis",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),

                      const SizedBox(width: 5),

                      // BADGE READY STOCK
                      if (produk.varianBarang![0].barang!.isPreOrder == true)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: CupertinoColors.activeOrange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Pre-Order",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),

                      const SizedBox(width: 5),

                      if (produk.varianBarang![0].jumlah != 0 &&
                          produk.varianBarang![0].barang!.isPreOrder == true)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: success,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Ready Stok",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),

                      if (produk.varianBarang![0].jumlah != 0 &&
                          produk.varianBarang![0].barang!.isPreOrder == false)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: success,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Ready Stok",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            // ===========================
            // DETAIL PRODUK
            // ===========================
            Padding(
              padding: const EdgeInsets.only(
                top: 6,
                right: 6,
                left: 6,
                bottom: 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAMA PRODUK
                  Text(
                    produk.nama!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: textdark),
                  ),

                  const SizedBox(height: 6),

                  // HARGA CORET ATAU "-"
                  if (produk.hargaCoret != 0)
                    Text(
                      toCurrency(produk.hargaCoret!),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),

                  const SizedBox(height: 4),

                  // HARGA UTAMA
                  Text(
                    toCurrency(produk.harga!),
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // ALAMAT
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      produk.varianBarang![0].gudang!.alamat.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 11, color: textdark),
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
}
