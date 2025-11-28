import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class CardSemuaProduk extends StatelessWidget {
  final VoidCallback? onPress;
  final Produk produk;
  const CardSemuaProduk({Key? key, this.onPress, required this.produk})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark,
      surfaceTintColor: dark,
      elevation: 0,
      shadowColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: dark),
      ),
      child: InkWell(
        onTap: () {
          Get.to(ProductScreen(produk: produk));
        },
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: produk.photo!.isEmpty
                  ? Image.network(
                      'https://removal.ai/wp-content/uploads/2021/02/no-img.png',
                      height: 135,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      produk.photo![0].path.toString(),
                      height: 135,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, right: 6.0, left: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk.nama!,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: textdark),
                  ),
                  const SizedBox(height: 3.0),
                  Text(
                    toCurrency(produk.harga!),
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3.0),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      produk.varianBarang![0].gudang!.alamat.toString(),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 11, color: textdark),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
