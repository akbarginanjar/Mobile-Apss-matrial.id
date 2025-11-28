import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: defaultTheme(context),
      // darkTheme: ThemeData.dark(), // Tema gelap
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Matrial.id',
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
