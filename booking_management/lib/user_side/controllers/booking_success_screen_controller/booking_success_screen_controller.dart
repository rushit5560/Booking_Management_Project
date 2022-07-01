import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/controllers/book_appointment_screen_controller/book_appointment_screen_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/user_details.dart';
import '../../model/booking_success_screen_model/booking_success_model.dart';
import '../../model/booking_success_screen_model/notification_save_model.dart';
import '../../model/user_conversation_screen_model/get_fcm_token_model.dart';

class BookingSuccessScreenController extends GetxController {
  /// Getting from checkout screen
  String successId = Get.arguments;

  final bookAppointmentScreenController = Get.find<BookAppointmentScreenController>();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
   ApiHeader apiHeader = ApiHeader();

  String bookingId = "";
  String vendorName = "";
  String date = "";
  String slotTime = "";

  /// Getting From API
  String oppositeUserFcmToken = "";

  /// Db Notification Module
  String message = "";

  /// Getting Booking Success
  getBookingSuccessFunction() async {
    isLoading(true);
    String url = ApiUrl.bookingSuccessApi + "?id=$successId";
    log("Success API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      log("Booking Success Response : ${response.body}");

      BookingSuccessModel bookingSuccessModel = BookingSuccessModel.fromJson(json.decode(response.body));
      isSuccessStatus = bookingSuccessModel.success.obs;

      if(isSuccessStatus.value) {
        bookingId = bookingSuccessModel.workerList.bookingId;
        vendorName = bookingSuccessModel.workerList.vendor.businessName;
        String tempDate = bookingSuccessModel.workerList.startDateTime;
        date = tempDate.substring(0, tempDate.length-9);

        String tempSTime = bookingSuccessModel.workerList.startDateTime;
        String sTime = tempSTime.substring(11, tempSTime.length - 3);
        String tempETime = bookingSuccessModel.workerList.endDateTime;
        String eTime = tempETime.substring(11, tempETime.length - 3);
        slotTime = "$sTime to $eTime";

        log("bookingId :$bookingId");
        log("vendorName :$vendorName");
        log("date :$date");
        log("slotTime :$slotTime");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getBookingSuccessFunction Else Else");
      }


    } catch(e) {
      log("getBookingSuccessFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getUserFcmTokenFunction();
    }

  }


  /// Get Fcm Token
  getUserFcmTokenFunction() async {
    isLoading(true);
    String url = ApiUrl.getFcmTokenApi + "?id=${bookAppointmentScreenController.vendorUniqueId}";
    log("Get User Fcm Token : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      GetFcmTokeModel getFcmTokeModel = GetFcmTokeModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFcmTokeModel.success.obs;
      log("getFcmTokeModel.success : ${getFcmTokeModel.success}");
      log("getFcmTokeModel.success : ${getFcmTokeModel.statusCode}");
      log("getFcmTokeModel.success : ${getFcmTokeModel.data.fcmToken}");

      if(isSuccessStatus.value) {
        oppositeUserFcmToken = getFcmTokeModel.data.fcmToken;

        /// Send Chat Notification
        sendGeneralNotification(
          fcmToken: oppositeUserFcmToken, // Getting From API
          title: "${UserDetails.userName} booked appointment",
          body: "${UserDetails.userName} booked appointment for $date at $slotTime time",
          type: 0,
        );

        message = "${UserDetails.userName} booked appointment for $date at $slotTime time";

        log("oppositeUserFcmToken : $oppositeUserFcmToken");
      } else {
        log("getUserFcmTokenFunction Else Else");
      }

    } catch(e) {
      log("getUserFcmTokenFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await addNotificationFunction();
    }
  }

  /// Add Notification
  addNotificationFunction() async {
    isLoading(true);
    String url = ApiUrl.saveNotificationApi;
    log("Add Notification API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll(apiHeader.headers);

      request.fields['Message'] = message;
      request.fields['NotificationFor'] = "Booked Appointment";
      request.fields['NotificationFrom'] = UserDetails.uniqueId;
      request.fields['NotificationTo'] = bookAppointmentScreenController.vendorUniqueId;

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        NotificationSaveModel notificationSaveModel = NotificationSaveModel.fromJson(json.decode(value));
        isSuccessStatus = notificationSaveModel.success.obs;

        if(isSuccessStatus.value) {
          log(notificationSaveModel.message);
        } else {
          // log(notificationSaveModel.message);
          log("Add Notification Else Else");
        }
      });


    } catch(e) {
      log("Add Notification Error ::: $e");
    } finally {
      isLoading(false);
    }

  }



  @override
  void onInit() {
    getBookingSuccessFunction();
    super.onInit();
  }

  /// Send Notification Function
  static void sendGeneralNotification({
    required String fcmToken,
    required String body,
    required String title,
    required int type,
  }) async {

    log("fcmToken : $fcmToken");
    log("body : $body");
    log("title : $title");

    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': "Key=${ApiUrl.serverApiKey}",
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
            'type': '$type'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '10',
            "sound": "default",
            'status': 'done'
          },
          'to': fcmToken,
        },
      ),
    );
    log("response : ${response.body}");
    if (response.statusCode == 200) {
      // on success do
      log("General Notification Sent to $fcmToken");
    } else {
      // on failure do
      log("General Notification Failed");
    }

    // Get.back();
  }


}