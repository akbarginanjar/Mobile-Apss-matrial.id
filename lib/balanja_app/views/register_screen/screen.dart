import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPassword = true;
  bool showKonfirmasiPassword = true;
  GetStorage box = GetStorage();
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nomorHp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfirmasiPassword = TextEditingController();
  AuthService authService = AuthService();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black38,
        elevation: 1,
        title: Text('Register Balanja', style: GoogleFonts.montserrat()),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: form,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Text(
                'Daftar',
                style: GoogleFonts.montserrat(
                  fontSize: 20,

                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Lengkapi Form dibawah ini',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: namaLengkap,
                  decoration: InputDecoration(
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Nama Lengkap',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    fillColor: primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: nomorHp,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('Nomor HP', style: TextStyle(fontSize: 14)),
                    ),
                    fillColor: primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('Email', style: TextStyle(fontSize: 14)),
                    ),
                    fillColor: primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  obscureText: showPassword,
                  controller: password,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ),
                    fillColor: primary,
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('Password', style: TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  obscureText: showKonfirmasiPassword,
                  controller: konfirmasiPassword,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        icon: Icon(
                          showKonfirmasiPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            showKonfirmasiPassword = !showKonfirmasiPassword;
                          });
                        },
                      ),
                    ),
                    fillColor: primary,
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Konfirmasi Password',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(13),
        child: SizedBox(
          height: 45,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              surfaceTintColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              if (form.currentState!.validate()) {
                authService
                    .register(
                      namaLengkap: namaLengkap.text,
                      nomorHp: nomorHp.text,
                      email: email.text,
                      password: password.text,
                      konfirmasiPassword: konfirmasiPassword.text,
                    )
                    .then((value) {
                      if (box.read('tokens') != null) {
                        form.currentState!.reset();
                        Get.offAll(
                          const MainScreen(),
                          transition: Transition.rightToLeft,
                        );
                      }
                    });
              }
            },
            child: Text(
              'Daftar',
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
