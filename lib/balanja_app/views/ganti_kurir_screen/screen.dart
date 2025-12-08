import 'package:mobile_balanja_id/balanja_app/controllers/kurir_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/ganti_kurir_screen/kurir_card.dart';

class GantiKurirScreen extends StatelessWidget {
  final controller = Get.put(KurirController());
  final checkoutController = Get.put(CheckoutController());

  GantiKurirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsKurir = checkoutController.getSelectedItemsKurir();
    final body = {
      "category": "${checkoutController.selectShipment}",
      "items": itemsKurir,
      "method": checkoutController.selectShipment == "instan"
          ? "latlong"
          : "postal_code",
      if (checkoutController.selectShipment == "instan")
        "origin": {
          "latitude": checkoutController.alamatToko!['latitude'],
          "longitude": checkoutController.alamatToko!['longitude'],
        }
      else
        "origin": {
          "postal_code": "${checkoutController.alamatToko!['postal_code']}",
        },
      if (checkoutController.selectShipment == "instan")
        "destination": {
          "latitude": "${checkoutController.latAlamat}",
          "longitude": "${checkoutController.longAlamat}",
        }
      else
        "destination": {"postal_code": "${checkoutController.postalCode}"},
    };
    // print(body);
    controller.loadKurir(body);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Pilih Kurir"),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              "${checkoutController.namaShipment}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            ...controller.listKurir.map((item) => KurirCard(item)),
          ],
        );
      }),
    );
  }
}
