import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/card_semua_produk.dart';

// ignore: must_be_immutable
class SearchProduk extends StatefulWidget {
  String? search;

  SearchProduk({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchProduk> createState() => _SearchProdukState();
}

class _SearchProdukState extends State<SearchProduk> {
  Future<void> fetchData() async {
    setState(() {
      ProdukController().searchProduk(widget.search!);
    });
  }

  Future<void> onRefresh() async {
    await fetchData();
  }

  void changeData(String newData) {
    setState(() {
      widget.search = newData;
    });
  }

  TextEditingController search2 = TextEditingController();
  ProdukController produkController = ProdukController();

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black45,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          // width: size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(29),
          ),
          child: Form(
            key: form,
            child: TextFormField(
              controller: search2,
              decoration: InputDecoration(
                hintText: 'Cari barang dan jasa',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.grey,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                suffix: SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      elevation: 0,
                    ),
                    onPressed: () {
                      changeData(search2.text);
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
        backgroundColor: Colors.white,
        child: Container(
          color: const Color.fromARGB(96, 245, 245, 245),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Barang yang dicari : '),
                    Text(
                      '${search2.text == '' ? widget.search : search2.text}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                FutureBuilder<List<dynamic>>(
                  future: ProdukController().searchProduk(widget.search!),
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
                              childAspectRatio: 0.73,
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
