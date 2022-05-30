import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserMapScreenController extends GetxController {
  /// Getting From Vendor Details Screen
  String vendorLat = Get.arguments[0];
  String vendorLong = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  Completer<GoogleMapController> controller = Completer();

  CameraPosition? kGooglePlex;


  @override
  void onInit() {
    isLoading(true);
    kGooglePlex = CameraPosition(
      target: LatLng(double.parse(vendorLat), double.parse(vendorLong)),
      zoom: 16,
    );
    isLoading(false);
    super.onInit();
  }

}