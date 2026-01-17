import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class SpesifikasiProduct extends StatelessWidget {
  final Produk? produk;
  const SpesifikasiProduct({super.key, this.produk});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark,
      child: InkWell(
        onTap: () {
          spesifikasi(
            produk!.varianBarang![0].satuan!.satuan.toString(),
            produk!.varianBarang![0].kategori!.kategori.toString(),
            produk!.varianBarang![0].berat.toString(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Spesifikasi',
                style: TextStyle(fontSize: 16, color: textdark),
              ),
              Icon(Icons.arrow_forward_ios_outlined, size: 14, color: primary),
            ],
          ),
        ),
      ),
    );
  }
}

void spesifikasi(String satuan, String kategori, String berat) {
  Get.bottomSheet(
    SizedBox(
      height: 250,
      child: Container(
        color: dark2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                'Spesifikasi',
                style: TextStyle(fontSize: 17, color: textdark),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Satuan',
                    style: TextStyle(fontSize: 14, color: textdark),
                  ),
                  Text(satuan, style: TextStyle(fontSize: 14, color: textdark)),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(color: Colors.black12),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kategori',
                    style: TextStyle(fontSize: 14, color: textdark),
                  ),
                  Text(
                    kategori,
                    style: TextStyle(fontSize: 14, color: textdark),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(color: Colors.black12),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Berat',
                    style: TextStyle(fontSize: 14, color: textdark),
                  ),
                  Text(
                    '$berat Gram',
                    style: TextStyle(fontSize: 14, color: textdark),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
