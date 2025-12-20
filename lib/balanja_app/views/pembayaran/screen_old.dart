import 'dart:io';

import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/checkout_model.dart';

class KonfirmasiPembayaranScreen extends StatefulWidget {
  final int? idTransaksi;
  const KonfirmasiPembayaranScreen({Key? key, required this.idTransaksi})
    : super(key: key);

  @override
  State<KonfirmasiPembayaranScreen> createState() =>
      _KonfirmasiPembayaranScreenState();
}

class _KonfirmasiPembayaranScreenState
    extends State<KonfirmasiPembayaranScreen> {
  File? _imagePath;
  String? _imageName;

  Future<void> _getImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _imagePath = File(pickedImage.path);
        _imageName = pickedImage.name;
      });
    }
  }

  final TransaksiService transaksiService = TransaksiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Pembayaran',
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
      ),
      body: ListView(
        children: [
          // FutureBuilder<Checkout>(
          //   future: transaksiService.getKonfirmasiPembayaran(
          //     widget.idTransaksi!,
          //   ),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const SizedBox(
          //         height: 600,
          //         child: Center(child: CircularProgressIndicator()),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('Error: ${snapshot.error}');
          //     } else {
          //       final myObject = snapshot.data!;
          //       return SingleChildScrollView(
          //         child: Column(
          //           children: [
          //             const SizedBox(height: 20),
          //             const Text('Batas Akhir Pembayaran'),
          //             const SizedBox(height: 5),
          //             CountDownWidget(expireTime: myObject.expireTime),
          //             const SizedBox(height: 20),
          //             Container(color: Colors.grey[200], height: 10),
          //             // ItemProduk(transaksi: myObject),
          //             // Container(
          //             //   color: Colors.grey[200],
          //             //   height: 10,
          //             // ),
          //             Padding(
          //               padding: const EdgeInsets.symmetric(
          //                 horizontal: 15,
          //                 vertical: 5,
          //               ),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Text(
          //                         'BCA (Transfer Manual)',
          //                         style: GoogleFonts.montserrat(
          //                           fontWeight: FontWeight.w700,
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: 40,
          //                         width: 40,
          //                         child: Image.network(
          //                           'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Bank_Central_Asia.svg/2560px-Bank_Central_Asia.svg.png',
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Divider(color: Colors.grey[200]),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           Text(
          //                             'No Invoice',
          //                             style: GoogleFonts.montserrat(
          //                               fontWeight: FontWeight.normal,
          //                               color: Colors.grey,
          //                             ),
          //                           ),
          //                           Text(
          //                             '${myObject.noInvoice}',
          //                             style: GoogleFonts.montserrat(
          //                               fontWeight: FontWeight.w700,
          //                               fontSize: 16,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                       TextButton(
          //                         onPressed: () {
          //                           copyToClipboard(
          //                             context,
          //                             myObject.noInvoice!,
          //                           );
          //                         },
          //                         child: Row(
          //                           children: [
          //                             Text(
          //                               'Salin',
          //                               style: GoogleFonts.montserrat(
          //                                 fontWeight: FontWeight.w700,
          //                                 fontSize: 13,
          //                               ),
          //                             ),
          //                             const SizedBox(width: 5),
          //                             const Icon(Icons.copy, size: 15),
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   const SizedBox(height: 10),
          //                   Text(
          //                     'Total Pembayaran',
          //                     style: GoogleFonts.montserrat(
          //                       fontWeight: FontWeight.normal,
          //                       color: Colors.grey,
          //                     ),
          //                   ),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Text(
          //                             toCurrency(myObject.totalBayar!),
          //                             style: GoogleFonts.montserrat(
          //                               fontWeight: FontWeight.w700,
          //                               fontSize: 17,
          //                             ),
          //                           ),
          //                           IconButton(
          //                             onPressed: () {
          //                               copyToClipboard(
          //                                 context,
          //                                 toCurrency(myObject.totalBayar!),
          //                               );
          //                             },
          //                             icon: Icon(
          //                               color: primary,
          //                               Icons.copy,
          //                               size: 15,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                       TextButton(
          //                         onPressed: () {
          //                           dialogLihatDetail(
          //                             myObject.item![0].harga!,
          //                             myObject.item![0].totalHarga!,
          //                             1000,
          //                             myObject.ongkir!,
          //                             myObject.totalBayar!,
          //                             myObject.item![0].qty!,
          //                           );
          //                         },
          //                         child: Row(
          //                           children: [
          //                             Text(
          //                               'Lihat Detail',
          //                               style: GoogleFonts.montserrat(
          //                                 fontWeight: FontWeight.w700,
          //                                 fontSize: 13,
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   const SizedBox(height: 20),
          //                   SizedBox(
          //                     height: 35,
          //                     child: ElevatedButton(
          //                       style: ElevatedButton.styleFrom(
          //                         backgroundColor: const Color.fromARGB(
          //                           255,
          //                           231,
          //                           244,
          //                           255,
          //                         ),
          //                         elevation: 0,
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(20),
          //                           side: BorderSide(
          //                             width: 1.2,
          //                             color: primary,
          //                           ),
          //                         ),
          //                       ),
          //                       onPressed: _getImage,
          //                       child: Text(
          //                         'Upload Bukti Transfer',
          //                         style: GoogleFonts.montserrat(color: primary),
          //                       ),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 12),
          //                   Card(
          //                     elevation: 10,
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius: BorderRadius.circular(15),
          //                     ),
          //                     child: ClipRRect(
          //                       borderRadius: BorderRadius.circular(15),
          //                       child: ImagePreview(imageFile: _imagePath),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 12),
          //                   _imagePath != null
          //                       ? SizedBox(
          //                           height: 45,
          //                           width: double.infinity,
          //                           child: ElevatedButton(
          //                             onPressed: () {},
          //                             style: ElevatedButton.styleFrom(
          //                               backgroundColor: const Color.fromARGB(
          //                                 255,
          //                                 91,
          //                                 192,
          //                                 51,
          //                               ),
          //                               elevation: 0,
          //                               shape: RoundedRectangleBorder(
          //                                 borderRadius: BorderRadius.circular(
          //                                   20,
          //                                 ),
          //                                 side: const BorderSide(
          //                                   width: 1.2,
          //                                   color: Color.fromARGB(
          //                                     255,
          //                                     91,
          //                                     192,
          //                                     51,
          //                                   ),
          //                                 ),
          //                               ),
          //                             ),
          //                             child: Text(
          //                               'Kirim Bukti Bayar',
          //                               style: GoogleFonts.montserrat(
          //                                 color: Colors.white,
          //                                 fontSize: 15,
          //                               ),
          //                             ),
          //                           ),
          //                         )
          //                       : const SizedBox(),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 20),
          //             Container(color: Colors.grey[200], height: 10),
          //             Padding(
          //               padding: const EdgeInsets.all(15),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     'Pesananmu baru diteruskan ke penjual setelah pembayaran terverifikasi',
          //                     style: GoogleFonts.montserrat(
          //                       color: Colors.grey[500],
          //                     ),
          //                   ),
          //                   const SizedBox(height: 20),
          //                   SizedBox(
          //                     height: 45,
          //                     width: double.infinity,
          //                     child: ElevatedButton(
          //                       onPressed: () {},
          //                       style: ElevatedButton.styleFrom(
          //                         backgroundColor: primary,
          //                         elevation: 0,
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(20),
          //                           side: BorderSide(
          //                             width: 1.2,
          //                             color: primary,
          //                           ),
          //                         ),
          //                       ),
          //                       child: Text(
          //                         'Belanja Lagi',
          //                         style: GoogleFonts.montserrat(
          //                           color: Colors.white,
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 8),
          //                   SizedBox(
          //                     height: 45,
          //                     width: double.infinity,
          //                     child: ElevatedButton(
          //                       onPressed: () {
          //                         Get.offAll(const MainScreen());
          //                       },
          //                       style: ElevatedButton.styleFrom(
          //                         backgroundColor: Colors.white,
          //                         elevation: 0,
          //                         shape: RoundedRectangleBorder(
          //                           borderRadius: BorderRadius.circular(20),
          //                           side: BorderSide(
          //                             width: 1.2,
          //                             color: primary,
          //                           ),
          //                         ),
          //                       ),
          //                       child: Text(
          //                         'Cek Pesanan Saya',
          //                         style: GoogleFonts.montserrat(
          //                           color: primary,
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}

dialogLihatDetail(
  int totalHarga,
  int totalTagihan,
  int biayaLayanan,
  int biayaPengiriman,
  int totalBayar,
  int qty,
) {
  Get.bottomSheet(
    SizedBox(
      height: 300,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                'Detail Pembayaran',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga Barang x$qty',
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    toCurrency(totalHarga),
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                ],
              ),
              Divider(color: Colors.grey[300]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Tagihan',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    toCurrency(totalTagihan),
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Biaya Transaksi',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Biaya Pengiriman',
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                  Text(
                    toCurrency(biayaPengiriman),
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Biaya Layanan',
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                  Text(
                    toCurrency(biayaLayanan),
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey[300]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Bayar',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    toCurrency(totalBayar),
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      color: primary,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
