import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/metode_pembayaran_screen/metode_pembayaran_checkout.dart';

class MetodePembayaran extends StatelessWidget {
  const MetodePembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.payment,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 6.0),
              Text("Metode Pembayaran"),
            ],
          ),
          Divider(color: Colors.grey[800], thickness: 2.0),
          GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (metodeController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        metodeController.judul != null
                            ? metodeController.judul.toString()
                            : 'Metode Pembayaran',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.apply(color: Colors.grey[600]),
                      ),
                      Text(
                        metodeController.metode != null
                            ? metodeController.metode.toString()
                            : 'Pilih',
                      ),
                    ],
                  ),
                  Text(
                    metodeController.noRekening != null
                        ? 'No Rekening : ${metodeController.noRekening.toString()}'
                        : '-',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              );
            },
          ),
          Divider(color: Colors.grey[800], thickness: 1.0),
          GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (metodeController) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 2, child: SizedBox()),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Get.to(const MetodePembayaranScreen());
                      },
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
              );
            },
          ),
        ],
      ),
    );
  }
}
