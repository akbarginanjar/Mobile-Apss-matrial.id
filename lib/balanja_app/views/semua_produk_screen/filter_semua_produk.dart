import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class FilterSemuaProduk extends StatelessWidget {
  const FilterSemuaProduk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 37,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: dark,
              surfaceTintColor: dark,
              elevation: 0,
            ),
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.network(
                    color: primary,
                    'https://cdn-icons-png.freepik.com/512/4502/4502383.png',
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Filter',
                  style: GoogleFonts.montserrat(
                    color: primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        FutureBuilder(
          future: loadToko(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Text('Loading...');
            }
            return SizedBox(
              height: 37,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: dark,
                  surfaceTintColor: dark,
                  elevation: 0,
                ),
                onPressed: () {
                  Get.to(
                    const TokoScreen(),
                    transition: Transition.rightToLeftWithFade,
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.store, color: primary2),
                    const SizedBox(width: 8),
                    Text(
                      'Pilih Gerai',
                      // GetStorage().read('nama_toko') == null
                      //     ? 'Pilih Gerai'
                      //     : GetStorage().read('nama_toko')!,
                      style: GoogleFonts.montserrat(
                        color: primary2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
