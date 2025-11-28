import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        elevation: 1,
        centerTitle: true,
        shadowColor: Colors.grey[100],
        title: const Text('Pilih Tujuan Anda'),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13),
            child: ListView(
              children: [
                const SizedBox(height: 7),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.grey[200]!, width: 1.5),
                  ),
                  color: white,
                  surfaceTintColor: white,
                  child: const ListTile(
                    leading: Icon(Icons.circle, color: primary2),
                    title: Text('Lokasi saat ini'),
                  ),
                ),
                const SizedBox(height: 3),
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.grey[200]!, width: 1.5),
                  ),
                  color: white,
                  surfaceTintColor: white,
                  child: ListTile(
                    onTap: () {
                      // Get.to(const PilihTujuanScreen());
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    leading: const Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 200, 40, 40),
                    ),
                    title: const Text('Mau ke mana?'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    surfaceTintColor: white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    // Get.to(const PilihTujuanScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.map, color: black),
                      const SizedBox(width: 8),
                      Text(
                        'Pilih di Peta',
                        style: Theme.of(
                          context,
                        ).textTheme.titleSmall!.copyWith(color: black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
