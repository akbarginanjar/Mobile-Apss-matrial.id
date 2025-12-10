import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class PaymentMethodScreen extends StatelessWidget {
  final String idToko;
  const PaymentMethodScreen({required this.idToko, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaymentMethodController());
    final checkoutController = Get.put(CheckoutController());
    controller.loadPaymentMethod(idToko);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Pilih Metode Pembayaran"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: controller.groups.map((group) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Group title
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    group.group,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Items
                ...group.items.map((item) {
                  return Obx(() {
                    final isSelected =
                        checkoutController.selectedItemCode.value ==
                        item["code"].toString();

                    return Card(
                      color: isSelected ? Colors.blueGrey[700] : dark,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          checkoutController.selectPayment(
                            group.group.toString(),
                            item['code']?.toString() ?? '',
                            item['name']?.toString() ?? '',
                            item['number']?.toString() ?? '',
                            item['description']?.toString() ?? '',
                            item['image_url']?.toString() ?? '',
                            item['image']?.toString() ?? '',
                            item['type']?.toString() ?? '',
                            item['fee']?['type']?.toString() ?? '',
                            parseInt(item['fee']?['value']),
                          );
                        },

                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                item["image_url"] ?? item["image"] ?? "",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item["name"] ?? "",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    if (item["number"] != null)
                                      Text(
                                        item["number"],
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 13,
                                        ),
                                      ),
                                    if (item["description"] != null)
                                      Text(
                                        item["description"],
                                        style: const TextStyle(
                                          color: Colors.white54,
                                          fontSize: 10,
                                        ),
                                      ),
                                  ],
                                ),
                              ),

                              Icon(
                                Icons.check_circle,
                                size: 18,
                                color: isSelected
                                    ? Colors.greenAccent
                                    : Colors.white24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                }).toList(),
              ],
            );
          }).toList(),
        );
      }),
    );
  }
}
