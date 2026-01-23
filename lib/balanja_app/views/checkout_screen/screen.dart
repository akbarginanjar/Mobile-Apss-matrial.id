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
    checkoutController.loadAlamatToko(
      widget.varian!.gudang!.memberId.toString(),
    );
    checkoutController.loadTransaksiFee(
      widget.varian!.gudang!.memberId.toString(),
    );
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
                  Obx(
                    () => Card(
                      color: dark,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Donasi: ${toCurrency(checkoutController.transaksiDonasi.value)}",
                            ),

                            Switch(
                              value: checkoutController.isDonasiActive.value,
                              onChanged: checkoutController.toggleDonasi,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
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
                                  toCurrency(
                                    checkoutController.totalBayarCheckout.value,
                                  ),
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
                          child: Obx(() {
                            return SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed:
                                    checkoutController.isLoadingCheckout.value
                                    ? null
                                    : () {
                                        if (c.selectAlamat == null) {
                                          EasyLoading.showToast(
                                            'Pilih Alamat Pengiriman',
                                          );
                                        } else if (c.selectShipment == null) {
                                          EasyLoading.showToast(
                                            'Pilih Opsi Pengiriman',
                                          );
                                        } else if (c.paymentCode == null) {
                                          EasyLoading.showToast(
                                            'Pilih Metode Pembayaran',
                                          );
                                        } else {
                                          final payload = {
                                            "toko_member_id": checkoutController
                                                .alamatToko!['member_id'],
                                            "toko_member_alamat_id":
                                                checkoutController
                                                    .alamatToko!['id'],
                                            "konsumen_member_id": GetStorage()
                                                .read('member_id'),
                                            "konsumen_member_alamat_id":
                                                checkoutController.idAlamat,
                                            "uang_masuk": checkoutController
                                                .totalSemuaProduk
                                                .value,
                                            "ongkir": checkoutController
                                                .courierPrice
                                                .value,
                                            "biaya_layanan": checkoutController
                                                .transaksiBiayaLayanan
                                                .value,
                                            "biaya_aplikasi": checkoutController
                                                .transaksiBiayaAplikasi
                                                .value,
                                            "items": checkoutController
                                                .getSelectedProducts(),
                                            if (checkoutController
                                                    .paymentGroup ==
                                                'Manual Transfer')
                                              "metode_bayar": 'manual_transfer'
                                            else
                                              "metode_bayar": 'payment_gateway',
                                            if (checkoutController
                                                    .paymentGroup ==
                                                'Manual Transfer')
                                              "kode_bayar": checkoutController
                                                  .paymentCode,
                                            if (checkoutController
                                                        .paymentGroup ==
                                                    'Virtual Account' ||
                                                checkoutController
                                                        .paymentGroup ==
                                                    'QRIS')
                                              "payment_code": checkoutController
                                                  .paymentCode,
                                            if (checkoutController
                                                        .paymentGroup ==
                                                    'Virtual Account' ||
                                                checkoutController
                                                        .paymentGroup ==
                                                    'QRIS')
                                              "payment_type": checkoutController
                                                  .paymentType,
                                            "transaction_type": "barang",
                                            "shipment_option": 'dikirim',
                                            if (checkoutController
                                                    .courierServiceCode ==
                                                'instant')
                                              "shipment": {
                                                "mode": "latlong",
                                                "latitude":
                                                    checkoutController
                                                        .latAlamat ??
                                                    '',
                                                "longitude":
                                                    checkoutController
                                                        .longAlamat ??
                                                    '',
                                                "courier_company":
                                                    checkoutController
                                                        .courierCode,
                                                "courier_type":
                                                    checkoutController
                                                        .courierServiceCode,
                                                "order_note": "-",
                                              }
                                            else
                                              "shipment": {
                                                "mode": "postal_code",
                                                "postal_code":
                                                    checkoutController
                                                        .postalCode,
                                                "latitude":
                                                    checkoutController
                                                        .latAlamat ??
                                                    '',
                                                "longitude":
                                                    checkoutController
                                                        .longAlamat ??
                                                    '',
                                                "courier_company":
                                                    checkoutController
                                                        .courierCode,
                                                "courier_type":
                                                    checkoutController
                                                        .courierServiceCode,
                                                "note": "-",
                                              },

                                            // Jika voucher dipilih
                                            if (checkoutController
                                                .selectedVoucherId
                                                .value
                                                .isNotEmpty)
                                              "event_diskon_ids": [
                                                checkoutController
                                                    .selectedVoucherId
                                                    .value,
                                              ],

                                            if (checkoutController
                                                    .isDonasiActive
                                                    .value ==
                                                true)
                                              "donasi": checkoutController
                                                  .transaksiDonasi
                                                  .value,
                                          };
                                          print(payload);
                                          checkoutController.doCheckout(
                                            payload,
                                          );
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      checkoutController.isLoadingCheckout.value
                                      ? Colors.grey[700]
                                      : primary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                child:
                                    checkoutController.isLoadingCheckout.value
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        'Checkout',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .apply(color: Colors.white),
                                      ),
                              ),
                            );
                          }),
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

// {
//     "toko_member_id": 81,
//     "toko_member_alamat_id": 41,
//     "konsumen_member_id": 180,
//     "konsumen_member_alamat_id": 48,
//     "uang_masuk": 86500,
//     "ongkir": 37000,
//     "biaya_layanan": 500,
//     "biaya_aplikasi": 1000,
//     "items": [
//         {
//             "penyimpanan_id": 376,
//             "barang_id": 1977,
//             "qty": 1,
//             "harga": 86500
//         }
//     ],
//     "shipment_option": "dikirim",
//     "metode_bayar": "payment_gateway",
//     "payment_code": "bca",
//     "payment_type": "bank_transfer",
//     "shipment": {
//         "mode": "latlong",
//         "latitude": "-6.963023",
//         "longitude": "107.610483",
//         "courier_company": "gojek",
//         "courier_type": "instant",
//         "order_note": "-"
//     },
//     "transaction_type": "barang",
//     "donasi": 800
// }
