import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:mobile_balanja_id/expreship_app/global_resources.dart';

class OrderController extends GetxController {
  bool servicestatus = false;
  bool haspermission = false;
  LocationPermission? permission;
  Position? position;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  Symbol? currentSymbol;
  var routeCoordinates = <List<double>>[].obs;
  var travelDurationInMinutes = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    checkGps();
    fetchLocation();
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // print('Izin lokasi ditolak');
        } else if (permission == LocationPermission.deniedForever) {
          // print("''Izin lokasi ditolak permanen");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        // setState(() {
        //   //refresh the UI
        // });

        fetchLocation();
      }
    } else {
      Get.snackbar('Lokasi', 'Nyalakan GPS Terlebih dahulu');
    }
  }

  void fetchLocation() async {
    await Future.delayed(const Duration(seconds: 1));
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    latitude.value = position!.latitude;
    longitude.value = position!.longitude;
  }
}
