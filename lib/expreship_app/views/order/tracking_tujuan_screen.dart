// import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

// class TrackingTujuanScreen extends StatelessWidget {
//   final String accessToken =
//       'sk.eyJ1IjoiYmFsYW5qYS1pZCIsImEiOiJjbHoya2h2OTUzNm1wMmtxdjIzd3RmODhuIn0.EAVFDLNSwI_Eer_TTQHlig';

//   const TrackingTujuanScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final OrderController mapController = Get.put(OrderController());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: white,
//         surfaceTintColor: white,
//         shadowColor: Colors.grey[100],
//         elevation: 5,
//         title: const Text('Rute Tujuan Saya'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.offAll(const HomeScreenExpreship());
//           },
//         ),
//       ),
//       body: Stack(
//         children: [
//           MapboxMap(
//             accessToken: accessToken,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(
//                 mapController.startLatLng.value.latitude,
//                 mapController.startLatLng.value.longitude,
//               ),
//               zoom: 12,
//             ),
//             onMapCreated: (MapboxMapController controller) {
//               controller.addSymbol(SymbolOptions(
//                 geometry: LatLng(
//                   mapController.startLatLng.value.latitude,
//                   mapController.startLatLng.value.longitude,
//                 ),
//                 iconImage: "assets/images/user.png",
//                 iconSize: 0.2,
//                 textField: "Saya",
//                 textOffset: const Offset(0, 1.5),
//               ));
//               controller.addSymbol(SymbolOptions(
//                 geometry: LatLng(
//                   mapController.selectedLatLng.value.latitude,
//                   mapController.selectedLatLng.value.longitude,
//                 ),
//                 iconImage: "assets/images/pin-location.png",
//                 iconSize: 0.1,
//                 textField: "Tujuan",
//                 textOffset: const Offset(0, 1.5),
//               ));
//               mapController.fetchRoute();
//               mapController.routeCoordinates.listen((coordinates) {
//                 controller.clearLines();
//                 controller.addLine(LineOptions(
//                   geometry: coordinates
//                       .map((coord) => LatLng(coord[1], coord[0]))
//                       .toList(),
//                   lineWidth: 6.0,
//                   lineColor: "#1f5697",
//                 ));
//               });
//             },
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               color: white,
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Column(
//                   children: [
//                     // Obx(
//                     //   () => Text(
//                     //     'Durasi Perjalanan: ${mapController.travelDurationInMinutes.value} menit',
//                     //     style: TextStyle(
//                     //         fontSize: 16, fontWeight: FontWeight.bold),
//                     //   ),
//                     // ),
//                     SizedBox(height: 5),
//                     SizedBox(
//                       height: 50,
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primary,
//                           surfaceTintColor: primary,
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                         onPressed: () {},
//                         child: Text(
//                           'Pesan Sekarang',
//                           style: Theme.of(context)
//                               .textTheme
//                               .titleSmall!
//                               .copyWith(color: white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
