import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (s) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/icon-matrial.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 2.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
