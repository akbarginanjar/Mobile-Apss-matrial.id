import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_produk/screen.dart';

class PilihTransaksiScreen extends StatelessWidget {
  const PilihTransaksiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pilih Pesanan Anda',
          style: TextStyle(color: textdark),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: primary),
        backgroundColor: dark,
        surfaceTintColor: dark,
        shape: Border(bottom: BorderSide(color: textdark)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTransactionButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Transaksi Produk',
              onTap: () {
                Get.to(() => TransaksiProdukScreen());
              },
            ),
            const SizedBox(height: 10),
            _buildTransactionButton(
              icon: Icons.handshake_outlined,
              text: 'Transaksi Jasa',
              onTap: () {
                Get.to(() => const PesananScreen());
              },
            ),
            const SizedBox(height: 10),
            _buildTransactionButton(
              icon: Icons.school_outlined,
              text: 'Transaksi Pelatihan',
              onTap: () {
                Get.to(() => const PesananScreen());
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Card(
      color: dark,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Icon(icon, color: primary, size: 28),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textdark,
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: primary, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}