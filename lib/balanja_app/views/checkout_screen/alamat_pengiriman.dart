import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/ganti_alamat_screen/screen.dart';

class AlamatPengiriman extends StatelessWidget {
  const AlamatPengiriman({super.key, VarianBarang? varian});

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
                Icons.location_on_outlined,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 6.0),
              Text(
                "Alamat Pengiriman",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.apply(color: textTheme),
              ),
            ],
          ),
          const SizedBox(height: 5),
          GetBuilder<CheckoutController>(
            init: CheckoutController(),
            builder: (alamatController) {
              return InkWell(
                onTap: () => Get.to(() => const GantiAlamatScreen()),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              alamatController.labelAlamat != null
                                  ? Card(
                                      elevation: 0,
                                      color: Colors.grey[400],
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 1,
                                          horizontal: 6,
                                        ),
                                        child: Text(
                                          'Rumah',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              Expanded(
                                child: Text(
                                  alamatController.namaKontak != null
                                      ? '${alamatController.namaKontak!} | ${alamatController.nomorKontak}'
                                      : 'Pilih Alamat Tujuan',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: textdark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            alamatController.alamat != null
                                ? alamatController.alamat!
                                : '-',
                            softWrap: true,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: textdark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                          color: primary,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
