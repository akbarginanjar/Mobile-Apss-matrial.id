import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        elevation: 1,
        centerTitle: true,
        shadowColor: Colors.grey[100],
        title: const Text('Profil'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 247, 247, 247),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Akun Saya',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[400],
              child: const Icon(Icons.person, size: 100, color: white),
            ),
            const SizedBox(height: 5),
            Card(
              margin: const EdgeInsets.all(15),
              elevation: 10,
              shadowColor: Colors.black26,
              color: white,
              surfaceTintColor: white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profil',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'NAMA LENGKAP',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${box.read('nama_lengkap')}',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'NO TELEPON',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${box.read('no_hp')}',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'EMAIL',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${box.read('email')}',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Alamat',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${box.read('alamat')}',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              elevation: 10,
              shadowColor: Colors.black26,
              color: white,
              surfaceTintColor: white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Nama Kendaraan',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                    Text('C70 1977', style: GoogleFonts.poppins(fontSize: 17)),
                    const SizedBox(height: 5),
                    Text(
                      'No Polisi',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'D 1933 BDG',
                      style: GoogleFonts.poppins(fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                    surfaceTintColor: white,
                    elevation: 10,
                    shadowColor: Colors.black38,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    box.remove('tokens');
                    Get.offAll(const LoginScreen());
                  },
                  child: Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Versi 1.0.1',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
