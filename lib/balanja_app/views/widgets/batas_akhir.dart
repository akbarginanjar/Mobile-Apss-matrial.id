import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class BatasAkhir extends StatelessWidget {
  final String? customName;
  const BatasAkhir({super.key, this.customName = 'produk'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20.0, top: 12.0),
      child: Text('Tidak ada $customName lainnya', textAlign: TextAlign.center),
    );
  }
}
