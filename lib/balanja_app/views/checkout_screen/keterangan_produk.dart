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
    // final TextEditingController qtt = TextEditingController(text: '1');
    final CheckoutController controller = Get.put(CheckoutController());

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
            return Column(
              children: controller.selectedProduk.map((item) {
                final id = item['produk']['id'];
                final nama = item['produk']['nama'] ?? 'Produk';
                final varian = item['produk']['varian'] ?? '-';
                final harga = item['produk']['harga'] ?? 0;

                final foto =
                    (item['produk']['photo'] != null &&
                        item['produk']['photo'].isNotEmpty &&
                        item['produk']['photo'][0]['path'] != null)
                    ? item['produk']['photo'][0]['path']
                    : 'https://removal.ai/wp-content/uploads/2021/02/no-img.png';

                return Card(
                  color: dark2,
                  surfaceTintColor: dark2,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(foto, fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '$nama - $varian',
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(fontSize: 13),
                                  ),
                                  Text(
                                    'Variasi : $varian',
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .bodySmall
                                        ?.apply(color: Colors.grey[500]),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    toCurrency(harga),
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .bodyLarge
                                        ?.apply(
                                          color: Theme.of(
                                            Get.context!,
                                          ).colorScheme.primary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
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
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          iconSize: 18,
                                          onPressed: () {
                                            c.decrement(id);
                                          },
                                        ),
                                        Obx(
                                          () => Text(
                                            '${c.qtyPerProduk[id] ?? 1}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: primary,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          iconSize: 18,
                                          onPressed: () {
                                            c.increment(id);
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
              }).toList(),
            );
          }),
          const SizedBox(height: 3.0),
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
