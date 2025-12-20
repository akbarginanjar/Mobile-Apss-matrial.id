// import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
// import 'package:mobile_balanja_id/balanja_app/views/pesanan_screen/batal_card.dart';

// class BatalTabview extends StatelessWidget {
//   const BatalTabview({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: dark2,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FutureBuilder<List<dynamic>>(
//               future: TransaksiServiceController().getTransaksiBatal(),
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
//                       return BatalCard(transaksi: snapshot.data![index]);
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
