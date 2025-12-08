// import 'package:mobile_balanja_id/balanja_app/controllers/kurir_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/utils/value_formatter.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class KurirCard extends StatelessWidget {
//   final String name;
//   final int price;
//   final int minDay;
//   final int maxDay;
//   final int value;
//   const KurirCard({
//     super.key,
//     required this.name,
//     required this.value,
//     required this.price,
//     required this.minDay,
//     required this.maxDay,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final GantiKurirController c = Get.find();

//     return InkWell(
//       onTap: () => c.changeSelect(value),
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6.0),
//         decoration: BoxDecoration(
//           color: c.select == value
//               ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
//               : Colors.white,
//           border: Border(
//             bottom: BorderSide(color: Colors.grey[300]!, width: 1.0),
//           ),
//         ),
//         child: ListTile(
//           contentPadding: const EdgeInsets.all(0),
//           title: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 '$name | ',
//                 maxLines: 2,
//                 softWrap: true,
//                 textAlign: TextAlign.start,
//                 overflow: TextOverflow.ellipsis,
//                 style: Theme.of(
//                   context,
//                 ).textTheme.bodyMedium?.apply(color: Colors.black87),
//               ),
//               Text(
//                 toCurrency(price),
//                 maxLines: 2,
//                 softWrap: true,
//                 textAlign: TextAlign.end,
//                 overflow: TextOverflow.ellipsis,
//                 style: Theme.of(context).textTheme.bodyMedium?.apply(
//                   color: Theme.of(context).colorScheme.secondary,
//                 ),
//               ),
//             ],
//           ),
//           subtitle: Text(
//             'Akan diterima pada tanggal ${DateTime.now().add(Duration(days: minDay)).day} - ${DateTime.now().add(Duration(days: maxDay))}',
//             style: Theme.of(
//               context,
//             ).textTheme.bodySmall?.apply(color: Colors.black87),
//           ),
//         ),
//       ),
//     );
//   }
// }
