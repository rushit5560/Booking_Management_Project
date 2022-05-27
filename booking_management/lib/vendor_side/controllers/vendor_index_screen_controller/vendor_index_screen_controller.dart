import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../common_modules/sharedpreference_data/sharedpreference_data.dart';

class VendorIndexScreenController extends GetxController {
  RxInt currentVendorSelectedIndex = 0.obs;
  RxInt vendorMenuIndex = 0.obs;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  Position? position;

  void getCurrentLocation() async {
    Position position1 = await determinePosition();
    position = position1;
    sharedPreferenceData.setLatAndLongInPrefs(
      lat: "${position!.latitude}",
      long: "${position!.longitude}",
    );
    log("position : $position");
  }


  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error("Location Permission are denied");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }

}