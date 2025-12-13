import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/screen_old.dart';

class BelumBayarCard extends StatelessWidget {
  final Transaksi? transaksi;
  const BelumBayarCard({super.key, required this.transaksi});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      margin: const EdgeInsets.only(bottom: 2),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        onTap: () {
          Get.to(KonfirmasiPembayaranScreen(idTransaksi: transaksi!.id));
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Belum Bayar',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.apply(color: primary),
            ),
            const SizedBox(height: 7.0),
            Text(
              transaksi!.noInvoice!,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    'Batas tanggal pembayaran:\n${transaksi!.expireTime}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Nominal',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.apply(color: Colors.black),
                      ),
                      Text(
                        toCurrency(transaksi!.totalBayar!),
                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
