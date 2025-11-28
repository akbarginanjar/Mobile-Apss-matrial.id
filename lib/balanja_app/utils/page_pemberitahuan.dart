import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

// ignore: must_be_immutable
class PagePemberitahuan extends StatelessWidget {
  String? title;
  String? deskripsi;
  String? fotoNetwork;
  String? fotoLocal;
  PagePemberitahuan({
    Key? key,
    this.title,
    this.deskripsi,
    this.fotoNetwork,
    this.fotoLocal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            fotoNetwork != ''
                ? Image.network(fotoNetwork!)
                : SizedBox(
                    height: 210,
                    width: 210,
                    child: Image.asset(fotoLocal!),
                  ),
            Text(
              title!,
              style: GoogleFonts.montserrat(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                deskripsi!,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 100),
            SizedBox(
              height: 45,
              width: 270,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  surfaceTintColor: primary,
                ),
                onPressed: () {
                  Get.offAll(const PesananScreen());
                },
                child: Text(
                  'Lihat Pesanan Saya',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
