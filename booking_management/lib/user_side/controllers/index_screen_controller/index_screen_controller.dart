import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxInt currentSelectedIndex = 0.obs;
  RxInt menuIndex = 0.obs;

  Position? position;

  void getCurrentLocation() async {
    Position position1 = await determinePosition();
    position = position1;

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