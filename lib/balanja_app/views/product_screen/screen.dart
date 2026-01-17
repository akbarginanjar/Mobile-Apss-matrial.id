import 'package:flutter/cupertino.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/detail_produk_controller.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/varian_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/product_screen/skeleton_detail_produk.dart';
import 'package:mobile_balanja_id/balanja_app/views/product_screen/spesifikasi_product.dart';
import 'package:mobile_balanja_id/balanja_app/views/product_screen/ulasan_product.dart';

class ProductScreen extends StatefulWidget {
  final String slug;
  const ProductScreen({super.key, required this.slug});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final controller = Get.put(DetailProdukController());
  @override
  Widget build(BuildContext context) {
    controller.loadDetailProduk(widget.slug);

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: dark,
            surfaceTintColor: dark,
            iconTheme: IconThemeData(color: primary),
            shadowColor: Colors.black38,
            elevation: 10,
            title: Text(
              'Detail Produk',
              style: GoogleFonts.montserrat(color: textTheme),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share_rounded),
                onPressed: () {},
              ),
              const SizedBox(width: 15),
            ],
          ),
          body: Obx(() {
            if (controller.isLoading.value) {
              return DetailProdukSkeleton();
            }

            if (controller.detailProduk.value == null) {
              return const Center(child: Text('Data tidak ditemukan'));
            }

            final produk = controller.detailProduk.value!;
            List<VarianBarang> filterId = produk.varianBarang!
                .where((item) => item.barang!.id == produk.id)
                .toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<VarianController>(
                    init: VarianController(),
                    builder: (c) {
                      final selectedVariantPhoto = c.select != null
                          ? produk.varianBarang![c.select!].barang?.photo
                          : null;

                      return Column(
                        children: [
                          const SizedBox(height: 50),
                          c.select != null
                              ? (selectedVariantPhoto?.isNotEmpty == true &&
                                        selectedVariantPhoto![0].path != null &&
                                        selectedVariantPhoto![0]
                                            .path!
                                            .isNotEmpty)
                                    ? Image.network(
                                        selectedVariantPhoto![0].path!,
                                        height: 350,
                                        width: MediaQuery.of(
                                          context,
                                        ).size.width,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                                        height: 350,
                                        width: MediaQuery.of(
                                          context,
                                        ).size.width,
                                        fit: BoxFit.cover,
                                      )
                              : (produk.photo?.isNotEmpty == true &&
                                    produk.photo![0].path != null &&
                                    produk.photo![0].path!.isNotEmpty)
                              ? Image.network(
                                  produk.photo![0].path!,
                                  height: 350,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                                  height: 350,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),

                          VariantSection(produk: produk),
                          // const SizedBox(height: 9),
                          Container(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 5,
                              bottom: 0,
                            ),
                            width: MediaQuery.of(context).size.width,
                            color: dark,
                            margin: const EdgeInsets.only(bottom: 9.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c.select != null
                                      ? toCurrency(
                                          produk
                                              .varianBarang![c.select!]
                                              .harga!,
                                        )
                                      : toCurrency(
                                          filterId.isEmpty
                                              ? produk.varianBarang![0].harga!
                                              : filterId[0].harga!,
                                        ),
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.apply(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  c.select != null
                                      ? '${produk.nama} - ${produk.varianBarang![c.select!].barang!.varian}'
                                      : '${produk.nama} - ${filterId.isEmpty ? produk.varianBarang![0].barang!.varian : filterId[0].barang!.varian}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: textTheme,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    if (produk.varianBarang![0].jumlah == 0 &&
                                        produk
                                                .varianBarang![0]
                                                .barang!
                                                .isPreOrder ==
                                            false)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: danger,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: const Text(
                                          "Stok Habis",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    const SizedBox(width: 5),
                                    if (produk
                                            .varianBarang![0]
                                            .barang!
                                            .isPreOrder ==
                                        true)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: CupertinoColors.activeOrange,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: const Text(
                                          "Pre-Order",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),

                                    const SizedBox(width: 5),

                                    if (produk.varianBarang![0].jumlah != 0 &&
                                        produk
                                                .varianBarang![0]
                                                .barang!
                                                .isPreOrder ==
                                            true)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: success,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: const Text(
                                          "Ready Stok",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),

                                    if (produk.varianBarang![0].jumlah != 0 &&
                                        produk
                                                .varianBarang![0]
                                                .barang!
                                                .isPreOrder ==
                                            false)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: success,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        child: const Text(
                                          "Ready Stok",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '332 Terjual',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.apply(color: Colors.grey),
                                    ),
                                    Row(
                                      children: [
                                        Obx(
                                          () => GestureDetector(
                                            onTap:
                                                controller
                                                    .isLoadingWishlist
                                                    .value
                                                ? null
                                                : () async {
                                                    await controller
                                                        .toggleWishlistAction(
                                                          barangId: produk.id!,
                                                          memberId: GetStorage()
                                                              .read(
                                                                'member_id',
                                                              ),
                                                        );

                                                    showWishlistSnackBar(
                                                      context,
                                                      isAdded: controller
                                                          .isWishlist
                                                          .value,
                                                    );
                                                  },

                                            child: AnimatedSwitcher(
                                              duration: const Duration(
                                                milliseconds: 250,
                                              ),
                                              transitionBuilder:
                                                  (child, animation) {
                                                    return ScaleTransition(
                                                      scale: Tween<double>(
                                                        begin: 0.8,
                                                        end: 1.0,
                                                      ).animate(animation),
                                                      child: FadeTransition(
                                                        opacity: animation,
                                                        child: child,
                                                      ),
                                                    );
                                                  },
                                              child: Icon(
                                                controller.isWishlist.value
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                key: ValueKey(
                                                  controller.isWishlist.value,
                                                ),
                                                color:
                                                    controller.isWishlist.value
                                                    ? Colors.red
                                                    : Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                size: 25,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  if (textTheme == Colors.black)
                    Container(height: 8, color: Colors.grey[100]),
                  TokoInfo(produk: produk),
                  if (textTheme == Colors.black)
                    Container(height: 8, color: Colors.grey[100]),
                  if (textTheme == Colors.white) const SizedBox(height: 9),
                  SpesifikasiProduct(produk: produk),
                  if (nameApp == 'balanja.id') Divider(color: Colors.grey[200]),
                  DeskripsiProduct(produk: produk),
                  if (textTheme == Colors.white) const SizedBox(height: 9),
                  if (textTheme == Colors.black)
                    Container(height: 8, color: Colors.grey[100]),
                  UlasanView(
                    barangId: produk.varianBarang![0].barangId!.toString(),
                  ),
                  const SizedBox(height: 100.0),
                ],
              ),
            );
          }),
        ),
        Positioned(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: 100,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: dark,
                border: Border(top: BorderSide(color: dark2, width: 1.5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      openWhatsApp(phoneNumber: "6285861345339");
                    },
                    icon: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/icon-wa.png'),
                    ),
                  ),
                  Row(
                    children: [
                      // SizedBox(
                      //   height: 50,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       elevation: 0,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15.0),
                      //         side: BorderSide(
                      //           color: Theme.of(context).colorScheme.primary,
                      //           width: 1.5,
                      //         ),
                      //       ),
                      //     ),
                      //     onPressed: () {},
                      //     child: Text(
                      //       'Keranjang',
                      //       style: Theme.of(context).textTheme.bodyMedium!
                      //           .apply(
                      //             color: Theme.of(context).colorScheme.primary,
                      //           ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(width: 7),
                      Obx(() {
                        if (controller.detailProduk.value == null) {
                          return SizedBox(
                            height: 50,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: null,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          );
                          ;
                        }

                        final produk = controller.detailProduk.value!;
                        return SizedBox(
                          height: 50,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: controller.isLoading.value
                                ? null
                                : () {
                                    beliSekarang(produk);
                                  },
                            child: controller.isLoading.value
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    produk.varianBarang![0].jumlah == 0
                                        ? 'Pre Order'
                                        : 'Beli Sekarang',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  beliSekarang(Produk produk) {
    List<VarianBarang> filterId = produk.varianBarang!
        .where((item) => item.barang!.id == produk.id)
        .toList();
    Get.bottomSheet(
      SizedBox(
        height: 320,
        child: Container(
          decoration: BoxDecoration(
            color: dark, // Gunakan warna tema Anda
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
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
                GetBuilder<VarianController>(
                  init: VarianController(),
                  builder: (c) {
                    final selectedVariantPhoto = c.select != null
                        ? produk.varianBarang![c.select!].barang?.photo
                        : null;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            c.select != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:
                                        (selectedVariantPhoto?.isNotEmpty ==
                                                true &&
                                            selectedVariantPhoto![0].path !=
                                                null &&
                                            selectedVariantPhoto![0]
                                                .path!
                                                .isNotEmpty)
                                        ? Image.network(
                                            selectedVariantPhoto![0].path!,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:
                                        (produk.photo?.isNotEmpty == true &&
                                            produk.photo![0].path != null &&
                                            produk.photo![0].path!.isNotEmpty)
                                        ? Image.network(
                                            produk.photo![0].path!,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                  ),

                            const SizedBox(width: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  c.select != null
                                      ? toCurrency(
                                          produk
                                              .varianBarang![c.select!]
                                              .harga!,
                                        )
                                      : toCurrency(
                                          filterId.isEmpty
                                              ? produk.varianBarang![0].harga!
                                              : filterId[0].harga!,
                                        ),
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.apply(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                ),
                                Text(
                                  c.select != null
                                      ? 'Stok : ${produk.varianBarang![c.select!].jumlah}'
                                      : 'Stok : ${filterId.isEmpty ? produk.varianBarang![0].jumlah : filterId[0].jumlah}',
                                  style: TextStyle(
                                    color: textTheme,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        GetBuilder<VarianController>(
                          init: VarianController(),
                          builder: (c) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: produk.varianBarang!.length + 1,
                                    itemBuilder: (context, index) {
                                      final int idx = index + 1;
                                      if (idx !=
                                          (produk.varianBarang!.length + 1)) {
                                        final currentVariantPhoto = produk
                                            .varianBarang![index]
                                            .barang
                                            ?.photo;
                                        final isOutOfStock =
                                            produk
                                                .varianBarang![index]
                                                .jumlah ==
                                            0;

                                        final safeImageWidget = ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          child:
                                              (currentVariantPhoto
                                                          ?.isNotEmpty ==
                                                      true &&
                                                  currentVariantPhoto![0]
                                                          .path !=
                                                      null &&
                                                  currentVariantPhoto![0].path!
                                                      .toString()
                                                      .isNotEmpty)
                                              ? Image.network(
                                                  currentVariantPhoto![0].path!
                                                      .toString(),
                                                  height: 30,
                                                  width: 30,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(
                                                  'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                                                  height: 30,
                                                  width: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                        );

                                        return isOutOfStock
                                            ? InkWell(
                                                onTap: () {
                                                  c.changeSelect(index);
                                                },
                                                child: Card(
                                                  color: c.select == index
                                                      ? (nameApp ==
                                                                'balanja.id')
                                                            ? Colors.green[50]
                                                            : primary
                                                      : dark,
                                                  surfaceTintColor:
                                                      Colors.white,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    side: BorderSide(
                                                      color: c.select == index
                                                          ? primary
                                                          : Colors.grey[300]!,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          left: 5,
                                                          right: 10,
                                                          top: 5,
                                                        ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        safeImageWidget,
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                top: 5,
                                                              ),
                                                          child: Text(
                                                            produk
                                                                .varianBarang![index]
                                                                .barang!
                                                                .varian!,
                                                            softWrap: true,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: textTheme,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  c.changeSelect(index);
                                                },
                                                child: Card(
                                                  color: c.select == index
                                                      ? (nameApp ==
                                                                'balanja.id')
                                                            ? Colors.green[50]
                                                            : primary
                                                      : dark,
                                                  surfaceTintColor:
                                                      Colors.white,
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                    side: BorderSide(
                                                      color: c.select == index
                                                          ? primary
                                                          : Colors.grey[300]!,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          left: 5,
                                                          right: 10,
                                                          top: 5,
                                                        ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        safeImageWidget,
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                top: 5,
                                                              ),
                                                          child: Text(
                                                            produk
                                                                .varianBarang![index]
                                                                .barang!
                                                                .varian!,
                                                            softWrap: true,
                                                            style:
                                                                const TextStyle(
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 30),
                GetBuilder<VarianController>(
                  init: VarianController(),
                  builder: (c) {
                    return SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {
                          if (c.select == null) {
                            EasyLoading.showToast('Pilih Varian');
                          } else {
                            if (produk
                                    .varianBarang![c.select!]
                                    .jumlah == //validator stok
                                0) {
                              EasyLoading.showToast('Pre Order');
                              Get.to(
                                CheckoutScreen(
                                  varian: produk.varianBarang![c.select!],
                                ),
                              );
                            } else {
                              Get.to(
                                CheckoutScreen(
                                  varian: produk.varianBarang![c.select!],
                                ),
                              );
                              // print(produk.varianBarang![c.select!].id);
                            }
                          }
                        },
                        child: Text(
                          produk.varianBarang![0].jumlah == //validator stok
                                  0
                              ? 'Pre Order'
                              : 'Beli Sekarang',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showWishlistSnackBar(BuildContext context, {required bool isAdded}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black87,
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          Icon(
            isAdded ? Icons.favorite : Icons.favorite_border,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(width: 6),
          Text(
            isAdded
                ? 'Produk ditambahkan ke wishlist'
                : 'Produk dihapus dari wishlist',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
