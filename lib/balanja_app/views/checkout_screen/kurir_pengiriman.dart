import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/ganti_kurir_screen/screen.dart';

class KurirPengiriman extends StatelessWidget {
  const KurirPengiriman({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12.0),
      child: GetBuilder<CheckoutController>(
        init: CheckoutController(),
        builder: (metodeController) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delivery_dining_outlined,
                    size: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 6.0),
                  Text("Opsi Pengiriman"),
                ],
              ),
              Divider(color: Colors.grey[800], thickness: 2.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        metodeController.namePengirimanKurir != null
                            ? metodeController.namePengirimanKurir!
                            : 'Pengiriman',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.apply(color: Colors.grey[600]),
                      ),
                      Text(
                        metodeController.nameKurir != null
                            ? metodeController.nameKurir!
                            : 'Pilih Opsi Pengiriman',
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        metodeController.priceKurir != null
                            ? toCurrency(metodeController.priceKurir!)
                            : '-',
                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        '0',
                        style: Theme.of(context).textTheme.bodySmall?.apply(
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.grey[800], thickness: 1.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      metodeController.minDayKurir != null &&
                              metodeController.maxDayKurir != null
                          ? 'Estimasi barang tiba pada tanggal :\n${metodeController.minDayKurir} - ${metodeController.maxDayKurir} Juni 2024'
                          : '-',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.apply(color: Colors.black87),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () => Get.to(() => const GantiKurirScreen()),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ubah',
                            softWrap: true,
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
