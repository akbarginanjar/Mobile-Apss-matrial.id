import 'package:mobile_balanja_id/balanja_app/global_resource.dart'; 
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_jasa_controller.dart'; 

import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/tab_views/pending_tabview.dart'; 
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/tab_views/diproses_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/tab_views/diperjalanan_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/tab_views/ditujuan_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/tab_views/selesai_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_jasa/tab_views/dibatalkan_tabview.dart'; 

class TransaksiJasaScreen extends StatelessWidget {
  TransaksiJasaScreen({super.key});
  
  final TransaksiJasaController controller = Get.put(TransaksiJasaController()); 

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pesanan Kamu',
            style: TextStyle(color: textdark),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: primary),
          backgroundColor: dark,
          surfaceTintColor: dark,
          shape: Border(bottom: BorderSide(color: textdark)), 
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: primary,
            labelColor: primary,
            unselectedLabelColor: textdark,
            labelStyle: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: primary, fontWeight: FontWeight.bold),
            automaticIndicatorColorAdjustment: true,
            tabs: const [
              Tab(text: 'Pending'),
              Tab(text: 'Diproses'),
              Tab(text: 'Diperjalanan'),
              Tab(text: 'Ditujuan'),
              Tab(text: 'Selesai'),
              Tab(text: 'Dibatalkan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PendingTabView(), 
            DiprosesTabView(),
            DiperjalananTabView(),
            DitujuanTabView(),
            SelesaiTabView(),
            DibatalkanTabView(), 
          ],
        ),
      ),
    );
  }
}