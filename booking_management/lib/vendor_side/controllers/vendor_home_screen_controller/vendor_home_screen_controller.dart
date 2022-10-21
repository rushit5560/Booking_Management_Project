import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/model/book_appointment_screen_model/get_booking_resources_model.dart';
import 'package:booking_management/vendor_side/model/vendor_home_screen_models/booking_availability_model.dart';
import 'package:booking_management/vendor_side/model/vendor_home_screen_models/vendor_home_screen_models.dart';
import 'package:booking_management/vendor_side/model/vendor_schedule_time_screen_model/get_all_time_list_by_resource_id_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/vendor_appointment_list_screen_models/appointment_list_model.dart';

class VendorHomeScreenController extends GetxController {
  TextEditingController searchAppointmentFieldController =
      TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;
  // List<Pending> pendingList = [];
  List<AppointmentListModule> allAppointmentList = [];
  List<AppointmentListModule> pendingAppointmentList = [];

  List<BookingResourceWorkerData> allResourcesList = [];

  ApiHeader apiHeader = ApiHeader();

  // BottomSheet Texts
  String customerName = "";
  String vendorName = "";
  List<String> serviceName = [];
  String details = "";
  String availability = "";
  String amountPaid = "";

  RxBool isBookingAvailability = false.obs;
  String bookingAvailabilityString = "";

  /// Pending Appointments
  getAppointmentListFunction() async {
    String todayDateString = todayDate();
    isLoading(true);
    String url = ApiUrl.vendorAppointmentList +
        "?UserId=${UserDetails.uniqueId}" +
        "&Status=&dDate=$todayDateString";
    log("Appointment List APi ULR : $url");
    log('header: ${apiHeader.headers}');

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment List Response : ${response.body}");

      AppointmentListModel appointmentListModel =
          AppointmentListModel.fromJson(json.decode(response.body));
      isSuccessStatus = appointmentListModel.success.obs;

      if (appointmentListModel.message.contains("No Record Found")) {
        Fluttertoast.showToast(msg: appointmentListModel.message);
      }

      if (isSuccessStatus.value) {
        allAppointmentList.clear();
        allAppointmentList = appointmentListModel.data;

        for (int i = 0; i < allAppointmentList.length; i++) {
          if (allAppointmentList[i].status == "Pending" ||
              allAppointmentList[i].status == "Confirm") {
            pendingAppointmentList.add(allAppointmentList[i]);
          }
        }

        log("allAppointmentList : ${allAppointmentList.length}");
        log("pendingAppointmentList : ${pendingAppointmentList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getAppointmentListFunction Else Else");
      }
    } catch (e) {
      log("getAppointmentListFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getResourcesFunction();
    }
  }

  Future<void> getResourcesFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorDashboardResourceListApi +
        "?Id=${UserDetails.tableWiseId}";
    log("Get Resources api url : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log("Get Resources api response code : ${response.statusCode}");
      log("Get Resources api response : ${response.body}");

      GetBookingResourcesModel getBookingResourcesModel =
          GetBookingResourcesModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingResourcesModel.success.obs;

      if (isSuccessStatus.value) {
        allResourcesList = getBookingResourcesModel.workerList;
        log("allResourcesList : ${allResourcesList.length}");

        for (int i = 0; i < allResourcesList.length; i++) {
          allResourcesList[i].timingList = await getResourcesScheduleFunction(
              resId: allResourcesList[i].id.toString());
        }
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getResourcesFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getBookingAvailabilityFunction();
    }
  }

  getResourcesScheduleFunction({required String resId}) async {
    isLoading(true);
    DateTime dateTime = DateTime.now();
    String hour = "${dateTime.hour}";
    String minute = "${dateTime.minute}";

    /// For Hour Format
    for (int i = 0; i < 10; i++) {
      if (dateTime.hour.toString() == i.toString()) {
        if (dateTime.hour.toString().length == 1) {
          hour = "0${dateTime.hour}";
        }
      }
    }

    /// For Minute
    for (int i = 0; i < 10; i++) {
      if (dateTime.minute.toString() == i.toString()) {
        if (dateTime.minute.toString().length == 1) {
          minute = "0${dateTime.minute}";
        }
      }
    }

    String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String timeModule = "$hour:$minute:00";

    log("dateTime : $dateTime");
    log("timeModule : $timeModule");
    List<TimingSlot> timeList = [];

    // String url = ApiUrl.vendorResourceScheduleApi + "?Id=$resId""&dDate=2022-6-19T$timeModule";
    String url = ApiUrl.vendorResourceScheduleApi +
        "?Id=$resId" "&dDate=${dateModule}T$timeModule";
    log("Resources Schedule url : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel =
          GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllTimeListByResourceIdModel.success.obs;

      if (isSuccessStatus.value) {
        for (int i = 0;
            i < getAllTimeListByResourceIdModel.workerList!.length;
            i++) {
          String startTime = getAllTimeListByResourceIdModel
              .workerList![i].startDateTime
              .substring(
                  11,
                  getAllTimeListByResourceIdModel
                          .workerList![i].startDateTime.length -
                      3);
          String endTime = getAllTimeListByResourceIdModel
              .workerList![i].endDateTime
              .substring(
                  11,
                  getAllTimeListByResourceIdModel
                          .workerList![i].endDateTime.length -
                      3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList![i].id,
            resourceId:
                getAllTimeListByResourceIdModel.workerList![i].resourceId,
            startDateTime: startTime,
            endDateTime: endTime,
            isActive: getAllTimeListByResourceIdModel.workerList![i].isActive,
            booking: getAllTimeListByResourceIdModel.workerList![i].booking,
            isSelected: false,
          ));
        }
        log("Time List : ${timeList.length}");
      } else {
        log("getResourcesTimeListFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getResourcesScheduleFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }

    return timeList;
  }

  Future<void> getBookingDetailsFunction({required String bookingId}) async {
    // isLoading(true);
    String url = ApiUrl.bookingDetailsApi + "?id=$bookingId";
    log("Booking Details Api Url : $url");
    log('header: ${apiHeader.headers}');
    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("getBookingDetailsFunction Api Response : ${response.body}");

      BookingDetailsModel bookingDetailsModel =
          BookingDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = bookingDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        serviceName.clear();
        customerName = bookingDetailsModel.workerList.bookingData.firstName;
        vendorName = bookingDetailsModel.workerList.bookingData.vendor.userName;

        for (int i = 0; i < bookingDetailsModel.list.length; i++) {
          serviceName.add(bookingDetailsModel.list[i]);
        }
        details = bookingDetailsModel.workerList.resource.details;
        amountPaid = bookingDetailsModel.workerList.resource.price.toString();

        String s1 = bookingDetailsModel.workerList.startDateTime;
        String startTime = s1.substring(11, s1.length - 3);

        String s2 = bookingDetailsModel.workerList.endDateTime;
        String endTime = s2.substring(11, s2.length - 3);

        availability = "$startTime To $endTime";
      } else {
        log("getBookingDetailsFunction Else Else");
      }
    } catch (e) {
      log("getBookingDetailsFunction Error ::: $e");
      rethrow;
    } finally {
      // isLoading(false);
    }
  }

  // todo - Get Booking Availability Function
  Future<void> getBookingAvailabilityFunction() async {
    isLoading(true);
    String url =
        ApiUrl.getBookingAvailabilityApi + "?userId=${UserDetails.uniqueId}";

    log("get appointment details url : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log("getBookingAvailabilityFunction header : ${apiHeader.headers}");
      log("getBookingAvailabilityFunction Response : ${response.body}");

      BookingAvailabilityModel bookingAvailabilityModel =
          BookingAvailabilityModel.fromJson(json.decode(response.body));
      isSuccessStatus = bookingAvailabilityModel.success.obs;

      if (isSuccessStatus.value) {
        isBookingAvailability = bookingAvailabilityModel.availability.obs;
        bookingAvailabilityString = bookingAvailabilityModel.message;
      } else {
        log("getBookingAvailabilityFunction Else");
      }
    } catch (e) {
      log("getBookingAvailabilityFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAppointmentListFunction();
    super.onInit();
  }

  String todayDate() {
    DateTime dateTime = DateTime.now();

    String month = '';
    if (dateTime.month == 1) {
      month = "january";
    } else if (dateTime.month == 2) {
      month = "february";
    } else if (dateTime.month == 3) {
      month = "March";
    } else if (dateTime.month == 4) {
      month = "April";
    } else if (dateTime.month == 5) {
      month = "May";
    } else if (dateTime.month == 6) {
      month = "June";
    } else if (dateTime.month == 7) {
      month = "July";
    } else if (dateTime.month == 8) {
      month = "August";
    } else if (dateTime.month == 9) {
      month = "September";
    } else if (dateTime.month == 10) {
      month = "October";
    } else if (dateTime.month == 11) {
      month = "November";
    } else if (dateTime.month == 12) {
      month = "December";
    }

    return "${dateTime.day}/$month/${dateTime.year}";
  }
}
