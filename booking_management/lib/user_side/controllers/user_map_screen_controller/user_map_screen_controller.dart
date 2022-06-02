import 'dart:async';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../common_modules/sharedpreference_data/sharedpreference_data.dart';


class UserMapScreenController extends GetxController {
  /// Getting From Vendor Details Screen
  String vendorLat = Get.arguments[0];
  String vendorLong = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String googleAPIKey = "AIzaSyBbRebrQXBFyRcSYWx2RfqEd769V6BlOgo";

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  Completer<GoogleMapController> controller = Completer();
  CameraPosition? kGooglePlex;
  // Set<Marker> destinationMarkers = {};
  // Set<Marker> userMarkers = {};
  Marker destinationMarkers = const Marker(markerId: MarkerId("destinationMarkers"));
  Marker userMarkers = const Marker(markerId: MarkerId("userMarkers"));
  Position? position;


  /// For Dio
  String directionUrl = "https://maps.googleapis.com/maps/api/directions/json?";
  // Dio newDio = Dio();

  // Directions directionsInfo = Directions(
  //   bounds:
  // );

  // Future<Directions> getDirections(
  //     {required LatLng userLocation, required LatLng destination}) async {
  //   final response = await newDio.get(directionUrl,
  //     queryParameters: {
  //       'origin': '${userLocation.latitude},${userLocation.longitude}',
  //       'destination': '${destination.latitude},${destination.longitude}',
  //       'key': googleAPIKey,
  //     },
  //   );
  //
  //
  //   if (response.statusCode == 200) {
  //     return Directions.fromMap(response.data);
  //   } else {
  //     return null!;
  //   }
  //   // return null!;
  // }

  /// Current Location
  void getCurrentLocation() async {
    Position position1 = await determinePosition();
    position = position1;
    sharedPreferenceData.setLatAndLongInPrefs(
      lat: "${position!.latitude}",
      long: "${position!.longitude}",
    );
    log("position : $position");




    // getDirections(userLocation: userMarkers.position, destination: destinationMarkers.position);

  }

  /// Get Location Use Permission
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
    isLoading(true);
    kGooglePlex = CameraPosition(
      target: LatLng(double.parse(vendorLat), double.parse(vendorLong)),
      zoom: 16,
    );

    /// Get User Current Location
    getCurrentLocation();


    /// Set Marker for Destination location
    destinationMarkers = Marker(
      markerId: const MarkerId("destinationMarkers"),
      infoWindow: const InfoWindow(title: "DestinationMarker"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(
        double.parse(vendorLat),
        double.parse(vendorLong),
      ),
    );

    /// Set Marker for User Current Location
    userMarkers = Marker(
      markerId: const MarkerId("userMarkers"),
      infoWindow: const InfoWindow(title: "UserMarker"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(double.parse(UserDetails.latitude),double.parse(UserDetails.longitude)),
    );

    isLoading(false);
    super.onInit();
  }





}