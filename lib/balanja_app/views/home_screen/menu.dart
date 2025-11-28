import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
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
                              'assets/jasa_konstruksi.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Jasa Konstruksi', style: TextStyle(fontSize: 10, color: textdark)),
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
                              'assets/toko_matrial.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text('Toko Matrial', style: TextStyle(fontSize: 10, color: textdark)),
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
                              'assets/produk_matrial.jpg',
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
            ],
          ),
        ),
      ),
    );
  }
}
