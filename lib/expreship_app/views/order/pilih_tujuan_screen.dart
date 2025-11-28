// import 'package:mobile_balanja_id/expreship_app/global_resources.dart';
// import 'package:mobile_balanja_id/expreship_app/views/order/tracking_tujuan_screen.dart';

// class PilihTujuanScreen extends StatelessWidget {
//   const PilihTujuanScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final OrderController mapController = Get.put(OrderController());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: white,
//         surfaceTintColor: white,
//         shadowColor: Colors.grey[100],
//         elevation: 5,
//         title: const Text('Mau ke mana?'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.offAll(const HomeScreenExpreship());
//           },
//         ),
//       ),
//       body: Stack(
//         children: [
//           Obx(
//             () {
//               if (mapController.longitude.value == 0.0 ||
//                   mapController.latitude.value == 0.0) {
//                 return const Center(child: CircularProgressIndicator());
//               } else {
//                 return MapboxMap(
//                   onMapCreated: mapController.onMapCreated,
//                   onMapClick: (point, latLng) {
//                     mapController.updateLatLng(latLng);
//                   },
//                   initialCameraPosition: CameraPosition(
//                     target: LatLng(
//                       mapController.latitude.value,
//                       mapController.longitude.value,
//                     ),
//                     zoom: 12,
//                   ),
//                 );
//               }
//             },
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Padding(
//               padding: const EdgeInsets.all(15),
//               child: SizedBox(
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: primary,
//                     surfaceTintColor: primary,
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   onPressed: () {
//                     Get.to(const TrackingTujuanScreen());
//                     mapController.updateStartLatLng(LatLng(
//                         mapController.latitude.value,
//                         mapController.longitude.value));
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Pilih lokasi',
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleSmall!
//                             .copyWith(color: white),
//                       ),
//                       const SizedBox(width: 8),
//                       const Icon(
//                         Icons.my_location,
//                         color: white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
