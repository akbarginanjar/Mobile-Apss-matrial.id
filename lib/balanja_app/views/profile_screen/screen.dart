import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/pembayaran/screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(
                PembayaranScreen(
                  idTransakti: 590,
                  noInvoice: 'INVMTIDT-0313-201225-422',
                ),
              );
            },
            child: Text('data'),
          ),
          SizedBox(
            height: 100,
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 15),
                  child: const Icon(Icons.account_circle, size: 100),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.account_circle),
                          const SizedBox(width: 8),
                          Text("${GetStorage().read('nama_lengkap')}"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.email_rounded),
                          SizedBox(width: 8),
                          Text("${GetStorage().read('email')}"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone_android),
                          SizedBox(width: 8),
                          Text("${GetStorage().read('no_hp')}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primary),
            onPressed: () {},
            child: const Text(
              'Daftar Griya Sehat',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: primary),
            onPressed: () {
              GetStorage().remove('tokens');
              GetStorage().remove('id');
              GetStorage().remove('no_hp');
              GetStorage().remove('email');
              GetStorage().remove('nama_lengkap');
              GetStorage().remove('member_id');
              GetStorage().remove('nama_toko');
              GetStorage().remove('id_toko');
              Get.offAll(
                const LoginScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
