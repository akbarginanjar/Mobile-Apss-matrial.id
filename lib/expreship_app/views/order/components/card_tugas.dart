import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class CardTugasComponent extends StatelessWidget {
  final TugasDriver? tugasDriver;
  const CardTugasComponent({super.key, required this.tugasDriver});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Get.to(DetailPengirimanScreen(tugasDriver: tugasDriver));
          },
          title: Text(
            '${tugasDriver!.recipientName}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${tugasDriver!.trackingNumber}'),
              const SizedBox(height: 5),
              Text('${tugasDriver!.recipientAddress}'),
            ],
          ),
          trailing: const Column(
            children: [
              Icon(Icons.location_on, size: 33, color: primary2),
              SizedBox(height: 5),
              Text('2 Km'),
            ],
          ),
        ),
        Divider(color: Colors.grey[300]),
      ],
    );
  }
}
