// import 'package:mobile_balanja_id/balanja_app/controllers/kurir_controller.dart';
// import 'package:mobile_balanja_id/balanja_app/utils/value_formatter.dart';
// import 'package:mobile_balanja_id/balanja_app/views/ganti_kurir_screen/kurir_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../widgets/batas_akhir.dart';

// class GantiKurirScreen extends StatefulWidget {
//   const GantiKurirScreen({super.key});

//   @override
//   State<GantiKurirScreen> createState() => _GantiKurirScreenState();
// }

// class _GantiKurirScreenState extends State<GantiKurirScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Ganti Kurir')),
//       body: GetBuilder<GantiKurirController>(
//         init: Get.put(GantiKurirController()),
//         builder: (c) {
//           return Stack(
//             children: [
//               SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: c.listKurir.length + 1,
//                       itemBuilder: (context, index) {
//                         final int idx = index + 1;
//                         return idx != (c.listKurir.length + 1)
//                             ? KurirCard(
//                                 minDay: c.listKurir[index]['minDay'],
//                                 name: c.listKurir[index]['name'],
//                                 maxDay: c.listKurir[index]['maxDay'],
//                                 price: c.listKurir[index]['price'],
//                                 value: index,
//                               )
//                             : const BatasAkhir(customName: 'kurir');
//                       },
//                     ),
//                     SizedBox(height: c.select != null ? 60 : 0),
//                   ],
//                 ),
//               ),
//               c.select != null
//                   ? Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height / 11.2,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 12.0,
//                           vertical: 4.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border(
//                             top: BorderSide(
//                               color: Colors.grey[200]!,
//                               width: 1.5,
//                             ),
//                           ),
//                         ),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Flexible(
//                               flex: 2,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${c.listKurir[c.select!]['name']}',
//                                     maxLines: 1,
//                                     softWrap: true,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyMedium
//                                         ?.apply(color: Colors.black87),
//                                   ),
//                                   const SizedBox(height: 4.0),
//                                   Text(
//                                     toCurrency(c.listKurir[c.select!]['price']),
//                                     maxLines: 1,
//                                     softWrap: true,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .titleSmall
//                                         ?.apply(
//                                           color: Theme.of(
//                                             context,
//                                           ).colorScheme.primary,
//                                         ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Flexible(
//                               flex: 1,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Theme.of(
//                                     context,
//                                   ).colorScheme.primary,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Konfirmasi',
//                                   style: Theme.of(context).textTheme.bodyLarge!
//                                       .apply(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
