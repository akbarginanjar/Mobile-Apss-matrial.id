import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/search_produk/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/card_semua_produk.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/filter_semua_produk.dart';

class SemuaProdukScreen extends StatefulWidget {
  const SemuaProdukScreen({super.key});

  @override
  State<SemuaProdukScreen> createState() => _SemuaProdukScreenState();
}

class _SemuaProdukScreenState extends State<SemuaProdukScreen> {
  Future<void> fetchData() async {
    setState(() {
      ProdukController().getProduk();
    });
  }

  Future<void> onRefresh() async {
    await fetchData();
  }

  TextEditingController search = TextEditingController();
  ProdukController produkController = ProdukController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();

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
                color: textdark,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'di Kategori dan Merek terpilih',
              style: GoogleFonts.montserrat(
                color: textdark,
                fontSize: 12,
              ),
            ),
          ],
        ),
        bottom: AppBar(
          elevation: 1,
          shadowColor: Colors.black45,
          surfaceTintColor: dark,
          backgroundColor: dark,
          automaticallyImplyLeading: false,
          title: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            // width: size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(29),
            ),
            child: TextFormField(
              controller: search,
              decoration: InputDecoration(
                hintText: 'Cari barang dan jasa',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: dark,
                ),
                prefixIcon: Icon(Icons.search, color: dark),
                suffix: SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Get.to(SearchProduk(search: search.text));
                    },
                    child: const Text(
                      'Cari',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        backgroundColor: dark,
        child: Container(
          color: dark2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const FilterSemuaProduk(),
                const SizedBox(height: 10),
                FutureBuilder<List<dynamic>>(
                  future: ProdukController().getProduk(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 160,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(primary),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0,
                              childAspectRatio: 0.70,
                            ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardSemuaProduk(produk: snapshot.data![index]);
                        },
                      );
                    }
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
