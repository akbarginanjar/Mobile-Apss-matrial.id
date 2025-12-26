import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/transaksi_model.dart';

class DitujuanCard extends StatelessWidget {
  final Transaksi transaksi;

  const DitujuanCard({super.key, required this.transaksi});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          transaksi.noInvoice ?? "-",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(transaksi.waktuTransaksi ?? "-"),
        trailing: Text(
          "Rp ${transaksi.totalBayar}",
          style: TextStyle(
            color: primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}