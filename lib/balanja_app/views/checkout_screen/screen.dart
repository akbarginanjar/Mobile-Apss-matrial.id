import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/services/checkout_service.dart';
import 'package:mobile_balanja_id/balanja_app/views/checkout_screen/ganti_kurir.dart';
import 'package:mobile_balanja_id/balanja_app/views/checkout_screen/ganti_pengiriman.dart';

class CheckoutScreen extends StatefulWidget {
  final VarianBarang? varian;
  const CheckoutScreen({super.key, required this.varian});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final CheckoutController checkoutController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    // checkoutController.loadAlamatToko(1);
    checkoutController.loadAlamatToko(widget.varian!.memberId.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark2,
        surfaceTintColor: dark2,
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text('Checkout', style: GoogleFonts.montserrat(color: textdark)),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Obx(() {
        if (checkoutController.isLoadingAlamatToko.value) {
          return Center(child: CircularProgressIndicator());
        }

        final a = checkoutController.alamatToko;

        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (a == null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.red[800]!),
                          ),
                          margin: EdgeInsets.all(0),
                          color: dark2,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                "Toko tidak memiliki alamat",
                                style: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const AlamatPengiriman(),
                  KetProduk(varian: widget.varian),
                  const GantiPengiriman(),
                  const GantiKurir(),
                  const MetodePembayaran(),
                  RincianPembayaran(varian: widget.varian),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 11.2,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: dark2,
                  border: Border(
                    top: BorderSide(color: Colors.grey[800]!, width: 1.5),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: GetBuilder<CheckoutController>(
                        init: CheckoutController(),
                        builder: (c) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total'),
                              Obx(
                                () => Text(
                                  // ignore: unrelated_type_equality_checks
                                  c.totalBayar == 0
                                      ? toCurrency(
                                          widget.varian!.harga! + 6000 + 1000,
                                        )
                                      : toCurrency(c.totalBayar.toInt()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: primary,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    GetBuilder<CheckoutController>(
                      init: CheckoutController(),
                      builder: (c) {
                        return Flexible(
                          flex: 2,
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
                            onPressed: () {
                              if (c.paymentCode == null) {
                                EasyLoading.showToast(
                                  'Pilih Alamat Pengiriman',
                                );
                              } else if (c.selectKurir == null) {
                                EasyLoading.showToast('Pilih Opsi Pengiriman');
                              } else if (c.selectAlamat == null) {
                                EasyLoading.showToast(
                                  'Pilih Metode Pembayaran',
                                );
                              } else {
                                int totalBayarApi;
                                if (c.totalBayarCheckout.toInt() == 0) {
                                  totalBayarApi = widget.varian!.harga! + 1000;
                                } else {
                                  totalBayarApi = c.totalBayarCheckout.toInt();
                                }

                                CheckoutService().checkout(
                                  memberId: GetStorage().read('member_id'),
                                  nama: GetStorage()
                                      .read('nama_lengkap')
                                      .toString(),
                                  email: GetStorage().read('email').toString(),
                                  noHp: GetStorage().read('no_hp').toString(),
                                  totalBayar: totalBayarApi,
                                  ongkir: 6000,
                                  penyimpananId: widget.varian!.id!,
                                  qty: c.quantity.toInt(),
                                  hargaSatuan: widget.varian!.harga!,
                                  idProvinsi: c.idProvinsi!,
                                  idKabKot: c.idKabKot!,
                                  idKecamatan: c.idKecamatan!,
                                  idKelurahan: c.idKelurahan!,
                                  alamat: c.alamat!,
                                  code: 2,
                                );
                              }
                            },
                            child: Text(
                              'Checkout',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.apply(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
