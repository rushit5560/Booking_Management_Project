import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/vendor_side/model/vendor_appointment_cancel_model/vendor_appointment_cancel_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../../user_side/model/booking_success_screen_model/notification_save_model.dart';
import '../../../user_side/model/user_conversation_screen_model/get_fcm_token_model.dart';
import '../../model/appointment_details_screen_models/appointment_details_model.dart';
import '../../model/vendor_appointment_list_screen_models/appointment_status_change_model.dart';

class AppointmentDetailsScreenController extends GetxController {
  /// "appointmentId" From Appointment List Screen
  String bookingId = Get.arguments[0];
  String status = Get.arguments[1];
  int appointmentId = Get.arguments[2];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  AppointmentDetailsData appointmentDetailsData = AppointmentDetailsData();
  List<String> serviceList = [];

  String oppositeUserUniqueId = "";
  String oppositeUserFcmToken = "";
  String date = "";
  String slotTime = "";

  String cstName = "";
  String cstEmail = "";
  String cstPhoneNo = "";

  TextEditingController reasonFieldController = TextEditingController();
  int id = 0;

  /// Get Appointment Details
  getAppointmentDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentDetailsApi + "?id=$bookingId";
    log("Appointment Details API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment Details Response : ${response.body}");

      AppointmentDetailsModel appointmentDetailsModel =
          AppointmentDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentDetailsModel.success.obs;
      serviceList = appointmentDetailsModel.list;

      if (isSuccessStatus.value) {
        appointmentDetailsData = appointmentDetailsModel.data;
        oppositeUserUniqueId = appointmentDetailsModel.data.vendor!.userId;

        String dateTime = appointmentDetailsModel.data.startDateTime!;
        date = dateTime.substring(0, dateTime.length - 9);
        slotTime = dateTime.substring(11, dateTime.length - 3);

        cstName = "${appointmentDetailsModel.data.firstName}";
        cstEmail = "${appointmentDetailsModel.data.email}";
        cstPhoneNo = "${appointmentDetailsModel.data.phoneNo}";

        log("appointmentDetailsData :: $appointmentDetailsData");
      } else {
        log("getAppointmentDetailsByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getAppointmentDetailsByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Appointment for Confirm
  confirmAppointmentByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentStatusChangeApi +
        "?status=Confirm&id=$appointmentId";
    log("Appointment Status Change API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Appointment Details API Response : ${response.body}");

      AppointmentStatusChangeModel appointmentStatusChangeModel =
          AppointmentStatusChangeModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentStatusChangeModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "Appointment Confirmed!");

        String title = "${UserDetails.userName} appointment confirmed";
        String msg =
            "${UserDetails.userName} appointment confirmed for $date at $slotTime time";

        await getUserFcmTokenFunction(title: title, body: msg);

        // Get.back();
      } else {
        log("confirmAppointmentByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("confirmAppointmentByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }
  }

  /// Appointment for Done
  doneAppointmentByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentStatusChangeApi +
        "?status=Done&id=$appointmentId";
    log("Appointment Status Change API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Appointment Details API Response : ${response.body}");

      AppointmentStatusChangeModel appointmentStatusChangeModel =
          AppointmentStatusChangeModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentStatusChangeModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "Appointment Done!");

        String title = "${UserDetails.userName} appointment done";
        String msg =
            "${UserDetails.userName} appointment done for $date at $slotTime time";

        await getUserFcmTokenFunction(title: title, body: msg);

        // Get.back();
      } else {
        log("confirmAppointmentByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("confirmAppointmentByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }
  }

  /// Appointment for Cancel
  cancelAppointmentByIdFunction() async {
    isLoading(true);

    String url = ApiUrl.vendorAppointmentStatusCancelApi;
    log('vendorAppointmentStatusCancelApi Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(apiHeader.headers);

      request.fields['BookingId'] = "$appointmentId";
      request.fields['Reason'] = reasonFieldController.text.trim();

      log('request.fields: ${request.fields}');
      log('request.files: ${request.files}');

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) {
        VendorAppointmentCancelModel vendorAppointmentCancelModel =
            VendorAppointmentCancelModel.fromJson(json.decode(value));
        log('response1 ::::::${vendorAppointmentCancelModel.statusCode}');
        isSuccessStatus = vendorAppointmentCancelModel.success.obs;
        log('vendorAppointmentStatusCancelApi status : $isSuccessStatus');
        //log('success : ${isSuccessStatus.}');

        if (isSuccessStatus.value) {
          //UserDetails().vendorId = response1.data.id;
          log("Cancel Appointment");
          Fluttertoast.showToast(msg: 'Successfully Cancelled');
          reasonFieldController.clear();
          Get.back();
          //id = vendorAppointmentCancelModel.data.id;
          // log('Cancel id : $id');
        } else {
          // Fluttertoast.showToast(msg: "${response1.message}");
          log('False False');
        }
      });
    } catch (e) {
      log('SignUp Error : $e');
    } finally {
      isLoading(false);
    }
  }

  /// Get Fcm Token
  getUserFcmTokenFunction({required String title, required String body}) async {
    isLoading(true);
    String url = ApiUrl.getFcmTokenApi + "?id=$oppositeUserUniqueId";
    log("Get User Fcm Token : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      GetFcmTokeModel getFcmTokeModel =
          GetFcmTokeModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFcmTokeModel.success.obs;
      log("getFcmTokeModel.success : ${getFcmTokeModel.success}");
      log("getFcmTokeModel.success : ${getFcmTokeModel.statusCode}");
      log("getFcmTokeModel.success : ${getFcmTokeModel.data.fcmToken}");

      if (isSuccessStatus.value) {
        oppositeUserFcmToken = getFcmTokeModel.data.fcmToken;

        /// Send Chat Notification
        sendGeneralNotification(
          fcmToken: oppositeUserFcmToken, // Getting From API
          title: title,
          body: body,
          type: 0,
        );

        await addNotificationFunction(title: title, message: body);

        // message = "${UserDetails.userName} booked appointment for $date at $slotTime time";

        // log("oppositeUserUniqueId : oppositeUserUniqueId");
      } else {
        log("getUserFcmTokenFunction Else Else");
      }
    } catch (e) {
      log("getUserFcmTokenFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add Notification
  addNotificationFunction(
      {required String title, required String message}) async {
    isLoading(true);
    String url = ApiUrl.saveNotificationApi;
    log("Add Notification API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['Message'] = message;
      request.fields['NotificationFor'] = title;
      request.fields['NotificationFrom'] = UserDetails.uniqueId;
      request.fields['NotificationTo'] = oppositeUserUniqueId;

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        NotificationSaveModel notificationSaveModel =
            NotificationSaveModel.fromJson(json.decode(value));
        isSuccessStatus = notificationSaveModel.success.obs;

        if (isSuccessStatus.value) {
          log(notificationSaveModel.message);
        } else {
          // log(notificationSaveModel.message);
          log("Add Notification Else Else");
        }
      });
    } catch (e) {
      log("Add Notification Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAppointmentDetailsByIdFunction();
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
