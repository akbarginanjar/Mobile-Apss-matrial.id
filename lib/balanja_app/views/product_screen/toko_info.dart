import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class TokoInfo extends StatelessWidget {
  final Produk? produk;
  const TokoInfo({super.key, this.produk});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/icon-kecil-matrial.png',
                    fit: BoxFit.cover,
                    width: 40,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.only(left: 3.0, right: 2.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        produk!.varianBarang[0].gudang!.member!.namaLengkap
                            .toString(),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        produk!.varianBarang![0].gudang!.alamat.toString(),
                        maxLines: 1,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Rating',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodySmall?.apply(),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orangeAccent),
                          SizedBox(width: 5),
                          Text(
                            '4.8',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge?.apply(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '130+ ',
                        maxLines: 1,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        'Produk',
                        maxLines: 1,
                        softWrap: true,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.apply(color: textdark),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.to(TokoScreen());
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
                      'Buka Toko',
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
            ],
          ),
        ],
      ),
    );
  }
}
