import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../vendor_side/model/vendor_schedule_time_screen_model/get_all_time_list_by_resource_id_model.dart';
import '../../model/book_appointment_screen_model/get_booking_resources_model.dart';
import '../../model/book_appointment_screen_model/get_booking_service_model.dart';
import '../../model/book_appointment_screen_model/get_vendor_booking_model.dart';

class BookAppointmentScreenController extends GetxController {
  int vendorId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  VendorBookingWorkerList? bookVendorDetails;
  RxBool isServiceSlot = false.obs;

  List<BookServiceWorkerList> allServicesList = [];
  List<BookingResourceWorkerData> allResourcesList = [];

  var selectDatePageController = PageController(initialPage: 0, viewportFraction: 0.16);
  RxInt selectedPageIndex = 0.obs;
  RxInt selectedTimeIndex = 0.obs;
  RxInt selectedDateIndex = 0.obs;
  //List<String> serviceLists = ['2.5 Km', '2.5 Km', '2.5 Km', '2.5 Km'];
  List<String> dateList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24' , '25', '26', '27', '28', '29', '30', '31'];
  List<String> timeList = [
    '10:00 AM',
    '11:00 AM',
    '11:15 AM',
    '11:35 AM',
    '12:00 AM',
    '12:05 AM',
    '01:20 AM',
    '01:40 AM',
  ];
  RxString date = '23-Mar-2022'.obs;
  RxString time = '6:35 PM'.obs;

  selectDatePreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  selectDateNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }


  /// Get Booking Vendor
  getBookVendorDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorBookingDetailsApi + "?Id=$vendorId";
    log("Book Vendor Details API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Book Vendor Details Response : ${response.body}");

      GetVendorBookingModel getVendorBookingModel = GetVendorBookingModel.fromJson(json.decode(response.body));
      isSuccessStatus = getVendorBookingModel.success.obs;

      if(isSuccessStatus.value) {
        bookVendorDetails = getVendorBookingModel.workerList;
        isServiceSlot.value = getVendorBookingModel.workerList.vendor.isServiceSlots;
        log("isServiceSlot : ${isServiceSlot.value}");

      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getBookVendorDetailsByIdFunction Else Else");
      }


    } catch(e) {
      log("getBookVendorDetailsByIdFunction Error ::: $e");
    } finally {
      // isLoading(false);
      if(isServiceSlot.value) {
        await getServicesListByIdFunction();
      } else {
        await getAllResourcesListByIdFunction();
      }
    }
  }

  /// Get Services List
  getServicesListByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorServicesApi + "?Id=$vendorId";
    log("Get Services List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Services List API Response : ${response.body}");

      GetBookingServiceModel getBookingServiceModel = GetBookingServiceModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingServiceModel.success.obs;

      if(isSuccessStatus.value) {
        allServicesList.clear();

        allServicesList = getBookingServiceModel.workerList;
        log("allServicesList : ${allServicesList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getServicesListByIdFunction Else Else");
      }

    } catch(e) {
      log("getServicesListByIdFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getAllResourcesListByIdFunction();
    }
  }

  /// Get Resources List
  getAllResourcesListByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorBookingResourcesApi + "?Id=$vendorId";
    log("Booking Resources API URL  :$url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Resources API Response : ${response.body}");

      GetBookingResourcesModel getBookingResourcesModel = GetBookingResourcesModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingResourcesModel.success.obs;

      if(isSuccessStatus.value) {
        allResourcesList = getBookingResourcesModel.workerList;
        log("allResourcesList : ${allResourcesList.length}");

        for(int i = 0; i < allResourcesList.length; i++) {
          allResourcesList[i].timingList = await getResourcesTimeListFunction(resId: allResourcesList[i].id.toString());
        }

      } else {
        log("getAllResourcesListByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getAllResourcesListByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }

  }

  /// Get Resources Time
  getResourcesTimeListFunction({required String resId}) async {
    DateTime dateTime = DateTime.now();
    String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String timeModule = "${dateTime.hour}:${dateTime.minute}:00";
    List<String> timeList = [];
    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi + "?Id=$resId&dDate=${dateModule}T$timeModule&Duration&Time";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList.length; i++) {
          String t = getAllTimeListByResourceIdModel.workerList[i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList.length-3);
          timeList.add(t);
        }

        log("Time List : $timeList");

      } else {
        log("getResourcesTimeListFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
    } finally {
      isLoading(true);
    }

    return timeList;
  }

  @override
  void onInit() {
    getBookVendorDetailsByIdFunction();
    super.onInit();
  }


  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}