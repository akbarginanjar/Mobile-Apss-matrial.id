import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      child: const SizedBox(
        width: double.maxFinite,
        height: 100,
        child: Row(
          children: [CartImage(), SizedBox(width: 10), DescripsiCart()],
        ),
      ),
    );
  }
}
