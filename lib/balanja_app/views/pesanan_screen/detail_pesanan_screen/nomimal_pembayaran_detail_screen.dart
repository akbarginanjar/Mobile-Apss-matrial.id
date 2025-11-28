import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/checkout_model.dart';

class NominalPembayaranDetailPesanan extends StatelessWidget {
  final Checkout? transaksi;
  const NominalPembayaranDetailPesanan({Key? key, required this.transaksi})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal Produk',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
              Text(
                toCurrency(transaksi!.item![0].harga!),
                style: const TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal Pengiriman',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
              Text(
                toCurrency(transaksi!.ongkir!),
                style: const TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Biaya Layanan',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
              Text(
                toCurrency(1000),
                style: const TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Pesanan',
                style: TextStyle(color: Colors.black87, fontSize: 14),
              ),
              Text(
                toCurrency(transaksi!.totalBayar!),
                style: const TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
