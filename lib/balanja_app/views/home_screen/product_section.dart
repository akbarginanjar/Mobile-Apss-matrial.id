import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/produk_skeleton.dart';
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
    final ProdukController controllerProduk = Get.put(ProdukController());
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
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textdark,
                  ),
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
        Obx(() {
          return SizedBox(
            height: 240,
            child:
                controllerProduk.isLoadingUntukKamu.value &&
                    controllerProduk.produkUntukKamu.isEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 190,
                        margin: EdgeInsets.only(left: index == 0 ? 12 : 8),
                        child: const ProdukSkeleton(),
                      );
                    },
                  )
                : ListView.builder(
                    controller: controllerProduk.scrollCUntukKamu,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount:
                        controllerProduk.produkUntukKamu.length +
                        (controllerProduk.isMoreLoadingUntukKamu.value ? 2 : 0),
                    itemBuilder: (context, index) {
                      if (index < controllerProduk.produkUntukKamu.length) {
                        final produk = controllerProduk.produkUntukKamu[index];
                        return Container(
                          width: 190,
                          margin: EdgeInsets.only(left: index == 0 ? 12 : 3),
                          child: ProductCardVertical(produk: produk),
                        );
                      } else {
                        // 👇 skeleton saat lazyload
                        return Container(
                          width: 190,
                          margin: const EdgeInsets.only(left: 8),
                          child: const ProdukSkeleton(),
                        );
                      }
                    },
                  ),
          );
        }),
      ],
    );
  }
}
