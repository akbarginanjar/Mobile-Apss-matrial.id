import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/tracking_web_controller.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/utils/value_formatter.dart';
import 'package:mobile_balanja_id/balanja_app/views/main_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/komplain_screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/pembayaran_skeleton.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/screen_old.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/tracking_web_screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/ulasan_screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/widgets/button.dart';

class PembayaranScreen extends StatelessWidget {
  final int? idTransakti;
  final String? noInvoice;
  final String? status;
  const PembayaranScreen({
    required this.idTransakti,
    super.key,
    required this.noInvoice,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    final TransaksiController controller = Get.put(TransaksiController());
    controller.getInvoice(noInvoice);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark2,
        centerTitle: true,
        title: Text('Detail Transaksi', style: GoogleFonts.montserrat()),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.getInvoice(noInvoice);
            },
            icon: Icon(Icons.refresh),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Obx(() {
        // TAMPILAN LOADING
        if (controller.isLoading.value) {
          return PembayaranSkeleton();
        }

        // TAMPILAN ERROR & TOMBOL MUAT ULANG
        if (controller.isError.value || controller.invoiceData.value == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Gagal memuat detail invoice'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => controller.getInvoice(noInvoice),
                  child: const Text('Muat Ulang'),
                ),
              ],
            ),
          );
        }

        // ALIAS UNTUK MEMUDAHKAN PEMANGGILAN DATA
        final data = controller.invoiceData.value!;

        return SingleChildScrollView(
          child: Column(
            children: [
              if (data['status_bayar'] == 'belum_lunas')
                if (data['status'] != 'dibatalkan')
                  Container(
                    color: dark,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Batas waktu bayar',
                          style: TextStyle(color: textTheme),
                        ),
                        const SizedBox(height: 5),
                        CountDownWidget(expireTime: data['expire_time'] ?? ''),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
              const SizedBox(height: 10),
              if (data['status_bayar'] == 'belum_lunas')
                if (data['payment_info'] != null &&
                    data['metode_bayar'] == 'payment_gateway' &&
                    data['payment_info']['payment_type'] == 'qris' &&
                    data['status'] != 'dibatalkan')
                  Container(
                    color: dark,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'QRIS',
                            style: GoogleFonts.montserrat(
                              color: textTheme,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Silahkan scan QR Code (QRIS) berikut',
                            style: GoogleFonts.montserrat(),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                '${data['payment_info']['payment_detail']['qris_url']}',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (data['payment_info'] != null &&
                    data['metode_bayar'] == 'payment_gateway' &&
                    data['payment_info']['payment_type'] == 'bank_transfer' &&
                    data['status'] != 'dibatalkan')
                  Container(
                    color: dark,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Virtual Account',
                            style: GoogleFonts.montserrat(
                              color: textTheme,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Silahkan transfer ke Virtual Account berikut',
                            style: GoogleFonts.montserrat(),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            leading: Text(
                              '${data['payment_info']?['payment_code']?.toUpperCase() ?? '-'}',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                color: textTheme,
                              ),
                            ),
                            title: Text(
                              '${data['payment_info']?['payment_detail']?['va_numbers']?[0]?['va_number'] ?? '-'}',
                              style: TextStyle(color: primary),
                            ),
                            trailing: OutlinedButton(
                              onPressed: () {
                                copyToClipboard(
                                  context,
                                  data['payment_info']?['payment_detail']?['va_numbers']?[0]?['va_number'] ??
                                      '-',
                                );
                              },
                              child: Text(
                                'SALIN',
                                style: GoogleFonts.montserrat(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else if (data['payment_info'] != null &&
                        data['metode_bayar'] == 'manual_transfer' ||
                    data['payment_info'] == null &&
                        data['status'] != 'dibatalkan')
                  Container(
                    color: dark,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manual Transfer',
                            style: GoogleFonts.montserrat(
                              color: textTheme,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Transfer sebelum batas waktu habis',
                            style: GoogleFonts.montserrat(),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.all(0),
                            // leading: Image.network(
                            //   '${data['kode_bayar_detail']['image_url']}',
                            // ),
                            leading: Text(
                              '${data['kode_bayar_detail']?['nama']?.toUpperCase() ?? '-'}',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                color: textTheme,
                                fontSize: 18,
                              ),
                            ),
                            title: Text(
                              '${data['kode_bayar_detail']?['no_rekening'] ?? '-'}',
                              style: TextStyle(),
                            ),
                            subtitle: Text(
                              '${data['kode_bayar_detail']?['deskripsi'] ?? '-'}',
                              style: GoogleFonts.montserrat(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            trailing: OutlinedButton(
                              onPressed: () {
                                copyToClipboard(
                                  context,
                                  data['kode_bayar_detail']?['no_rekening'] ??
                                      '-',
                                );
                              },
                              child: Text(
                                'SALIN',
                                style: GoogleFonts.montserrat(),
                              ),
                            ),
                          ),
                          Obx(() {
                            if (controller.selectedImage.value != null) {
                              return Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: InkWell(
                                      onTap: () {
                                        Get.dialog(
                                          Dialog(
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.black,
                                            child: Stack(
                                              children: [
                                                // Gambar fullscreen
                                                Center(
                                                  child: InteractiveViewer(
                                                    child: Image.file(
                                                      controller
                                                          .selectedImage
                                                          .value!,
                                                      width: double.infinity,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),

                                                // Tombol Close
                                                Positioned(
                                                  top: 40,
                                                  right: 20,
                                                  child: InkWell(
                                                    onTap: () => Get.back(),
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            8,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.6),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },

                                      child: Image.file(
                                        controller.selectedImage.value!,
                                        width: double.infinity,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                ],
                              );
                            }

                            return SizedBox.shrink();
                          }),

                          if (data['bukti_tf'] != null)
                            TextButton(
                              onPressed: () {
                                Get.dialog(
                                  Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.black,
                                    child: Stack(
                                      children: [
                                        // Gambar fullscreen
                                        Center(
                                          child: InteractiveViewer(
                                            child: Image.network(
                                              '${Base.url}${data['bukti_tf']['file']}',
                                              width: double.infinity,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),

                                        // Tombol Close
                                        Positioned(
                                          top: 40,
                                          right: 20,
                                          child: InkWell(
                                            onTap: () => Get.back(),
                                            child: Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(
                                                  0.6,
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              child: Text('Lihat Bukti Bayar'),
                            ),
                          if (data['bukti_tf'] != null) SizedBox(height: 10),

                          DefaultButtonOutline(
                            text: 'Pilih Foto',
                            press: () {
                              controller.pickImage();
                            },
                          ),
                          SizedBox(height: 8),

                          DefaultButton(
                            text: 'Saya Sudah Transfer',
                            press: () {
                              if (controller.selectedImage.value == null) {
                                EasyLoading.showToast(
                                  'Pilih foto terlebih dahulu',
                                );
                              } else {
                                Get.defaultDialog(
                                  title: 'Konfirmasi',
                                  middleText: 'Anda yakin sudah transfer?',
                                  textCancel: 'Batal',
                                  textConfirm: 'Ya',
                                  confirmTextColor: textTheme,
                                  onConfirm: () async {
                                    Get.back(); // tutup dialog

                                    EasyLoading.show(
                                      status: 'Mengirim bukti pembayaran...',
                                      maskType: EasyLoadingMaskType.black,
                                    );

                                    try {
                                      final response = await controller
                                          .uploadBuktiBayar(
                                            noInvoice: data['no_invoice']
                                                .toString(),
                                            rekeningId:
                                                data['kode_bayar_detail']?['id'],
                                            file: controller
                                                .selectedImage
                                                .value!, // dari file_picker
                                          );

                                      EasyLoading.dismiss();
                                      if (response.statusCode == 200) {
                                        EasyLoading.showSuccess('Berhasil');
                                        controller.getInvoice(noInvoice);
                                        controller.clearImage();
                                      } else {
                                        EasyLoading.showError('Gagal');
                                      }
                                    } catch (e) {
                                      EasyLoading.dismiss();
                                      Get.snackbar(
                                        'Error',
                                        e.toString(),
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  },
                                );
                              }
                            },
                            color: primary,
                          ),
                        ],
                      ),
                    ),
                  ),
              if (data['status_bayar'] == 'belum_lunas')
                if (data['status'] != 'dibatalkan')
                  Container(
                    color: Colors.grey[800],
                    height: 1,
                    width: double.infinity,
                  ),
              if (data['status_bayar'] == 'belum_lunas')
                if (data['status'] != 'dibatalkan')
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.getInvoice(noInvoice);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: dark,
                        shape: RoundedRectangleBorder(),
                      ),

                      child: Text(
                        'Cek Status Pembayaran',
                        style: GoogleFonts.montserrat(),
                      ),
                    ),
                  ),
              if (data['status_bayar'] == 'belum_lunas')
                if (data['status'] != 'dibatalkan') SizedBox(height: 10),
              if (data['status'] == 'diproses' &&
                  data['status_bayar'] == 'lunas')
                Container(
                  color: dark,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pembayaran Berhasil',
                          style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 15,
                          ),
                        ),
                        const Text(
                          'Order Anda sedang diproses',
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        SizedBox(height: 10),

                        /// Info Card
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F2125),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Icon kartu
                              Container(
                                width: 40,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.credit_card,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),

                              const SizedBox(width: 12),

                              /// Text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Pembayaran telah kami terima',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'Seller sedang menyiapkan pesanan Anda.\n'
                                      'Mohon menunggu hingga proses selesai.',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        /// Status Button / Indicator
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3A3D42),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Text(
                            'Pesanan sedang diproses oleh seller',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (data['status'] == 'diproses' &&
                  data['status_bayar'] == 'lunas')
                SizedBox(height: 10),
              if (data['process_order_expire_time'] != null &&
                  data['status'] == 'diproses')
                Container(
                  color: dark,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            'Batas Waktu Konfirmasi Pesanan Oleh Seller',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: CountDownProsesOrderWidget(
                            expireTime: data['process_order_expire_time'] ?? '',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (data['process_order_expire_time'] != null &&
                  data['status'] == 'diproses')
                SizedBox(height: 10),
              if (data['status'] == 'dikirim')
                Container(
                  color: dark,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Status Pengiriman',
                              style: TextStyle(
                                color: textTheme,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: shipmentStatusColor(
                                  data['shipment_info']['status'],
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                shipmentStatusLabel(
                                  data['shipment_info']['status'],
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        /// NO RESI
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: dark2,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'No Resi',
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1F2125),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        '${data['shipment_info']['waybill_id']}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        copyToClipboard(
                                          context,
                                          '${data['shipment_info']['waybill_id']}',
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 18,
                                          vertical: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: const Text(
                                          'Salin',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Pengiriman: ${data['shipment_info']['courier_company']} (${data['shipment_info']['courier_type']})',
                                style: TextStyle(fontSize: 13),
                              ),
                              const SizedBox(height: 10),
                              Text('Penerima', style: TextStyle(fontSize: 13)),
                              SizedBox(height: 2),
                              Text(
                                '${data['shipment_info']['destination']['contact_name']}',
                                style: TextStyle(
                                  color: textTheme,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '${data['shipment_info']['destination']['address']}',
                                style: TextStyle(fontSize: 10, height: 1.4),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Telp: ${data['shipment_info']['destination']['contact_phone']}',
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Alamat Toko',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${data['shipment_info']['origin']['address']}',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),

                        DefaultButtonOutline(
                          text: 'Lacak Pengiriman',
                          press: () {
                            Get.to(
                              () => TrackingWebViewScreen(
                                url: data['shipment_info']['tracking_link']
                                    .toString(),
                              ),
                              binding: BindingsBuilder(() {
                                Get.put(TrackingWebController());
                              }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              if (data['status'] == 'dikirim') SizedBox(height: 10),
              if (data['ulasan'].isEmpty && data['status'] == 'selesai')
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: DefaultButtonOutline(
                    text: 'Berikan Penilaian Produk',
                    press: () {
                      Get.bottomSheet(
                        UlasanWidget(
                          idTransaksi: 1,
                          noInvoice: data['no_invoice'],
                          item: data['item'],
                        ),
                        isScrollControlled: true,
                      );
                    },
                  ),
                )
              else if (data['ulasan'].isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: dark,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// ⭐ Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Icon(
                            index < data['ulasan'][0]['rating']
                                ? Icons.star
                                : Icons.star_border_outlined,
                            size: 24,
                            color: Colors.orange,
                          );
                        }),
                      ),

                      const SizedBox(height: 12),

                      /// 💬 Komentar
                      Text(
                        '"${data['ulasan'][0]['komentar']}"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                )
              else
                const SizedBox(),
              Container(
                color: dark,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No Invoice',
                        style: GoogleFonts.montserrat(color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${data['no_invoice']}',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: textTheme,
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                copyToClipboard(context, data['no_invoice']),
                            icon: Icon(Icons.copy, size: 17, color: primary),
                          ),
                        ],
                      ),
                      Text(
                        'Status',
                        style: GoogleFonts.montserrat(color: Colors.grey),
                      ),
                      Text(
                        '${data['status'] ?? '-'}',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: textTheme,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Total Pembayaran',
                        style: GoogleFonts.montserrat(color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            toCurrency(data['total_bayar'] ?? 0),
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                              color: textTheme,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _showDetailBiaya(context, data);
                            },
                            child: Text(
                              'Lihat Detail',
                              style: GoogleFonts.montserrat(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // SECTION 3: INFO PRODUK (Looping dari array 'item')
              Container(
                color: dark,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'INFO PRODUK',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Header Tabel
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            'PRODUK',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'QTY',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'HARGA',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            'TOTAL',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey[800]),
                    // Looping Item
                    ...(data['item'] as List).map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                '${item['barang_nama']}',
                                style: TextStyle(
                                  color: textTheme,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${item['qty']}',
                                style: TextStyle(color: textTheme),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                toCurrency(item['harga'] ?? 0),
                                style: TextStyle(
                                  color: textTheme,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                toCurrency(item['total_harga'] ?? 0),
                                style: TextStyle(
                                  color: textTheme,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),

              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                color: dark,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pengiriman',
                          style: GoogleFonts.montserrat(color: Colors.grey),
                        ),
                        Text(
                          '${data['shipment_option'] ?? '-'}',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: textTheme,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey[800]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kurir',
                          style: GoogleFonts.montserrat(color: Colors.grey),
                        ),
                        Text(
                          '${data['shipment_info']['courier_company'] ?? '-'}',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: textTheme,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // SECTION 2: DITERBITKAN ATAS NAMA (Penjual & Pembeli)
              Container(
                width: double.infinity,
                color: dark,
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DITERBITKAN ATAS NAMA',
                      style: GoogleFonts.montserrat(fontSize: 10),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Penjual: ${data['toko']?['nama_lengkap'] ?? '-'}',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        color: textTheme,
                      ),
                    ),
                    Divider(color: Colors.grey[800], height: 20),

                    Text(
                      'UNTUK',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _rowInfo('Pembeli', data['customer']?['nama']),
                    _rowInfo('Tanggal Pembelian', data['waktu_transaksi']),
                    _rowInfo('No. Telepon', data['customer']?['no_hp']),
                    _rowInfo(
                      'Alamat',
                      "${data['customer']?['data_pengiriman']?['alamat']}, "
                          "${data['customer']?['data_pengiriman']?['desa']?['name']}, "
                          "${data['customer']?['data_pengiriman']?['kecamatan']?['name']}, "
                          "${data['customer']?['data_pengiriman']?['kab_kota']?['name']}, "
                          "${data['customer']?['data_pengiriman']?['provinsi']?['name']}",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              if (data['status'] != 'dibatalkan' &&
                  data['status'] != 'dikirim' &&
                  data['status'] != 'selesai')
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: DefaultButton(
                    text: 'Batalkan Pesanan',
                    press: () {
                      Get.dialog(
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          title: Text(
                            'Batalkan Pesanan',
                            style: GoogleFonts.montserrat(),
                          ),
                          content: const Text(
                            'Apakah kamu yakin ingin membatalkan pesanan ini?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(), // TIDAK
                              child: Text(
                                'Tidak',
                                style: GoogleFonts.montserrat(color: textTheme),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                Get.back(); // ✅ tutup modal dulu
                                await controller.batalkanPesanan(
                                  data['no_invoice'].toString(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: danger,
                              ),
                              child: Text(
                                'Ya, Batalkan',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        barrierDismissible: false,
                      );
                    },
                    color: danger,
                  ),
                ),
              if (data['status'] == 'selesai')
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: DefaultButton(
                    text: 'Komplain',
                    press: () {
                      Get.to(
                        KomplainScreen(
                          idTransaksi: data['id'],
                          noInvoice: data['no_invoice'],
                        ),
                      );
                    },
                    color: danger,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                child: DefaultButton(
                  text: 'Lihat Pesanan Saya',
                  press: () {
                    Get.offAll(MainScreen());
                  },
                  color: primary,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}

Widget _rowInfo(String label, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        const Text(': ', style: TextStyle(color: Colors.grey)),
        Expanded(
          child: Text(
            value ?? '-',
            style: TextStyle(color: textTheme, fontSize: 13),
          ),
        ),
      ],
    ),
  );
}

void _showDetailBiaya(BuildContext context, Map<String, dynamic> data) {
  // Hitung total harga barang dari array item
  int totalHargaBarang = 0;
  if (data['item'] != null) {
    for (var item in data['item']) {
      totalHargaBarang += (item['total_harga'] as num).toInt();
    }
  }

  // Ambil data diskon (jika ada)
  List diskonList = data['diskon'] ?? [];

  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: dark, // Gunakan warna tema Anda
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Text(
              'Rincian Pembayaran',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            _rowBiaya('TOTAL HARGA', toCurrency(totalHargaBarang)),
            _rowBiaya('Ongkos Kirim', toCurrency(data['ongkir'] ?? 0)),
            _rowBiaya('BIAYA LAYANAN', toCurrency(data['biaya_layanan'] ?? 0)),
            _rowBiaya(
              'BIAYA APLIKASI',
              toCurrency(data['biaya_aplikasi'] ?? 0),
            ),
            _rowBiaya('BIAYA TRANSAKSI', toCurrency(data['biaya_pg'] ?? 0)),

            // Tampilkan Diskon jika ada
            ...diskonList.map(
              (d) => _rowBiaya(
                'Diskon (${d['name']})',
                '- ${toCurrency(d['value'] ?? 0)}',
                isDiscount: true,
              ),
            ),

            _rowBiaya('Kode Unik', data['kode_unik']?.toString() ?? '-'),

            const Divider(color: Colors.white24, height: 30),

            _rowBiaya(
              'TOTAL BELANJA',
              toCurrency(data['total_bayar'] ?? 0),
              isBold: true,
            ),
            _rowBiaya(
              'TOTAL TAGIHAN',
              toCurrency(data['total_bayar'] ?? 0),
              isBold: true,
              color: primary,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}

// Helper Widget untuk baris biaya
Widget _rowBiaya(
  String label,
  String value, {
  bool isBold = false,
  bool isDiscount = false,
  Color? color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(color: Colors.grey[400], fontSize: 13),
        ),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isDiscount ? Colors.redAccent : (color ?? Colors.white),
            fontSize: isBold ? 15 : 13,
          ),
        ),
      ],
    ),
  );
}

class CountDownWidget extends StatelessWidget {
  final String? expireTime;
  const CountDownWidget({super.key, required this.expireTime});

  @override
  Widget build(BuildContext context) {
    final TransaksiController transaksiController = Get.put(
      TransaksiController(),
    );
    transaksiController.startCountdown(expireTime!);
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.watch_later,
            color: Color.fromARGB(255, 223, 24, 9),
            size: 22,
          ),
          const SizedBox(width: 5),
          Text(
            transaksiController.countdown.value,
            style: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 223, 24, 9),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class CountDownProsesOrderWidget extends StatelessWidget {
  final String? expireTime;
  const CountDownProsesOrderWidget({super.key, required this.expireTime});

  @override
  Widget build(BuildContext context) {
    final TransaksiController transaksiController = Get.put(
      TransaksiController(),
    );
    transaksiController.startCountdownProsesOrder(expireTime!);
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.watch_later,
            color: Color.fromARGB(255, 223, 24, 9),
            size: 22,
          ),
          const SizedBox(width: 5),
          Text(
            transaksiController.countdownProsesOrder.value,
            style: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 223, 24, 9),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

String shipmentStatusLabel(String status) {
  switch (status) {
    case 'confirmed':
      return 'Terkonfirmasi';
    case 'allocated':
      return 'Teralokasi';
    case 'picking_up':
      return 'Dalam Proses Penjemputan';
    case 'picked':
      return 'Sudah diambil oleh kurir';
    case 'dropping_off':
      return 'Dalam Proses Pengantaran';
    default:
      return status;
  }
}

Color shipmentStatusColor(String status) {
  switch (status) {
    case 'confirmed':
      return const Color(0xFF3BA55D); // hijau
    case 'allocated':
      return Colors.blue;
    case 'picking_up':
      return Colors.orange;
    case 'picked':
      return Colors.green.shade700;
    case 'dropping_off':
      return Colors.deepOrange;
    default:
      return Colors.grey;
  }
}
