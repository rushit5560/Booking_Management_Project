import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';

import '../../model/booking_success_screen_model/booking_success_model.dart';

class BookingSuccessScreenController extends GetxController {
  /// Getting from checkout screen
  String successId = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  ApiHeader apiHeader = ApiHeader();

  String bookingId = "";
  String vendorName = "";
  String date = "";
  String slotTime = "";

  /// Getting Booking Success
  getBookingSuccessFunction() async {
    isLoading(true);
    String url = ApiUrl.bookingSuccessApi + "?id=$successId";
    log("Success API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Booking Success Response : ${response.body}");

      BookingSuccessModel bookingSuccessModel = BookingSuccessModel.fromJson(json.decode(response.body));
      isSuccessStatus = bookingSuccessModel.success.obs;

      if(isSuccessStatus.value) {
        bookingId = bookingSuccessModel.workerList.bookingId;
        // vendorName = bookingSuccessModel.
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
      isLoading(false);
    }

  }



  @override
  void onInit() {
    getBookingSuccessFunction();
    super.onInit();
  }



}