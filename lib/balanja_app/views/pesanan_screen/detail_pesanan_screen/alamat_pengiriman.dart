import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/checkout_model.dart';

class AlamatPengirimanDetailPesanan extends StatelessWidget {
  final Checkout checkout;
  const AlamatPengirimanDetailPesanan({
    super.key,
    VarianBarang? varian,
    required this.checkout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.black87,
              ),
              const SizedBox(width: 6.0),
              Text(
                "Alamat Pengiriman",
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Colors.black87,
                  fontWeightDelta: 3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${checkout.customer!.nama} | ${checkout.customer!.noHp}',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${checkout.customer!.dataPengiriman!.alamat}',
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
