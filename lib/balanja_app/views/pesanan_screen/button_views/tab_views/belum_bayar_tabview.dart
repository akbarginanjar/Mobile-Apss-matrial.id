// import 'package:mobile_balanja_id/balanja_app/global_resource.dart';

// class BelumBayarTabview extends StatefulWidget {
//   const BelumBayarTabview({super.key});

//   @override
//   State<BelumBayarTabview> createState() => _BelumBayarTabviewState();
// }

// class _BelumBayarTabviewState extends State<BelumBayarTabview> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: dark2,
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FutureBuilder<List<dynamic>>(
//               future: TransaksiServiceController().getTransaksiBelumDibayar(),
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
//                       return BelumBayarCard(transaksi: snapshot.data![index]);
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
