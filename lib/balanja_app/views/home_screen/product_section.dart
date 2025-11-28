import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/screen.dart';

class ProductSection extends StatelessWidget {
  final List<Map>? listProduct;
  final bool isLoad;
  final String title;
  final VoidCallback? onLainnya;
  const ProductSection({
    super.key,
    required this.title,
    this.listProduct,
    this.isLoad = false,
    this.onLainnya,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600, color: textdark),
                ),
              ),
              Flexible(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    Get.to(const SemuaProdukScreen());
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary
                        // ignore: deprecated_member_use
                        .withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'lainnya',
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<List<dynamic>>(
          future: ProdukController().getProduk(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 160,
                child: Container(
                  color: dark,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(primary),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: index == 0 ? 12.0 : 0),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 160,
                      child: ProductCardVertical(produk: snapshot.data![index]),
                    );
                  },
                ),
              );
            }
          },
        ),
        // GetBuilder<GetProduk>(
        //   init: Get.put(GetProduk()),
        //   builder: (snapshot) {
        //     if (snapshot.state is FilledProdukStates) {
        //       FilledProdukStates filled =
        //           (snapshot.state as FilledProdukStates);
        //       if (filled.data!.isEmpty) {
        //         return const Center(
        //           child: Text(
        //             "Data Tidak Ditemukan!",
        //             style: TextStyle(color: Colors.grey),
        //           ),
        //         );
        //       } else {
        //         return SizedBox(
        //           height: 260,
        //           child: ListView.builder(
        //             itemCount: filled.data!.length,
        //             shrinkWrap: true,
        //             padding: const EdgeInsets.all(0),
        //             scrollDirection: Axis.horizontal,
        //             itemBuilder: (context, index) {
        //               // if (filled.data![index].barang != null) {
        //               return Container(
        //                 margin: EdgeInsets.only(left: index == 0 ? 12.0 : 0),
        //                 width: 160,
        //                 child: Padding(
        //                   padding: const EdgeInsets.only(bottom: 10),
        //                   child: ProductCardVertical(
        //                     produk: filled.data![index],
        //                   ),
        //                 ),
        //               );
        //               // } else {
        //               //   return Container();
        //               // }
        //             },
        //           ),
        //         );
        //       }
        //     } else {
        //       return const SizedBox(
        //         height: 170,
        //         child: Center(
        //           child: CircularProgressIndicator(
        //             valueColor: AlwaysStoppedAnimation(primary),
        //           ),
        //         ),
        //       );
        //     }
        //   },
        // ),
      ],
    );
  }
}
