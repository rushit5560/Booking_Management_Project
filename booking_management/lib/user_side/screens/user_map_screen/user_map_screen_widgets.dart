import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controllers/user_map_screen_controller/user_map_screen_controller.dart';


class GoogleMapView extends StatelessWidget {
  GoogleMapView({Key? key}) : super(key: key);

  final screenController = Get.find<UserMapScreenController>();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      compassEnabled: true,
      initialCameraPosition: screenController.kGooglePlex!,
      zoomGesturesEnabled: true,
      markers: {
        if(screenController.destinationMarkers != null) screenController.destinationMarkers,
        if(screenController.userMarkers != null) screenController.userMarkers

      },
      onMapCreated: (GoogleMapController controller) {
        screenController.controller.complete(controller);
      },

      // polylines: {
      //   Polyline(
      //     polylineId: const PolylineId('direction_polyline'),
      //     color: Colors.red,
      //     width: 4,
      //     points: screenController.directionsInfo.polylinePoints!
      //       .map((e) => LatLng(e.latitude, e.longitude)).toList(),
      //   ),
      // },
    );
  }
}

class GetDirectionButtonModule extends StatelessWidget {
  const GetDirectionButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ]
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Get Direction',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
