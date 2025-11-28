import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

class CardTransferBank extends StatelessWidget {
  final Bank? bank;
  const CardTransferBank({super.key, required this.bank});

  @override
  Widget build(BuildContext context) {
    final CheckoutController controller = Get.put(CheckoutController());
    return Card(
      color: dark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey[800]!, width: 1.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () {
          controller.changeSelectBank(
            bank!.code!,
            'Transfer Bank',
            '${bank!.name!} (${bank!.description})',
            bank!.number!,
          );
          Get.back();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: SizedBox(
          height: 40,
          width: 40,
          child: bank!.imageUrl! == ''
              ? Icon(Icons.payment, color: primary)
              : Image.network(
                  'https://api.balanja.id${bank!.imageUrl!}',
                  errorBuilder: (context, exception, stackTrace) {
                    return Icon(Icons.payment, color: primary);
                  },
                ),
        ),
        title: Text('${bank!.name} (${bank!.description})'),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
          color: Colors.grey,
        ),
      ),
    );
  }
}
