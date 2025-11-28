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
                        hintText: 'Cari barang dan jasa',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: textdark,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10
                        ),
                        // prefixIcon: Icon(Icons.search, color: dark),
                        // suffix: SizedBox(
                        //   height: 28,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: primary,
                        //       elevation: 0,
                        //     ),
                        //     onPressed: () {
                        //       Get.to(SearchProduk(search: search.text));
                        //     },
                        //     child: const Text(
                        //       'Cari',
                        //       style: TextStyle(color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: textdark,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: textdark,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)
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
                        bottomRight: Radius.circular(15)
                      )
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search, color: dark, size: 24,), 
                      onPressed: () {
                        Get.to(SearchProduk(search: search.text));
                      }
                    ),
                  )
                ],
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
