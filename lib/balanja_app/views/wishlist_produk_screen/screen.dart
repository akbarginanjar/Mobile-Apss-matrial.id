import 'package:mobile_balanja_id/balanja_app/controllers/wishlist_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/card_semua_produk.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/produk_skeleton.dart';

class WishlistProdukScreen extends StatelessWidget {
  const WishlistProdukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WishListController controller = Get.put(WishListController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        surfaceTintColor: dark,
        iconTheme: IconThemeData(color: primary),
        centerTitle: false,
        title: Text('Wishlist'),
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.loadProduk();
          },
          child: controller.isLoading.value && controller.produkList.isEmpty
              ? GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.70, // khas card ecommerce
                  ),
                  itemCount: 6,
                  itemBuilder: (_, __) => const ProdukSkeleton(),
                )
              : GridView.builder(
                  controller: controller.scrollC,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.70,
                  ),
                  itemCount:
                      controller.produkList.length +
                      (controller.isMoreLoading.value
                          ? 2
                          : 0), // 👈 skeleton count
                  itemBuilder: (context, index) {
                    if (index < controller.produkList.length) {
                      final produk = controller.produkList[index];
                      return CardSemuaProduk(produk: produk);
                    } else {
                      // 👇 skeleton saat lazyload
                      return const ProdukSkeleton();
                    }
                  },
                ),
        );
      }),
    );
  }
}
