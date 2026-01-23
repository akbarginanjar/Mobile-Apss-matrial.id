import 'package:mobile_balanja_id/balanja_app/controllers/varian_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class VariantSection extends StatelessWidget {
  final List<Map>? listVariant;
  final bool isLoad;
  final VoidCallback? onLainnya;
  final Produk? produk;
  const VariantSection({
    super.key,
    this.listVariant,
    this.isLoad = false,
    this.onLainnya,
    this.produk,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      color: dark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Text(
                    'Varian Produk',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.apply(color: textTheme),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(0),
              itemCount: produk!.varianBarang.length + 1,
              itemBuilder: (context, index) {
                if (index == produk!.varianBarang.length) {
                  return const SizedBox(width: 10);
                }

                final photoList = produk!.varianBarang[index].photo;

                return VariantCardVertical(
                  namaVarian: produk!.varianBarang[index].varian!,
                  photoVarian:
                      (photoList.isNotEmpty && photoList[0].path != null)
                      ? photoList[0].path.toString()
                      : "https://removal.ai/wp-content/uploads/2021/02/no-img.png",
                  index: index,
                  stok: produk!.varianBarang[index].jumlah!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
