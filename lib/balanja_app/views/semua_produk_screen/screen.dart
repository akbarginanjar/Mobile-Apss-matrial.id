import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/search_produk/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/card_semua_produk.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/filter_semua_produk.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/produk_skeleton.dart';

class SemuaProdukScreen extends StatefulWidget {
  const SemuaProdukScreen({super.key});

  @override
  State<SemuaProdukScreen> createState() => _SemuaProdukScreenState();
}

class _SemuaProdukScreenState extends State<SemuaProdukScreen> {
  final ProdukController controller = Get.put(ProdukController());
  final GetProduk produkStateController = Get.put(GetProduk());
  final ScrollController _scrollController = ScrollController();
  TextEditingController search = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    controller.loadProduk();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.95) {
      produkStateController.loadMoreProduk();
    }
  }

  Future<void> onRefresh() async {
    produkStateController.refreshState();
    await Future.doWhile(() {
      final state = produkStateController.state;
      return state is IniProdukStates ||
          (state is FilledProdukStates && state.isLoadingMore);
    });
  }

  Widget _buildFooterIndicator(FilledProdukStates state) {
    if (state.isLoadingMore) {
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(primary),
          ),
        ),
      );
    } else if (state.isfull && state.data != null && state.data!.isNotEmpty) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Semua produk telah dimuat.',
            style: TextStyle(color: textdark),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark,
        surfaceTintColor: dark,
        iconTheme: IconThemeData(color: primary),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Semua Produk',
              style: GoogleFonts.montserrat(
                color: textTheme,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'di Kategori dan Merek terpilih',
              style: GoogleFonts.montserrat(fontSize: 12),
            ),
          ],
        ),
        bottom: AppBar(
          elevation: 1,
          shadowColor: Colors.black45,
          surfaceTintColor: dark,
          backgroundColor: dark,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: 40,
              // width: size.width * 0.8,
              decoration: BoxDecoration(
                color: dark2,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: search,
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
                          borderSide: BorderSide(color: primary),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: nameApp == 'balanja.id'
                                ? Colors.grey[300]!
                                : Colors.grey[700]!,
                          ),
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
                        Get.to(SearchProduk(search: search.text));
                      },
                    ),
                  ),
                ],
              ),
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
