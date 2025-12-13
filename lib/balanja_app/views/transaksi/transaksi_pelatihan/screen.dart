import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/controllers/transaksi_pelatihan_controller.dart';

import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_pelatihan/tab_views/pending_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_pelatihan/tab_views/selesai_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_pelatihan/tab_views/expired_tabview.dart';
import 'package:mobile_balanja_id/balanja_app/views/transaksi/transaksi_pelatihan/tab_views/dibatalkan_tabview.dart';

class TransaksiPelatihanScreen extends StatelessWidget {
  TransaksiPelatihanScreen({super.key});

  final TransaksiPelatihanController controller = Get.put(TransaksiPelatihanController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Transaksi Pelatihan',
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
              Tab(text: 'Selesai'),
              Tab(text: 'Expired'),
              Tab(text: 'Dibatalkan'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PendingTabView(),
            SelesaiTabView(),
            ExpiredTabView(),
            DibatalkanTabView(),
          ],
        ),
      ),
    );
  }
}