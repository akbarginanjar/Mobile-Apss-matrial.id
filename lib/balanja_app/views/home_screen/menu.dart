import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/semua_produk_screen/screen.dart';
import 'package:mobile_balanja_id/expreship_app/helpers/constant.dart';
import 'package:mobile_balanja_id/expreship_app/views/home/screen.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark,
      child: Padding(
        padding: const EdgeInsets.only(left: 13, top: 11, bottom: 13),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ), // Sesuaikan dengan bentuk yang diinginkan
                      onTap: () {},
                      child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Card(
                          surfaceTintColor: dark,
                          color: dark2,
                          elevation: 10,
                          shadowColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              color: Colors.grey,
                              'assets/lainnya.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Lainnya', style: TextStyle(fontSize: 10, color: textdark)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ), // Sesuaikan dengan bentuk yang diinginkan
                      onTap: () {},
                      child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Card(
                          surfaceTintColor: dark2,
                          color: dark2,
                          elevation: 10,
                          shadowColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/toko-matrial.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Mitra Supplier', style: TextStyle(fontSize: 10, color: textdark)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ), // Sesuaikan dengan bentuk yang diinginkan
                      onTap: () {},
                      child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Card(
                          surfaceTintColor: dark2,
                          color: dark2,
                          elevation: 10,
                          shadowColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/toko-matrial.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Mitra Jasa', style: TextStyle(fontSize: 10, color: textdark)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ), // Sesuaikan dengan bentuk yang diinginkan
                      onTap: () {},
                      child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Card(
                          surfaceTintColor: dark2,
                          color: dark2,
                          elevation: 10,
                          shadowColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/toko-matrial.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Mitra Toko', style: TextStyle(fontSize: 10, color: textdark)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ), // Sesuaikan dengan bentuk yang diinginkan
                      onTap: () {
                        Get.to(SemuaProdukScreen());
                      },
                      child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Card(
                          surfaceTintColor: dark2,
                          color: dark2,
                          elevation: 10,
                          shadowColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/produk-matrial.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Produk Matrial', style: TextStyle(fontSize: 10, color: textdark)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ), // Sesuaikan dengan bentuk yang diinginkan
                      onTap: () {},
                      child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Card(
                          surfaceTintColor: dark2,
                          color: dark2,
                          elevation: 10,
                          shadowColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/jasa-konstruksi.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Pelatihan', style: TextStyle(fontSize: 10, color: textdark)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ), // Sesuaikan dengan bentuk yang diinginkan
                      onTap: () {},
                      child: SizedBox(
                        height: 65,
                        width: 65,
                        child: Card(
                          surfaceTintColor: dark2,
                          color: dark2,
                          elevation: 10,
                          shadowColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/jasa-konstruksi.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Sertifikasi', style: TextStyle(fontSize: 10, color: textdark)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
