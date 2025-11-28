import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class ProductCardVertical extends StatelessWidget {
  final VoidCallback? onPress;
  final Produk produk;
  const ProductCardVertical({super.key, this.onPress, required this.produk});

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
        borderRadius: BorderRadius.circular(10),
        onTap: () => Get.to(() => ProductScreen(produk: produk)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: produk.photo!.isEmpty
                  ? Image.network(
                      'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                      height: 135,
                      width: 160,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      produk.photo![0].path.toString(),
                      height: 135,
                      width: 160,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, right: 6.0, left: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${produk.nama}',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: textdark),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    toCurrency(produk.harga!),
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      produk.varianBarang![0].gudang!.alamat.toString(),
                      softWrap: true,
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
    // return Card(
    //   color: Colors.white,
    //   surfaceTintColor: Colors.white,
    //   elevation: 5,
    //   shadowColor: Colors.black87,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10),
    //     // side: BorderSide(color: Colors.grey[400]!, width: 1),
    //   ),
    //   child: ListTile(
    //     onTap: () => Get.to(() => ProductScreen(produk: produk)),
    //     contentPadding: const EdgeInsets.all(0),
    //     minVerticalPadding: 0,
    //     title: ClipRRect(
    //       borderRadius: const BorderRadius.only(
    //         topLeft: Radius.circular(10.0),
    //         topRight: Radius.circular(10.0),
    //       ),
    //       child: produk.photo!.isEmpty
    //           ? Image.network(
    //               'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
    //               height: 135,
    //               fit: BoxFit.cover,
    //             )
    //           : ListView.builder(
    //               itemCount: produk.photo!.length,
    //               shrinkWrap: true,
    //               itemBuilder: (context, index) {
    //                 return Image.network(
    //                   produk.photo![0].path.toString(),
    //                   height: 135,
    //                   fit: BoxFit.cover,
    //                 );
    //               },
    //             ),
    //     ),
    //     subtitle: Padding(
    //       padding: const EdgeInsets.only(top: 4.0, right: 6.0, left: 6.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             produk.nama.toString(),
    //             softWrap: true,
    //             maxLines: 2,
    //             overflow: TextOverflow.ellipsis,
    //             style: Theme.of(context).textTheme.bodyMedium,
    //           ),
    //           const SizedBox(height: 9.0),
    //           Text(
    //             toCurrency(produk.harga!),
    //             softWrap: true,
    //             maxLines: 1,
    //             overflow: TextOverflow.ellipsis,
    //             style: Theme.of(context)
    //                 .textTheme
    //                 .bodyLarge
    //                 ?.apply(color: Theme.of(context).colorScheme.primary),
    //           ),
    //           const SizedBox(height: 3.0),
    //           Text(
    //             produk.varianBarang![0].gudang!.member!.kabKota!.name!,
    //             softWrap: true,
    //             maxLines: 1,
    //             overflow: TextOverflow.ellipsis,
    //             style: Theme.of(context)
    //                 .textTheme
    //                 .bodySmall
    //                 ?.apply(color: Colors.grey[800]),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
