import 'package:mobile_balanja_id/balanja_app/controllers/cari_produk_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/card_semua_produk.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/produk_skeleton.dart';

// ignore: must_be_immutable
class SearchProduk extends StatelessWidget {
  String? search;
  SearchProduk({super.key, required this.search});
  CariProdukController controller = CariProdukController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController search2 = TextEditingController(text: search);
    controller.changeData(search.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black45,
        surfaceTintColor: dark,
        backgroundColor: dark,
        title: Container(
          height: 40,
          // width: size.width * 0.8,
          decoration: BoxDecoration(
            color: dark2,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Form(
            key: form,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: search2,
                    decoration: InputDecoration(
                      hintText: 'Cari produk...',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: textdark,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textdark),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: textdark),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search, color: dark, size: 24),
                    onPressed: () {
                      controller.changeData(search2.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.loadProduk();
          },
          child: controller.isLoading.value && controller.produkList.isEmpty
              // ======================
              // 🔥 SKELETON AWAL
              // ======================
              ? GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.70,
                  ),
                  itemCount: 6,
                  itemBuilder: (_, __) => const ProdukSkeleton(),
                )
              // ======================
              // 📦 DATA + LAZYLOAD
              // ======================
              : GridView.builder(
                  controller: controller.scrollC,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.70,
                  ),
                  itemCount:
                      controller.produkList.length +
                      (controller.isMoreLoading.value ? 2 : 0),
                  itemBuilder: (context, index) {
                    // ======================
                    // 📦 CARD PRODUK
                    // ======================
                    if (index < controller.produkList.length) {
                      final produk = controller.produkList[index];
                      return CardSemuaProduk(produk: produk);
                    }

                    // ======================
                    // ⏳ SKELETON LAZYLOAD
                    // ======================
                    return const ProdukSkeleton();
                  },
                ),
        );
      }),
    );
  }
}
