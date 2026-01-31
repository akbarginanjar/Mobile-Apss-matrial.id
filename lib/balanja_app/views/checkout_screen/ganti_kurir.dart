import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/ganti_kurir_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/shipment_screen/screen.dart';

class GantiKurir extends StatelessWidget {
  const GantiKurir({super.key});

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
                  Text("Opsi Kurir"),
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
                        'Kurir',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.apply(color: Colors.grey[600]),
                      ),
                      if (metodeController.selectShipment == 'kurir_toko')
                        Text(
                          metodeController.namaKurirToko != null
                              ? 'Dikirim langsung oleh toko'
                              : '-',
                        )
                      else
                        Text(
                          metodeController.courierDescription != null
                              ? metodeController.courierDescription!
                              : '-',
                        ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (metodeController.selectShipment == 'kurir_toko')
                        Text(
                          metodeController.namaKurirToko != null
                              ? metodeController.namaKurirToko!
                              : 'Pilih Opsi Kurir',
                        )
                      else
                        Text(
                          metodeController.courierName != null
                              ? metodeController.courierName!
                              : 'Pilih Opsi Kurir',
                        ),
                      if (metodeController.selectShipment == 'kurir_toko')
                        Text(
                          metodeController.hargaOngkirKurirToko != null
                              ? toCurrency(
                                  metodeController.hargaOngkirKurirToko!,
                                )
                              : '-',
                          style: TextStyle(color: primary),
                        )
                      else
                        Text(
                          metodeController.courierDuration != null
                              ? metodeController.courierDuration!
                              : '-',
                          style: TextStyle(fontSize: 10),
                        ),
                      if (metodeController.courierPrice.value != 0)
                        Text(
                          metodeController.courierPrice.value != 0
                              ? toCurrency(metodeController.courierPrice.value)
                              : '-',
                          style: TextStyle(color: primary),
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
                      '-',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.apply(color: Colors.black87),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        if (metodeController.alamat == null) {
                          EasyLoading.showToast(
                            'Pilih alamat anda terlebih dahulu.',
                          );
                        } else {
                          Get.to(GantiKurirScreen());
                        }
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
              ),
            ],
          );
        },
      ),
    );
  }
}
