import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/appointment_details_screen_models/appointment_details_model.dart';
import '../../model/vendor_appointment_list_screen_models/appointment_status_change_model.dart';



class AppointmentDetailsScreenController extends GetxController {
  /// "appointmentId" From Appointment List Screen
  int appointmentId = Get.arguments[0];
  String status = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  AppointmentDetailsData appointmentDetailsData = AppointmentDetailsData();

  String oppositeUserUniqueId = "";

  /// Get Appointment Details
  getAppointmentDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentDetailsApi + "?id=$appointmentId";
    log("Appointment Details API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment Details Response : ${response.body}");

      AppointmentDetailsModel appointmentDetailsModel = AppointmentDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentDetailsModel.success.obs;

      if(isSuccessStatus.value) {
        appointmentDetailsData = appointmentDetailsModel.data;
        oppositeUserUniqueId = appointmentDetailsModel.data.customer!.userId;
        log("appointmentDetailsData :: $appointmentDetailsData");
      } else {
        log("getAppointmentDetailsByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("getAppointmentDetailsByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Appointment for Confirm
  confirmAppointmentByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentStatusChangeApi + "?status=Confirm&id=$appointmentId";
    log("Appointment Status Change API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Appointment Details API Response : ${response.body}");

      AppointmentStatusChangeModel appointmentStatusChangeModel = AppointmentStatusChangeModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentStatusChangeModel.success.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "Appointment Confirmed!");
        /// Confirm Notification Send
        sendGeneralNotification(
          oppositeUserUniqueId,
          "Appointment Confirmed!",
          "Title",
          0,
        );
        // Get.back();
      } else {
        log("confirmAppointmentByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch(e) {
      log("confirmAppointmentByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }
  }

  /// Appointment for Done
  doneAppointmentByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentStatusChangeApi + "?status=Done&id=$appointmentId";
    log("Appointment Status Change API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Appointment Details API Response : ${response.body}");

      AppointmentStatusChangeModel appointmentStatusChangeModel = AppointmentStatusChangeModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentStatusChangeModel.success.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "Appointment Done!");
        /// Done Noti Send
        sendGeneralNotification(
          UserDetails.fcmToken,
          "Appointment Done!",
          "Title",
          0,
        );
        // Get.back();
      } else {
        log("confirmAppointmentByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch(e) {
      log("confirmAppointmentByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }
  }

  /// Appointment for Cancel
  cancelAppointmentByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAppointmentStatusChangeApi + "?status=Cancel&id=$appointmentId";
    log("Cancel Appointment Status Change API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Cancel Appointment Details API Response : ${response.body}");

      AppointmentStatusChangeModel appointmentStatusChangeModel = AppointmentStatusChangeModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentStatusChangeModel.success.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "Appointment Canceled!");
        sendGeneralNotification(
          UserDetails.fcmToken,
          "Appointment Canceled!",
          "Title",
          0,
        );
      } else {
        log("cancelAppointmentByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch(e) {
      log("cancelAppointmentByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAppointmentDetailsByIdFunction();
    super.onInit();
  }


  static void sendGeneralNotification(
      String fcmToken,
      String body,
      String title,
      int type,
      ) async {

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

    Get.back();
  }

}