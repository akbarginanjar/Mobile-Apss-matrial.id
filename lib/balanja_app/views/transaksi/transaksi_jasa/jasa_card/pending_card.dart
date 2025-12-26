import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';

class PendingCard extends StatelessWidget {
  final Transaksi transaksi;

  const PendingCard({super.key, required this.transaksi});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: dark,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pending (Belum Lunas)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primary,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              transaksi.noInvoice ?? "-",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textdark,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal Transaksi",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: textdark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        transaksi.waktuTransaksi ?? "-",
                        style: TextStyle(color: textdark),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Nominal",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: textdark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        toCurrency(toInt(transaksi.totalBayar)),
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
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