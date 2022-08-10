import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/model/booking_success_screen_model/notification_get_model.dart';
import 'package:booking_management/user_side/model/notification_screen_models/get_user_notification_count_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/sharedpreference_data/sharedpreference_data.dart';

class VendorIndexScreenController extends GetxController {
  RxInt currentVendorSelectedIndex = 0.obs;
  RxInt vendorMenuIndex = 0.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  RxInt notiCounter = 0.obs;

  List<NotificationData> notificationList = [];
  List<NotificationData> _notificationListData = [];

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


  /// Get Notification Count
  getNotificationCountFunction() async {
    String url = ApiUrl.getNotificationCountApi + "?id=${UserDetails.uniqueId}";
    log("Get Noti Count Api Url : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers);
      log("response 121212: ${response.body}");
      NotificationCountModel notificationCountModel = NotificationCountModel.fromJson(json.decode(response.body));
      isSuccessStatus = notificationCountModel.success.obs;

      if(isSuccessStatus.value) {
        notiCounter = notificationCountModel.workerList.obs;
        log("notiCounter : $notiCounter");
      } else {
        log("getNotificationCountFunction Else Else");
      }

    } catch(e) {
      log("getNotificationCountFunction Error ::: $e");
    } finally {
      await getNotificationListFunction();
    }

  }

  /// Get Notification List
  getNotificationListFunction() async {
    isLoading(true);
    String url = ApiUrl.getNotificationApi + "?id=${UserDetails.uniqueId}";
    log("Notification Get API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);

      NotificationGetModel notificationGetModel = NotificationGetModel.fromJson(json.decode(response.body));
      isSuccessStatus = notificationGetModel.success.obs;

      if(isSuccessStatus.value) {
        notificationList.clear();
        _notificationListData = notificationGetModel.workerList;
        notificationList = _notificationListData;
        log("notificationList : ${notificationList.length}");
      } else {
        log("getNotificationListFunction Else Else");
      }

    } catch(e) {
      log("getNotificationListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getCurrentLocation();
    getNotificationCountFunction();
    super.onInit();
  }

}