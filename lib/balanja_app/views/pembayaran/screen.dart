import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/utils/value_formatter.dart';
import 'package:mobile_balanja_id/balanja_app/views/main_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/screen_old.dart';

class PembayaranScreen extends StatelessWidget {
  final int? idTransakti;
  final String? noInvoice;
  final String? status;
  const PembayaranScreen({
    required this.idTransakti,
    super.key,
    this.noInvoice,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text('Pembayaran', style: GoogleFonts.montserrat()),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Batas Akhir Pembayaran'),
            const SizedBox(height: 5),
            CountDownWidget(expireTime: '2025-12-14 16:02:22'),
            const SizedBox(height: 20),
            // ItemProduk(transaksi: myObject),
            // Container(
            //   color: Colors.grey[200],
            //   height: 10,
            // ),
            Container(
              color: dark,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BCA (Transfer Manual)',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Bank_Central_Asia.svg/2560px-Bank_Central_Asia.svg.png',
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey[200]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No Invoice',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '$noInvoice',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            copyToClipboard(context, noInvoice!);
                          },
                          child: Row(
                            children: [
                              Text(
                                'Salin',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Icons.copy, size: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total Pembayaran',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              toCurrency(0),
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                copyToClipboard(context, toCurrency(0));
                              },
                              icon: Icon(color: primary, Icons.copy, size: 15),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'Lihat Detail',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pesananmu baru diteruskan ke penjual setelah pembayaran terverifikasi',
                    style: GoogleFonts.montserrat(color: Colors.grey[500]),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(MainScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(width: 1.2, color: primary),
                        ),
                      ),
                      child: Text(
                        'Belanja Lagi',
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(const MainScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(width: 1.2, color: primary),
                        ),
                      ),
                      child: Text(
                        'Lihat Pesanan Saya',
                        style: GoogleFonts.montserrat(
                          color: primary,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
