import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class CardToko extends StatelessWidget {
  // Definisikan parameter yang ingin Anda terima
  final int id;
  final String namaToko;
  final String imageToko;
  final String jadwalToko;
  final String alamat;
  // final String status;

  // Buat konstruktor untuk menerima parameter
  const CardToko({
    super.key,
    required this.id,
    required this.imageToko,
    required this.namaToko,
    required this.jadwalToko,
    required this.alamat,
    // required this.status,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        GetStorage().write('id_toko', id);
        GetStorage().write('nama_toko', namaToko);
        loadToko();
        Get.offAll(const MainScreen());
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.black38,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: SizedBox(height: 30, child: Image.network(imageToko)),
              title: Row(
                children: [
                  const Icon(
                    Icons.watch_later_outlined,
                    color: Colors.grey,
                    size: 12,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    jadwalToko.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                ],
              ),
              // trailing: const SizedBox(
              //   width: 45,
              //   height: 30,
              //   child: Card(
              //     color: Colors.green,
              //     elevation: 0,
              //     child: Center(
              //       child: Text(
              //         'Aktif',
              //         style: TextStyle(color: Colors.white, fontSize: 9),
              //       ),
              //     ),
              //   ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                namaToko,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                alamat,
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
