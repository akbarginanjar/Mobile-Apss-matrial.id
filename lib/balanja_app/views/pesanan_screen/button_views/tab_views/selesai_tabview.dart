// import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
// import 'package:mobile_balanja_id/balanja_app/services/transaksi_service.dart';
// import 'package:mobile_balanja_id/balanja_app/utils/loading.dart';
// import 'package:flutter/material.dart';

// import '../../selesai_card.dart';

// class SelesaiTabview extends StatelessWidget {
//   const SelesaiTabview({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: dark2,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FutureBuilder<List<dynamic>>(
//               future: TransaksiServiceController().getTransaksiSelesai(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const SizedBox(height: 160, child: LoadingProses());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       return SelesaiCard(transaksi: snapshot.data![index]);
//                     },
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
