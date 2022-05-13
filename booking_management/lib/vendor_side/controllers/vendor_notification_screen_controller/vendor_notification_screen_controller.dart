import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class VendorNotificationScreenController extends GetxController {

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
        firebaseMessaging.getToken().then((token) {
          log("token token $token");
         // Firebasetoken = token;
          //prefs.setString('apiToken', token);
          //SharedUserPreferences().setDeviceToken(token);
        });
  }
}