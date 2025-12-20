import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/checkout_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/pesanan_screen/detail_pesanan_screen/alamat_pengiriman.dart';
import 'package:mobile_balanja_id/balanja_app/views/pesanan_screen/detail_pesanan_screen/item_produk.dart';
import 'package:mobile_balanja_id/balanja_app/views/pesanan_screen/detail_pesanan_screen/nomimal_pembayaran_detail_screen.dart';

class DetailPesananScreen extends StatelessWidget {
  final int? idTransaksi;
  DetailPesananScreen({Key? key, required this.idTransaksi}) : super(key: key);
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
          'Detail Pesanan',
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
      ),
      body: ListView(
        children: [
          // FutureBuilder<Checkout>(
          //   future: transaksiService.getDetailTransaksi(idTransaksi!),
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
          //             Container(
          //               color: myObject.status == 'diproses'
          //                   ? warning
          //                   : myObject.status == 'dikirim'
          //                   ? info
          //                   : myObject.status == 'diterima'
          //                   ? success
          //                   : Colors.grey,
          //               padding: const EdgeInsetsDirectional.all(15),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Text(
          //                     'Pesanan anda ${myObject.status}',
          //                     style: const TextStyle(color: Colors.white),
          //                   ),
          //                   const Icon(Icons.check_circle, color: Colors.white),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 10),
          //             AlamatPengirimanDetailPesanan(checkout: myObject),
          //             Container(color: Colors.grey[200], height: 7),
          //             ItemProdukDetailPesanan(transaksi: myObject),
          //             NominalPembayaranDetailPesanan(transaksi: myObject),
          //             const SizedBox(height: 15),
          //             Container(color: Colors.grey[200], height: 7),
          //             const ListTile(
          //               title: Text(
          //                 'Metode Pembayaran',
          //                 style: TextStyle(color: Colors.black87, fontSize: 15),
          //               ),
          //               subtitle: Text(
          //                 'Transfer Bank Manual',
          //                 style: TextStyle(color: Colors.black45, fontSize: 13),
          //               ),
          //             ),
          //             const SizedBox(height: 8),
          //             Container(color: Colors.grey[200], height: 7),
          //             Padding(
          //               padding: const EdgeInsets.all(11),
          //               child: Column(
          //                 children: [
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       const Text(
          //                         'No Invoice',
          //                         style: TextStyle(
          //                           color: Colors.black87,
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       Row(
          //                         children: [
          //                           Text(
          //                             '${myObject.noInvoice}',
          //                             style: const TextStyle(
          //                               color: Colors.black87,
          //                               fontSize: 15,
          //                             ),
          //                           ),
          //                           TextButton(
          //                             onPressed: () {
          //                               copyToClipboard(
          //                                 context,
          //                                 myObject.noInvoice!,
          //                               );
          //                             },
          //                             child: Text(
          //                               'SALIN',
          //                               style: GoogleFonts.montserrat(
          //                                 fontWeight: FontWeight.w700,
          //                                 fontSize: 13,
          //                               ),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     children: [
          //                       const Text(
          //                         'Waktu Pemesanan',
          //                         style: TextStyle(
          //                           color: Colors.black54,
          //                           fontSize: 14,
          //                         ),
          //                       ),
          //                       Text(
          //                         myObject.waktuTransaksi!,
          //                         style: GoogleFonts.montserrat(
          //                           color: Colors.black54,
          //                           fontSize: 14,
          //                         ),
          //                       ),
          //                     ],
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
