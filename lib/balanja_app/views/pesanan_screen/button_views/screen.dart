import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/pesanan_screen/button_views/tab_views/diproses_tabview.dart';

class PesananScreen extends StatefulWidget {
  const PesananScreen({super.key});

  @override
  State<PesananScreen> createState() => _PesananScreenState();
}

class _PesananScreenState extends State<PesananScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pesanan Kamu',
            // '${GetStorage().read('member_id')}',
            style: TextStyle(color: textdark),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: primary),
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back_ios_new),
          //   onPressed: () {
          //     Get.offAll(const MainScreen());
          //   },
          // ),
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
            ).textTheme.bodySmall?.apply(color: primary),
            automaticIndicatorColorAdjustment: true,
            tabs: const [
              Tab(text: 'Belum Bayar'),
              Tab(text: 'Diproses'),
              Tab(text: 'Dikirim'),
              Tab(text: 'Diterima'),
              // Tab(
              //   text: 'Dikomplain',
              // ),
              Tab(text: 'Selesai'),
              Tab(text: 'Dibatalkan'),
              // Tab(
              //   text: 'Dikembalikan',
              // ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // BelumBayarTabview(),
            // DiprosesTabview(),
            // DikirimTabview(),
            // DiterimaTabview(),
            // SelesaiTabview(),
            // BatalTabview(),
            // PengembalianTabview(),
            // PengembalianTabview(),
          ],
        ),
      ),
    );
  }
}
