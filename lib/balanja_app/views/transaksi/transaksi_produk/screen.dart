import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_produk_controller.dart';

import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_produk/tab_views/pending_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_produk/tab_views/diproses_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_produk/tab_views/dikirim_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_produk/tab_views/selesai_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_produk/tab_views/dibatalkan_tabview.dart';

class TransaksiProdukScreen extends StatelessWidget {
  TransaksiProdukScreen({super.key});

  final TransaksiProdukController controller = Get.put(
    TransaksiProdukController(),
  );
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transaksi Produk', style: TextStyle(color: textdark)),
          centerTitle: true,
          iconTheme: IconThemeData(color: primary),
          backgroundColor: dark,
          surfaceTintColor: dark,
          shape: Border(bottom: BorderSide(color: dark)),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: primary,
            labelColor: primary,
            unselectedLabelColor: textdark,
            labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: primary,
              fontWeight: FontWeight.bold,
            ),
            automaticIndicatorColorAdjustment: true,
            tabs: const [
              Tab(text: 'Pending'),
              Tab(text: 'Diproses'),
              Tab(text: 'Dikirim'),
              Tab(text: 'Selesai'),
              Tab(text: 'Dibatalkan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PendingTabView(),
            DiprosesTabView(),
            DikirimTabView(),
            SelesaiTabView(),
            DibatalkanTabView(),
          ],
        ),
      ),
    );
  }
}
