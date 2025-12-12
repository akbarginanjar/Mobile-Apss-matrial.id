import 'package:mobile_balanja_id/balanja_app/global_resource.dart';
import 'package:mobile_balanja_id/balanja_app/models/shipment_model.dart';
import 'package:mobile_balanja_id/balanja_app/services/checkout_service.dart';

class ShipmentController extends GetxController {
  RxBool loading = false.obs;
  RxList<ShipmentCategory> categories = <ShipmentCategory>[].obs;

  Future<void> loadShipmentOptions(Map<String, dynamic> params) async {
    try {
      loading.value = true;

      final res = await CheckoutService().getShipmentOption(params);

      if (res.statusCode == 200) {
        final List data = res.body;

        categories.value = data
            .map((e) => ShipmentCategory.fromJson(e))
            .toList();
      }
    } finally {
      loading.value = false;
    }
  }
}

// [
//     {
//         "name": "Dikirim",
//         "items": [
//             {
//                 "id": "instan",
//                 "name": "Instan",
//                 "description": "Pengiriman 3 - 8 jam, maks. jarak pengiriman 40km",
//                 "couriers": [
//                     {
//                         "available_collection_method": [
//                             "pickup"
//                         ],
//                         "available_for_cash_on_delivery": false,
//                         "available_for_proof_of_delivery": false,
//                         "available_for_instant_waybill_id": true,
//                         "courier_name": "Gojek",
//                         "courier_code": "gojek",
//                         "courier_service_name": "Instant",
//                         "courier_service_code": "instant",
//                         "tier": "premium",
//                         "description": "On Demand Instant (bike)",
//                         "service_type": "same_day",
//                         "shipping_type": "parcel",
//                         "duration": "1 - 3 hours"
//                     },
//                 ],
//             },
//             {
//                 "id": "next_day",
//                 "name": "Next Day",
//                 "description": "Pengiriman besok hari",
//                 "couriers": [
//                     {
//                         "available_collection_method": [
//                             "pickup"
//                         ],
//                         "available_for_cash_on_delivery": false,
//                         "available_for_proof_of_delivery": false,
//                         "available_for_instant_waybill_id": true,
//                         "courier_name": "JNE",
//                         "courier_code": "jne",
//                         "courier_service_name": "YES",
//                         "courier_service_code": "yes",
//                         "tier": "essentials",
//                         "description": "Express, next day",
//                         "service_type": "overnight",
//                         "shipping_type": "parcel",
//                         "duration": "1 days"
//                     },
//                 ],
//             },
//             {
//                 "id": "reguler",
//                 "name": "Reguler",
//                 "description": "Estimasi pengiriman 3 - 4 hari",
//                 "couriers": [
//                     {
//                         "available_collection_method": [
//                             "pickup"
//                         ],
//                         "available_for_cash_on_delivery": false,
//                         "available_for_proof_of_delivery": false,
//                         "available_for_instant_waybill_id": true,
//                         "courier_name": "JNE",
//                         "courier_code": "jne",
//                         "courier_service_name": "Reguler",
//                         "courier_service_code": "reg",
//                         "tier": "free",
//                         "description": "Regular service",
//                         "service_type": "standard",
//                         "shipping_type": "parcel",
//                         "duration": "2 - 3 days"
//                     },
//                 ],
//             },
//             {
//                 "id": "kargo",
//                 "name": "Kargo",
//                 "description": "Rekomendasi berat diatas 5kg",
//                 "couriers": [
//                     {
//                         "available_collection_method": [
//                             "pickup"
//                         ],
//                         "available_for_cash_on_delivery": true,
//                         "available_for_proof_of_delivery": true,
//                         "available_for_instant_waybill_id": true,
//                         "courier_name": "Deliveree",
//                         "courier_code": "deliveree",
//                         "courier_service_name": "Tronton Wing Box",
//                         "courier_service_code": "tronton_wing_box",
//                         "tier": "premium",
//                         "description": "Tronton Wing Box",
//                         "service_type": "same_day",
//                         "shipping_type": "freight",
//                         "duration": "6 - 8 hours"
//                     },
//                 ],
//             },
//         ],
//     },
//     {
//         "name": "Ambil Sendiri",
//         "items": [
//             {
//                 "id": "take_away",
//                 "name": "Ambil Sendiri",
//                 "description": "Setelah melakukan pembayaran, anda harus mengambil barang ke toko penjual",
//                 "value_shipment_option": "take_away"
//             }
//         ]
//     }
// ]
