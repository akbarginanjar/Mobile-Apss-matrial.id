import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class TokoScreen extends StatelessWidget {
  const TokoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: primary),
        shadowColor: Colors.black45,
        surfaceTintColor: dark,
        backgroundColor: dark,
        title: Text(
          'Pilih Gerai',
          style: GoogleFonts.montserrat(color: textdark, fontSize: 16),
        ),
      ),
      body: RefreshIndicator(
        color: primary,
        backgroundColor: dark2,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          GetToko.to.refreshState();
          GetToko.to.inisialState();
        },
        child: Container(
          color: const Color.fromARGB(8, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    GetStorage().remove('id_toko');
                    loadToko();
                    Get.offAll(const MainScreen());
                  },
                  child: const Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 10,
                    shadowColor: Colors.black38,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          // leading: SizedBox(height: 30, child: Image.network(imageToko)),
                          title: Row(
                            children: [
                              Text(
                                'Tampilkan produk dari semua Gerai',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GetBuilder<GetToko>(
                  init: Get.put(GetToko()),
                  builder: (snapshot) {
                    if (snapshot.state is FilledTokoStates) {
                      FilledTokoStates filled =
                          (snapshot.state as FilledTokoStates);
                      if (filled.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            "Data Tidak Ditemukan!",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filled.data!.length,
                          itemBuilder: (context, index) {
                            return CardToko(
                              id: filled.data![index].id!,
                              imageToko:
                                  'https://qiwari.id/images/logo-qiwari.png',
                              namaToko: filled.data![index].namaCabang
                                  .toString(),
                              jadwalToko: 'Hari ini buka jam 07:00 - 22:00',
                              alamat: filled.data![index].namaTeritori
                                  .toString(),
                            );
                          },
                        );
                      }
                    } else {
                      return SizedBox(
                        height: 600,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(primary),
                          ),
                        ),
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
