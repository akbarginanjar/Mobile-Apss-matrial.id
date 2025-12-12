import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/alamat_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/ganti_alamat_controller.dart';
import 'package:mobile_balanja_id/expreship_app/helpers/constant.dart'
    hide primary;
import '../widgets/batas_akhir.dart';
import 'alamat_card.dart';

class GantiAlamatScreen extends StatefulWidget {
  const GantiAlamatScreen({super.key});

  @override
  State<GantiAlamatScreen> createState() => _GantiAlamatScreenState();
}

class _GantiAlamatScreenState extends State<GantiAlamatScreen> {
  final CheckoutController controller = Get.put(CheckoutController());
  Future<void> fetchData() async {
    setState(() {
      GantiAlamatController().getAlamat(GetStorage().read('member_id'));
    });
  }

  Future<void> onRefresh() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Alamat Tujuan', style: GoogleFonts.montserrat()),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () async {
                final result = await Get.to(() => AlamatScreen());
                if (result == 'success') {
                  onRefresh();
                }
              },
              child: Text(
                '+ Tambah Baru',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: GetBuilder<GantiAlamatController>(
          init: GantiAlamatController(),
          builder: (c) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<List<dynamic>>(
                        future: GantiAlamatController().getAlamat(
                          GetStorage().read('member_id'),
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(
                              height: 160,
                              child: LoadingProses(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length + 1,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final int idx = index + 1;
                                return idx != (snapshot.data!.length + 1)
                                    ? AlamatCard(
                                        alamat: snapshot.data![index].alamat,
                                        name: snapshot.data![index].namaKontak,
                                        noTelp:
                                            snapshot.data![index].nomorKontak,
                                        labelAlamat:
                                            snapshot.data![index].labelAlamat,
                                        latitude:
                                            snapshot.data![index].latitude ??
                                            '',
                                        longitude:
                                            snapshot.data![index].longitude ??
                                            '',
                                        postalCode:
                                            snapshot.data![index].postalCode ??
                                            '',
                                        idProvinsi:
                                            snapshot.data![index].provinsi.id,
                                        idKabKot:
                                            snapshot.data![index].kabKota.id,
                                        idKecamatan:
                                            snapshot.data![index].kecamatan.id,
                                        idKelurahan:
                                            snapshot.data![index].desa.id,
                                        value: index,
                                        idAlamat: snapshot.data![index].id,
                                      )
                                    : const BatasAkhir(customName: 'alamat');
                              },
                            );
                          }
                        },
                      ),
                      SizedBox(height: c.select != null ? 60 : 0),
                    ],
                  ),
                ),
                c.select != null
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey[200]!,
                                width: 1.5,
                              ),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Konfirmasi',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.apply(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
