import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/checkout_model.dart';

class ItemProdukDetailPesanan extends StatelessWidget {
  final Checkout? transaksi;
  const ItemProdukDetailPesanan({Key? key, required this.transaksi})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaksi!.item![0].barangNama!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${transaksi!.item![0].barangNama}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.apply(color: Colors.grey[700]),
                    ),
                    Text(
                      'x${transaksi!.item![0].qty}',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.apply(color: Colors.grey[700]),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    toCurrency(transaksi!.item![0].totalHarga!),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.apply(color: primary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
