import 'package:mobile_balanja_id/balanja_app/controllers/home_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/notifikasi_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/search_produk/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/wishlist_produk_screen/screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    TextEditingController search = TextEditingController();
    return Scaffold(
      body: RefreshIndicator(
        color: primary,
        backgroundColor: dark2,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          GetProduk.to.refreshState();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: dark,
              surfaceTintColor: dark,
              floating: true,
              pinned: true,
              snap: false,
              centerTitle: false,
              title: SizedBox(
                height: 110,
                width: 160,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    'assets/matrial.id-barbg.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_none, color: primary),
                  onPressed: () {
                    Get.to(const NotifikasiScreen());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border_rounded, color: primary),
                  onPressed: () {
                    Get.to(WishlistProdukScreen());
                  },
                ),
                const SizedBox(width: 10),
              ],
              bottom: AppBar(
                elevation: 2,
                shadowColor: Colors.black45,
                surfaceTintColor: dark,
                backgroundColor: dark,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 40,
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
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                borderSide: BorderSide(color: textdark),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                borderSide: BorderSide(color: textdark),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: const BorderRadius.only(
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
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 10),
                Obx(() {
                  return Skeletonizer(
                    enabled: controller.isLoading.value,
                    child: controller.bannerList.isEmpty
                        ? Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(color: Colors.grey.shade300),
                            ),
                          )
                        : Carousel(
                            listImage: controller.bannerList
                                .map((e) => e.foto)
                                .toList(),
                          ),
                  );
                }),
                const SizedBox(height: 10.0),
                FutureBuilder(
                  future: loadToko(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return PilihToko(toko: 'Loading...', onTap: () {});
                    }
                    return PilihToko(
                      toko: GetStorage().read('id_toko') == null
                          ? 'Semua produk'
                          : GetStorage().read('nama_toko'),
                      onTap: () {},
                    );
                  },
                ),
                const SizedBox(height: 7),
                const Pengumuman(
                  teks:
                      'Layanan transaksi sengan Bank BCA dan tarik saldo ke rekening BCA tidak dapat dilakukan pada 4 Februrari 2024 pukul 01:00-04:00 WIB.',
                ),
                const SizedBox(height: 10),
                const MenuHomeScreen(),
                const SizedBox(height: 10),
                const ProductSection(title: 'Untuk Kamu'),
                const SizedBox(height: 10.0),
                const BannerPromo(
                  urlImage:
                      'https://www.tanamduit.com/wp-content/uploads/2021/08/promo-linkaja-kemerdekaan-blog-banner.png',
                ),
                const SizedBox(height: 20.0),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> loadToko() async {
  await Future.delayed(const Duration(seconds: 1));
  await GetStorage().read('nama_toko');
}
