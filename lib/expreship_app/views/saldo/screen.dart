import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class SaldoScreen extends StatelessWidget {
  const SaldoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        elevation: 1,
        centerTitle: true,
        shadowColor: Colors.grey[100],
        title: const Text('Saldo'),
      ),
    );
  }
}
