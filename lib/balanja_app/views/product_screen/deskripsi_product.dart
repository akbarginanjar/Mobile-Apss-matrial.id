// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter_html/flutter_html.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class DeskripsiProduct extends StatelessWidget {
  final Produk? produk;
  const DeskripsiProduct({super.key, this.produk});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
      color: dark2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            'Deskripsi Produk',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.apply(color: textTheme),
          ),
          const SizedBox(height: 5),
          Html(
            data: produk!.varianBarang![0].barang!.deskripsi ?? '-',
            style: {
              "body": Style(
                margin: Margins.zero,
                padding: HtmlPaddings.zero,
                fontSize: FontSize(12),
                color: textTheme,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
