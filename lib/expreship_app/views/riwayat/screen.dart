import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          surfaceTintColor: white,
          elevation: 1,
          centerTitle: true,
          shadowColor: Colors.grey[100],
          title: const Text('Riwayat'),
          bottom: TabBar(
            labelColor: primary,
            indicatorColor: primary,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            tabs: const [
              Tab(text: 'Semua'),
              Tab(text: 'Pengantaran'),
              Tab(text: 'Penjemputan'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SemuaRiwayat(),
            Center(child: Text('Belum ada pengantaran')),
            Center(child: Text('Belum ada penjemputan')),
          ],
        ),
      ),
    );
  }
}
