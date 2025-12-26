import 'package:mobile_balanja_id/balanja_app/controllers/auth_controller.dart';
import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/register_screen/screen.dart';
import 'package:mobile_balanja_id/balanja_app/views/widgets/button.dart';

class LoginNoHpScreen extends StatelessWidget {
  const LoginNoHpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final GlobalKey<FormState> form = GlobalKey<FormState>();
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    controller: controller.phoneController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        showErrorDialog('No HP tidak boleh kosong!');
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: '08123xxx',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.grey[500],
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
                const SizedBox(height: 10),
                DefaultButton(
                  text: 'Login',
                  press: () {
                    controller.requestOtp();
                  },
                  color: primary,
                ),
                const SizedBox(height: 10),
                DefaultButtonOutline(
                  text: 'Login dengan Email',
                  press: () {
                    Get.off(LoginScreen());
                  },
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
