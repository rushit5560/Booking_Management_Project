import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_url.dart';
import '../../model/booking_success_screen_model/notification_get_model.dart';

class UserNotificationScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<NotificationData> notificationList = [];
  List<NotificationData> _notificationListData = [];

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
    getNotificationListFunction();
    super.onInit();
  }
}