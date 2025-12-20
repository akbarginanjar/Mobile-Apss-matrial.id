// import 'package:mobile_balanja_id/balanja_app/config/theme.dart';
// import 'package:mobile_balanja_id/balanja_app/services/transaksi_service.dart';
// import 'package:mobile_balanja_id/balanja_app/utils/loading.dart';
// import 'package:mobile_balanja_id/balanja_app/views/pesanan_screen/dikirim_card.dart';
// import 'package:flutter/material.dart';

// class DikirimTabview extends StatelessWidget {
//   const DikirimTabview({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: dark2,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FutureBuilder<List<dynamic>>(
//               future: TransaksiServiceController().getTransaksiDikirim(),
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
//                       return DikirimCard(transaksi: snapshot.data![index]);
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
