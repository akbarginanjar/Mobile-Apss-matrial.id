import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/register_screen/screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  GetStorage box = GetStorage();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthController authController = AuthController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Center(
                    child: SizedBox(
                      height: 200,
                      child: Image.asset('assets/icon-matrial.png'),
                    ),
                  ),
                ),
                Text(
                  'Masuk',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Silahkan login di matrial.id',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  // width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: dark2,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: email,
                    validator: (val) {
                      if (val!.isEmpty) {
                        showErrorDialog(
                          'Email atau Password tidak boleh kosong!',
                        );
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.grey[500]),
                      fillColor: primary,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 0,
                  ),
                  // width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: dark2,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    controller: password,
                    obscureText: _obscureText,
                    validator: (val) {
                      if (val!.isEmpty) {
                        showErrorDialog(
                          'Email atau Password tidak boleh kosong!',
                        );
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey[500],
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      fillColor: primary,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      elevation: 0,
                      surfaceTintColor: primary,
                    ),
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        authController
                            .login(email: email.text, password: password.text)
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
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Anda belum punya akun?'),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          const RegisterScreen(),
                          transition: Transition.rightToLeftWithFade,
                        );
                      },
                      child: const Text('Register'),
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
}
