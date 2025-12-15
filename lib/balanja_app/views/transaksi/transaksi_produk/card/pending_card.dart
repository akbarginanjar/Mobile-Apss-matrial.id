import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';

class PendingCard extends StatelessWidget {
  final Transaksi transaksi;

  const PendingCard({super.key, required this.transaksi});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaksi.noInvoice ?? 'No Invoice',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: textdark,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    transaksi.status?.toUpperCase() ?? 'PENDING',
                    style: TextStyle(
                      color: textdark,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              transaksi.nama ?? 'Nama tidak tersedia',
              style: TextStyle(
                fontSize: 13,
                color: textdark,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Total: Rp ${transaksi.totalBayar ?? 0}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: textdark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tanggal: ${transaksi.waktuTransaksi ?? '-'}',
              style: TextStyle(
                fontSize: 12,
                color: textdark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
