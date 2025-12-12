import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/views/voucher_screen/screen.dart';

class Voucher extends StatelessWidget {
  const Voucher({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return InkWell(
      onTap: () {
        Get.to(VoucherScreen());
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: Image.network(
                  'https://cdn-icons-png.freepik.com/512/5733/5733329.png',
                ),
              ),
              const SizedBox(width: 10),
              const Text('Voucher'),
            ],
          ),
          Obx(
            () => Row(
              children: [
                if (controller.voucherValue.value != 0)
                  if (controller.voucherType.value == 'nominal')
                    Text(
                      '-${toCurrency(controller.voucherValue.value)}',
                      style: TextStyle(color: Colors.red[800]),
                    )
                  else
                    Text(
                      '-${controller.voucherValue.value}',
                      style: TextStyle(color: Colors.red[800]),
                    ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey[500],
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
