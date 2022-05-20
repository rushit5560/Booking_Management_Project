import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../../vendor_side/model/vendor_additional_slot_screen_model/get_all_additional_slot_model.dart';
import '../../../vendor_side/model/vendor_schedule_time_screen_model/get_all_time_list_by_resource_id_model.dart';
import '../../model/book_appointment_screen_model/book_appointment_model.dart';
import '../../model/book_appointment_screen_model/get_booking_resources_model.dart';
import '../../model/book_appointment_screen_model/get_booking_service_model.dart';
import '../../model/book_appointment_screen_model/get_vendor_booking_model.dart';
import '../../screens/user_checkout_screen/user_checkout_screen.dart';

class BookAppointmentScreenController extends GetxController {
  int vendorId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  VendorBookingWorkerList? bookVendorDetails;
  RxBool isServiceSlot = false.obs;

  List<BookServiceWorkerList> allServicesList = [];
  List<BookingResourceWorkerData> allResourcesList = [];
  /// DD - Additional Slot
  List<AdditionalSlotWorkerList> allAdditionalSlotList = [];
  AdditionalSlotWorkerList additionalSlotWorkerList = AdditionalSlotWorkerList();

  int selectedResourceTimeSlotId = 0;
  String selectedAdditionalTime = "";
  List<int> selectedServiceList = [];
  RxString selectedDate = "".obs;
  RxString selectedTime = "".obs;
  RxBool isCalenderShow = false.obs;

  var selectDatePageController = PageController(initialPage: 0, viewportFraction: 0.16);
  RxInt selectedPageIndex = 0.obs;
  RxInt selectedTimeIndex = 0.obs;
  RxInt selectedDateIndex = 0.obs;
  //List<String> serviceLists = ['2.5 Km', '2.5 Km', '2.5 Km', '2.5 Km'];
  // List<String> dateList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
  //   '21', '22', '23', '24' , '25', '26', '27', '28', '29', '30', '31'];
  List<String> timeList = [
    '06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30',
    '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',
    '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30',
    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', '21:00', '21:30',
    '22:00', '22:30', '23:00', '23:30'
  ];
  RxString selectedTimeValue = "06:00".obs;
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
      // log("Services List API Response : ${response.body}");

      GetBookingServiceModel getBookingServiceModel = GetBookingServiceModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingServiceModel.success.obs;

      if(isSuccessStatus.value) {
        allServicesList.clear();

        allServicesList = getBookingServiceModel.workerList;
        // log("allServicesList : ${allServicesList.length}");
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
  getAllResourcesListByIdFunction({SearchType2 searchType2 = SearchType2.none}) async {
    isLoading(true);
    String url = ApiUrl.vendorBookingResourcesApi + "?Id=$vendorId";
    log("Booking Resources API URL  :$url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Resources API Response : ${response.body}");

      GetBookingResourcesModel getBookingResourcesModel = GetBookingResourcesModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingResourcesModel.success.obs;

      if(isSuccessStatus.value) {
        allResourcesList = getBookingResourcesModel.workerList;
        log("allResourcesList : ${allResourcesList.length}");

        if(searchType2 == SearchType2.dateTimeWise) {
          for(int i = 0; i < allResourcesList.length; i++) {
            allResourcesList[i].timingList =
            await getResourcesDateAndTimeListFunction(resId: allResourcesList[i].id.toString());
          }
        } else {
          for(int i = 0; i < allResourcesList.length; i++) {
            allResourcesList[i].timingList =
            await getResourcesTimeListFunction(resId: allResourcesList[i].id.toString());
          }
        }

      } else {
        log("getAllResourcesListByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getAllResourcesListByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      log("!isServiceSlot.value : ${!isServiceSlot.value}");

      if(!isServiceSlot.value) {
        await getAllAdditionalSlotFunction();
      } else {
        isLoading(false);
      }

    }

  }

  /// Get Resources Time
  getResourcesTimeListFunction({required String resId}) async {
    DateTime dateTime = DateTime.now();
    String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String timeModule = "${dateTime.hour}:${dateTime.minute}:00";
    List<TimingSlot> timeList = [];
    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi + "?Id=$resId&dDate=${dateModule}T$timeModule&Duration&Time";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList.length; i++) {
          String startTime = getAllTimeListByResourceIdModel.workerList[i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList[i].startDateTime.length-3);
          String endTime = getAllTimeListByResourceIdModel.workerList[i].endDateTime.substring(11, getAllTimeListByResourceIdModel.workerList[i].endDateTime.length-3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList[i].id,
            resourceId: getAllTimeListByResourceIdModel.workerList[i].resourceId,
            startDateTime: startTime,
            endDateTime: endTime,
            isActive: getAllTimeListByResourceIdModel.workerList[i].isActive,
            booking: getAllTimeListByResourceIdModel.workerList[i].booking,
            isSelected: false,
          ));
        }

        log("Time List : ${timeList.length}");

      } else {
        log("getResourcesTimeListFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(true);
    }

    return timeList;
  }

  /// Get Resources Date & Time Wise
  getResourcesDateAndTimeListFunction({required String resId}) async {
    // DateTime dateTime = DateTime.now();
    // String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    // String timeModule = "${dateTime.hour}:${dateTime.minute}:00";
    List<TimingSlot> timeList = [];
    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi + "?Id=$resId&dDate=${selectedDate.value}T${selectedTime.value}&Duration&Time";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList.length; i++) {
          String startTime = getAllTimeListByResourceIdModel.workerList[i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList[i].startDateTime.length-3);
          String endTime = getAllTimeListByResourceIdModel.workerList[i].endDateTime.substring(11, getAllTimeListByResourceIdModel.workerList[i].endDateTime.length-3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList[i].id,
            resourceId: getAllTimeListByResourceIdModel.workerList[i].resourceId,
            startDateTime: startTime,
            endDateTime: endTime,
            isActive: getAllTimeListByResourceIdModel.workerList[i].isActive,
            booking: getAllTimeListByResourceIdModel.workerList[i].booking,
            isSelected: false,
          ));
        }

        log("Time List : ${timeList.length}");

      } else {
        log("getResourcesTimeListFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(true);
    }

    return timeList;
  }

  /// Additional Slot
  getAllAdditionalSlotFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllAdditionalSlotApi + "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Additional Slot API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response : ${response.body}');

      GetAllAdditionalSlotModel getAllAdditionalSlotModel = GetAllAdditionalSlotModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAdditionalSlotModel.success.obs;
      log("Status Code : ${getAllAdditionalSlotModel.statusCode}");

      if (isSuccessStatus.value) {
        // allAdditionalSlotList.clear();
        allAdditionalSlotList = [];

        // if(getAllAdditionalSlotModel.workerList.isEmpty){
        //   allAdditionalSlotList.add(AdditionalSlotWorkerList(
        //     name: "Select Additional Time Slot",
        //     id: 0,
        //   ));
        // } else {
          allAdditionalSlotList = getAllAdditionalSlotModel.workerList;
          for (int i = 0; i < allAdditionalSlotList.length; i++) {
            log("allAdditionalSlotList : ${allAdditionalSlotList[i].name}");
          }
        // }

      } else {
        log("Something went wrong!");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("getAllAdditionalSlotFunction Error ::: $e");
    } finally {
      // if(!isServiceSlot.value){
      //   await getVendorAllAdditionalSlotFunction();
      // } else {
        isLoading(false);
      // }
    }

  }

  /// Book Slot
  bookSelectedSlotFunction() async {
    String s1 = selectedServiceList.toString();
    String s2 = s1.substring(1, s1.length-1);
    String serviceId = s2.replaceAll(" ", "");

    isLoading(true);
    String url = ApiUrl.bookSelectedSlotApi + "?ResourceId=$selectedResourceTimeSlotId&VendorId=${UserDetails.tableWiseId}&ServiceId=$serviceId";
    log("Book Selected Slot API URL : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers);
      log("Book Slot API Response : ${response.body}");

      BookAppointmentModel bookAppointmentModel = BookAppointmentModel.fromJson(json.decode(response.body));
      isSuccessStatus = bookAppointmentModel.success.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: bookAppointmentModel.message);
        String bookingId = bookAppointmentModel.id;
        log("bookingId : $bookingId");
        Get.to(() => UserCheckoutScreen(), arguments: bookingId);
      } else {
        log("bookSelectedSlotFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("bookSelectedSlotFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  /// Book Available Time Slot
  bookAvailableTimeSlotFunction() async {
    isLoading(true);
    String url = selectedAdditionalTime.isEmpty
    ? ApiUrl.bookSelectedAvailableTimeSlotApi + "?ResourceId=$selectedResourceTimeSlotId&VendorId=${UserDetails.tableWiseId}&Duration"
    : ApiUrl.bookSelectedAvailableTimeSlotApi + "?ResourceId=$selectedResourceTimeSlotId&VendorId=${UserDetails.tableWiseId}&Duration=$selectedAdditionalTime";
    log("Book Available Time Slot API URL : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers);
      log("Book Available Time Slot Response : ${response.body}");

      BookAppointmentModel bookAppointmentModel = BookAppointmentModel.fromJson(json.decode(response.body));
      isSuccessStatus = bookAppointmentModel.success.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: bookAppointmentModel.message);
        String bookingId = bookAppointmentModel.id;
        log("bookingId : $bookingId");
        Get.to(() => UserCheckoutScreen(), arguments: bookingId);
      } else {
        log("bookAvailableTimeSlotFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("bookAvailableTimeSlotFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  /// Get All Additional Slot
  // getVendorAllAdditionalSlotFunction() async {
  //   isLoading(true);
  //   String url = ApiUrl.vendorGetAllAdditionalSlotApi + "?VendorId=${UserDetails.tableWiseId}";
  //   log("Get All Additional Slot API URL : $url");
  //
  //   try {
  //     http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
  //     log('Response : $response');
  //
  //     GetAllAdditionalSlotModel getAllAdditionalSlotModel = GetAllAdditionalSlotModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = getAllAdditionalSlotModel.success.obs;
  //     log("Status Code : ${getAllAdditionalSlotModel.statusCode}");
  //
  //     if (isSuccessStatus.value) {
  //       // allAdditionalSlotList.clear();
  //       allAdditionalSlotList = [];
  //       allAdditionalSlotList = getAllAdditionalSlotModel.workerList;
  //       for(int i = 0; i < allAdditionalSlotList.length; i++) {
  //         log("allAdditionalSlotList : ${allAdditionalSlotList[i].name}");
  //       }
  //     } else {
  //       log("Something went wrong!");
  //       Fluttertoast.showToast(msg: "Something went wrong!");
  //     }
  //
  //
  //   } catch(e) {
  //     log("getAllAdditionalSlotFunction Error ::: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  //
  // }


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