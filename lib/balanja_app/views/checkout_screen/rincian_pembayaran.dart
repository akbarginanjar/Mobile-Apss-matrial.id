import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class RincianPembayaran extends StatelessWidget {
  final VarianBarang? varian;
  const RincianPembayaran({super.key, required this.varian});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Container(
      color: dark,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 73.0),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.inventory_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 6.0),
              Text("Rincian Pembayaran"),
            ],
          ),
          Divider(color: Colors.grey[800], thickness: 2.0),
          GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (c) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Subtotal untuk produk'),
                  Obx(
                    () => Text(
                      // ignore: unrelated_type_equality_checks
                      c.totalHarga == 0
                          ? toCurrency(varian!.harga!)
                          : toCurrency(c.totalHarga.toInt()),
                    ),
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('Subtotal pengiriman'), Text('Rp. 6.000')],
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Biaya layanan'),
                Text(toCurrency(controller.transaksiBiayaLayanan.value)),
              ],
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Biaya Aplikasi'),
                Text(toCurrency(controller.transaksiBiayaAplikasi.value)),
              ],
            ),
          ),
          Obx(
            () => controller.isDonasiActive.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Donasi'),
                      Text(toCurrency(controller.transaksiDonasi.value)),
                    ],
                  )
                : SizedBox.shrink(), // hidden
          ),
          Divider(color: Colors.grey[800], thickness: 1.0),
          GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (c) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Total'),
                  Obx(
                    () => Text(
                      // ignore: unrelated_type_equality_checks
                      c.totalBayar == 0
                          ? toCurrency(varian!.harga! + 6000 + 1000)
                          : toCurrency(c.totalBayar.toInt()),
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
