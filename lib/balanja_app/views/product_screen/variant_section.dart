import 'package:mobile_balanja_id/balanja_app/controllers/varian_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class VariantSection extends StatelessWidget {
  final List<Map>? listVariant;
  final bool isLoad;
  final VoidCallback? onLainnya;
  final Produk? produk;
  const VariantSection({
    super.key,
    this.listVariant,
    this.isLoad = false,
    this.onLainnya,
    this.produk,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      color: dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    'Varian Produk',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.apply(color: textTheme),
                  ),
                ),
                // Flexible(
                //     flex: 1,
                //     child: TextButton(
                //         onPressed: () {},
                //         style: TextButton.styleFrom(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15),
                //             ),
                //             backgroundColor: Theme.of(context)
                //                 .colorScheme
                //                 .primary
                //                 .withOpacity(0.2)),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               'lainnya',
                //               softWrap: true,
                //               style: Theme.of(context).textTheme.bodyLarge!.apply(
                //                   color: Theme.of(context).colorScheme.primary),
                //             ),
                //             const SizedBox(
                //               width: 5.0,
                //             ),
                //             Icon(
                //               Icons.arrow_forward_ios_rounded,
                //               color: Theme.of(context).colorScheme.primary,
                //               size: 16.0,
                //             )
                //           ],
                //         )))
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          // SizedBox(
          //   height: 160,
          //   child: ListView.builder(
          //     itemCount: produk!.varianBarang!.length,
          //     shrinkWrap: true,
          //     padding: const EdgeInsets.all(0),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) => Container(
          //       margin: EdgeInsets.only(left: index == 0 ? 12.0 : 0),
          //       width: 120,
          //       child: const VariantCardVertical(),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GetBuilder<VarianController>(
              init: VarianController(),
              builder: (c) {
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.horizontal,
                        itemCount: produk!.varianBarang!.length + 1,
                        itemBuilder: (context, index) {
                          // Jika index adalah elemen tambahan
                          if (index == produk!.varianBarang!.length) {
                            return const SizedBox(width: 10);
                          }

                          // Jika index valid
                          final photoList =
                              produk!.varianBarang![index].barang!.photo;

                          return VariantCardVertical(
                            namaVarian:
                                produk!.varianBarang![index].barang!.varian!,
                            photoVarian:
                                (photoList != null &&
                                    photoList.isNotEmpty &&
                                    photoList[0].path != null)
                                ? photoList[0].path.toString()
                                : "https://removal.ai/wp-content/uploads/2021/02/no-img.png",
                            index: index,
                            stok: produk!.varianBarang![index].jumlah!,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
