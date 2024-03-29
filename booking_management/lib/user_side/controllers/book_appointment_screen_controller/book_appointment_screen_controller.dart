import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/model/user_business_details_model/add_vendor_in_favourite_model.dart';
import 'package:booking_management/user_side/model/vendor_details_screen_models/vendor_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../../common_modules/sharedpreference_data/sharedpreference_data.dart';
import '../../../common_ui/model/sign_in_screen_model/sign_in_screen_model.dart';
import '../../../common_ui/model/sign_in_screen_model/sign_vendor_model.dart';
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
  RxInt isStatus = 0.obs;

  ApiHeader apiHeader = ApiHeader();

  bool selectedResourceIsEvent = false;
  int selectedResource = 0;

  RxBool isIosPlatform = false.obs;

  /// Fb Login
  FacebookUserProfile? profile;
  final FacebookLogin plugin = FacebookLogin(debug: true);

  VendorBookingWorkerList? bookVendorDetails;
  RxBool isServiceSlot = false.obs;

  String resourcePrefix = "";

  List<BookServiceWorkerList> allServicesList = [];
  List<BookingResourceWorkerData> allResourcesList = [];

  RxString commonSlotPrice = "0.0".obs;

  /// DD - Additional Slot
  List<AdditionalSlotWorkerList> allAdditionalSlotList = [];
  AdditionalSlotWorkerList additionalSlotWorkerList =
      AdditionalSlotWorkerList();

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  int selectedResourceTimeSlotId = 0;
  String selectedAdditionalTime = "";
  List<int> selectedServiceList = [];
  RxString selectedDate = "".obs;
  RxString selectedShowDate = "".obs;
  RxString selectedTime = "".obs;
  RxBool isServiceCalenderShow = false.obs;
  RxBool isCalenderShow = false.obs;
  RxInt selectedTimeIndex = 0.obs;
  RxBool isPriceDisplay = false.obs;
  String vendorUniqueId = "";

  List<String> timeList = [
    'Any Time',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30'
  ];
  RxString selectedTimeValue = "Any Time".obs;

  RxBool isEvent = false.obs;

  VendorDetailsData vendorDetailsData = VendorDetailsData();

  /// 1) Get Booking Vendor
  getBookVendorDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorBookingDetailsApi + "?Id=$vendorId";
    log("Book Vendor Details API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Book Vendor Details Response : ${response.body}");

      GetVendorBookingModel getVendorBookingModel =
          GetVendorBookingModel.fromJson(json.decode(response.body));
      isSuccessStatus = getVendorBookingModel.success.obs;

      if (isSuccessStatus.value) {
        bookVendorDetails = getVendorBookingModel.workerList;
        resourcePrefix =
            getVendorBookingModel.workerList.vendor.categories.prefix;
        isServiceSlot.value =
            getVendorBookingModel.workerList.vendor.isServiceSlots;
        isPriceDisplay.value =
            getVendorBookingModel.workerList.vendor.isPriceDisplay;
        vendorUniqueId = getVendorBookingModel.workerList.vendor.userId;
        log("isServiceSlot : ${isServiceSlot.value}");
        log("isPriceDisplay : ${isPriceDisplay.value}");
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
        log("getBookVendorDetailsByIdFunction Else Else");
      }
    } catch (e) {
      log("getBookVendorDetailsByIdFunction Error ::: $e");
    } /*finally {
      // isLoading(false);
      if (isServiceSlot.value) {
        await getServicesListByIdFunction();
      } else {
        await getAllResourcesListByIdFunction();
        await getAllAdditionalSlotFunction();
      }
    }*/
    if (isServiceSlot.value) {
      await getServicesListByIdFunction();
    } else {
      await getAllResourcesListByIdFunction();
      await getAllAdditionalSlotFunction();
    }
  }

  /// 2) Get Services List
  getServicesListByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorServicesApi + "?Id=$vendorId";
    log("Get Services List API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      // log("Services List API Response : ${response.body}");

      GetBookingServiceModel getBookingServiceModel =
          GetBookingServiceModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingServiceModel.success.obs;

      if (isSuccessStatus.value) {
        allServicesList.clear();

        allServicesList = getBookingServiceModel.workerList;
      } else {
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
        log("getServicesListByIdFunction Else Else");
      }
    } catch (e) {
      log("getServicesListByIdFunction Error ::: $e");
    } /*finally {
      // isLoading(false);
      await getAllResourcesListByIdFunction();
    }*/

    await getAllResourcesListByIdFunction();
  }

  /// 2 & 3) Get Resources List
  getAllResourcesListByIdFunction(
      {SearchType2 searchType2 = SearchType2.none}) async {
    isLoading(true);
    String url = ApiUrl.vendorBookingResourcesApi + "?Id=$vendorId";
    log("Booking Resources API URL  :$url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      // log("Resources API Response : ${response.body}");

      GetBookingResourcesModel getBookingResourcesModel =
          GetBookingResourcesModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingResourcesModel.success.obs;

      if (isSuccessStatus.value) {
        allResourcesList = getBookingResourcesModel.workerList;

        for (int i = 0; i < getBookingResourcesModel.workerList.length; i++) {
          if (getBookingResourcesModel.workerList[i].isEvent == true) {
            isEvent = getBookingResourcesModel.workerList[i].isEvent.obs;
          }
          log('isEvent: $isEvent');
        }
        log("allResourcesList : ${allResourcesList.length}");

        if (searchType2 == SearchType2.none) {
          log("searchType2 : $searchType2");
          if (selectedServiceList.isEmpty) {
            for (int i = 0; i < allResourcesList.length; i++) {
              Map<String, dynamic> mapData = await getResourcesTimeListFunction(
                  resId: allResourcesList[i].id.toString());
              log("mapData : $mapData");
              allResourcesList[i].timingList = mapData["timeList"];
              allResourcesList[i].nextDate = mapData["nextDate"];
            }
          } else if (selectedServiceList.isNotEmpty) {
            for (int i = 0; i < allResourcesList.length; i++) {
              Map<String, dynamic> mapData =
                  await getSelectedResourcesTimeSlotFunction(
                      resId: allResourcesList[i].id.toString());
              allResourcesList[i].timingList = mapData["timeList"];
              allResourcesList[i].nextDate = mapData["nextDate"];
            }
          }
        } else if (searchType2 == SearchType2.anyTimeWithAdditionalSlotWise) {
          log("searchType2 : $searchType2");
          for (int i = 0; i < allResourcesList.length; i++) {
            Map<String, dynamic> mapData =
                await getResourcesAdditionalSlotAndAnytimeFunction(
                    resId: allResourcesList[i].id.toString());
            allResourcesList[i].timingList = mapData["timeList"];
            allResourcesList[i].nextDate = mapData["nextDate"];
            log("allResourcesList[i].id ${allResourcesList[i].id}");
          }
        } else if (searchType2 == SearchType2.anyTimeWise) {
          log("searchType2 : $searchType2");
          for (int i = 0; i < allResourcesList.length; i++) {
            Map<String, dynamic> mapData = await getResourcesAndAnytimeFunction(
                resId: allResourcesList[i].id.toString());
            allResourcesList[i].timingList = mapData["timeList"];
            allResourcesList[i].nextDate = mapData["nextDate"];
          }
        } else if (searchType2 == SearchType2.additionalSlotWise) {
          log("searchType2 : $searchType2");
          for (int i = 0; i < allResourcesList.length; i++) {
            Map<String, dynamic> mapData =
                await getResourcesAdditionalSlotFunction(
                    resId: allResourcesList[i].id.toString());
            allResourcesList[i].timingList = mapData["timeList"];
            allResourcesList[i].nextDate = mapData["nextDate"];
          }
        } else if (searchType2 == SearchType2.dateTimeWise) {
          log("searchType2 : $searchType2");
          if (selectedServiceList.isEmpty) {
            for (int i = 0; i < allResourcesList.length; i++) {
              Map<String, dynamic> mapData =
                  await getResourcesDateAndTimeListFunction(
                      resId: allResourcesList[i].id.toString());
              allResourcesList[i].timingList = mapData["timeList"];
              allResourcesList[i].nextDate = mapData["nextDate"];
            }
          } else if (selectedServiceList.isNotEmpty) {
            for (int i = 0; i < allResourcesList.length; i++) {
              Map<String, dynamic> mapData =
                  await getSelectedResourcesTimeSlotFunction(
                      resId: allResourcesList[i].id.toString());
              allResourcesList[i].timingList = mapData["timeList"];
              allResourcesList[i].nextDate = mapData["nextDate"];
            }
          }
        }
      } else {
        log("getAllResourcesListByIdFunction Else Else");
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      log("getAllResourcesListByIdFunction Error ::: $e");
      Fluttertoast.showToast(
          msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
    } /*finally {
      log("isServiceSlot.value : ${isServiceSlot.value}");
      selectedResourceTimeSlotId = 0;
      isLoading(false);

      // if(isServiceSlot.value == true) {
      //   isLoading(false);
      // } else if(isServiceSlot.value == false){
      //   await getAllAdditionalSlotFunction();
      // }

    }*/

    log("isServiceSlot.value : ${isServiceSlot.value}");
    selectedResourceTimeSlotId = 0;
    isLoading(false);
  }

  /// 4) Get Resources Time List
  getResourcesTimeListFunction({required String resId}) async {
    log("Resource Id : $resId");
    // DateTime dateTime = DateTime.now();
    String nextDate = "";

    // String hour = "${dateTime.hour}";
    // String minute = "${dateTime.minute}";

    // /// For Hour Format
    // for (int i = 0; i < 10; i++) {
    //   if (dateTime.hour.toString() == i.toString()) {
    //     if (dateTime.hour.toString().length == 1) {
    //       hour = "0${dateTime.hour}";
    //     }
    //   }
    // }

    // /// For Minute
    // for (int i = 0; i < 10; i++) {
    //   if (dateTime.minute.toString() == i.toString()) {
    //     if (dateTime.minute.toString().length == 1) {
    //       minute = "0${dateTime.minute}";
    //     }
    //   }
    // }

    // String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    // String timeModule = "$hour:$minute:00";
    // log("dateTime : $dateTime");
    // log("timeModule : $timeModule");
    List<TimingSlot> timeList = [];
    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi +
        "?Id=$resId&dDate=${selectedDate.value}T${selectedTime.value}&Duration";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel =
          GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllTimeListByResourceIdModel.success.obs;

      if (isSuccessStatus.value) {
        nextDate = getAllTimeListByResourceIdModel.nextDate;

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
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(
          msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
    } /*finally {
      isLoading(true);
    }*/

    isLoading(true);

    // return [timeList, nextDate];
    return {"timeList": timeList, "nextDate": nextDate};
  }

  /// 4) Get Selected Resource Time List
  getSelectedResourcesTimeSlotFunction(
      {required String resId, required}) async {
    log("Resource Id : $resId");
    DateTime dateTime = DateTime.now();
    String nextDate = "";

    bool isToday = selectedDate.value ==
        "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    log("isToday isToday isToday :$isToday");

    String s1 = selectedServiceList.toString();
    String s2 = s1.substring(1, s1.length - 1);
    String serviceId = s2.replaceAll(" ", "");

    // String hour = "${dateTime.hour}";
    // String minute = "${dateTime.minute}";

    /// For Hour Format
    // for (int i = 0; i < 10; i++) {
    //   if (dateTime.hour.toString() == i.toString()) {
    //     if (dateTime.hour.toString().length == 1) {
    //       hour = "0${dateTime.hour}";
    //     }
    //   }
    // }

    // /// For Minute
    // for (int i = 0; i < 10; i++) {
    //   if (dateTime.minute.toString() == i.toString()) {
    //     if (dateTime.minute.toString().length == 1) {
    //       minute = "0${dateTime.minute}";
    //     }
    //   }
    // }

    // String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    // String timeModule = "$hour:$minute:00";
    // log("dateTime : $dateTime");
    // log("timeModule : $timeModule");
    List<TimingSlot> timeList = [];
    isLoading(true);
    String url = isToday == true
        ? ApiUrl.selectedServicesWiseResourceSlotSearchApi +
            "?Id=$resId&dDate=${selectedDate.value}T${selectedTime.value}&Service=$serviceId"
        : ApiUrl.selectedServicesWiseResourceSlotSearchApi +
            "?Id=$resId&dDate=${selectedDate.value}&Service=$serviceId";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel =
          GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllTimeListByResourceIdModel.success.obs;

      if (isSuccessStatus.value) {
        nextDate = getAllTimeListByResourceIdModel.nextDate;

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
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(
          msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
    } /*finally {
      isLoading(true);
    }*/

    isLoading(true);

    // return timeList;
    return {"timeList": timeList, "nextDate": nextDate};
  }

  // ///4) Get Selected Service wise resource time list
  // getSelectedServiceWiseResourceSlotFunction() async {
  //   String s1 = selectedServiceList.toString();
  //   String s2 = s1.substring(1, s1.length-1);
  //   String serviceId = s2.replaceAll(" ", "");
  //   List<TimingSlot> timeList = [];
  //
  //   isLoading(true);
  //   String url = ApiUrl.selectedServicesWiseResourceSlotApi + "?Id=$vendorId" + "&Service=$serviceId";
  //   log("Selected Service Wise Resource Slot Api Url : $url");
  //
  //   try {
  //     http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
  //   } catch(e) {
  //     log("Selected Service Wise Resource Slot Error ::: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  //
  // }

  /// 4) Get Resources Date & Time Wise List
  getResourcesDateAndTimeListFunction({required String resId}) async {
    List<TimingSlot> timeList = [];
    String nextDate = "";

    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi +
        "?Id=$resId&dDate=${selectedDate.value}T${selectedTime.value}&Duration";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel =
          GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllTimeListByResourceIdModel.success.obs;

      if (isSuccessStatus.value) {
        nextDate = getAllTimeListByResourceIdModel.nextDate;

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
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(
          msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
    } /* finally {
      isLoading(true);
    }*/

    isLoading(true);

    // return timeList;
    return {"timeList": timeList, "nextDate": nextDate};
  }

  /// 4) Get Resources Additional Slot & Anny Time Wise List
  getResourcesAdditionalSlotAndAnytimeFunction({required String resId}) async {
    List<TimingSlot> timeList = [];
    String nextDate = "";

    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi +
        "?Id=$resId&dDate=${selectedDate.value}&Duration=${additionalSlotWorkerList.id}";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel =
          GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllTimeListByResourceIdModel.success.obs;

      if (isSuccessStatus.value) {
        nextDate = getAllTimeListByResourceIdModel.nextDate;

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
        Fluttertoast.showToast(
            msg: getAllTimeListByResourceIdModel.errorMessage,
            toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      log("getResourcesTimeListFunction Error ::: $e");
      // Fluttertoast.showToast(msg: "Something went wrong!");
      Fluttertoast.showToast(
          msg:
              "Selected resource slot is available but rest of the slot are already reserved. Please select another slot.",
          toastLength: Toast.LENGTH_SHORT);
    } /*finally {
      isLoading(true);
    }*/

    isLoading(true);

    // return timeList;
    return {"timeList": timeList, "nextDate": nextDate};
  }

  /// 4) Get Resources Any Time Wise List
  getResourcesAndAnytimeFunction({required String resId}) async {
    List<TimingSlot> timeList = [];
    String nextDate = "";

    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi +
        "?Id=$resId&dDate=${selectedDate.value}&Duration";
    log("Get Resources Time List API URL Date wise: $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel =
          GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllTimeListByResourceIdModel.success.obs;

      if (isSuccessStatus.value) {
        nextDate = getAllTimeListByResourceIdModel.nextDate;

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
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
        // Fluttertoast.showToast(msg: getAllTimeListByResourceIdModel.errorMessage);
      }
    } catch (e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(
          msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
    } /*finally {
      isLoading(true);
    }*/
    isLoading(true);
    // return timeList;
    return {"timeList": timeList, "nextDate": nextDate};
  }

  /// 4) Get Resources Additional Slot Wise List
  getResourcesAdditionalSlotFunction({required String resId}) async {
    List<TimingSlot> timeList = [];

    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi +
        "?Id=$resId&dDate=${selectedDate.value}T${selectedTime.value}&Duration=${additionalSlotWorkerList.id}";
    log("Get Resources Additional Time API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Resource Time List : ${response.body}");

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
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
        // Fluttertoast.showToast(msg: getAllTimeListByResourceIdModel.errorMessage);
      }
    } catch (e) {
      log("getResourcesTimeListFunction Error ::: $e");
      // Fluttertoast.showToast(msg: "Something went wrong!");
      Fluttertoast.showToast(
          msg:
              "Selected resource slot is available but rest of the slot are already reserved. Please select another slot.",
          toastLength: Toast.LENGTH_SHORT);
    } /*finally {
      isLoading(true);
    }*/
    isLoading(true);

    return timeList;
  }

  /// 5) Additional Slot
  getAllAdditionalSlotFunction() async {
    isLoading(true);

    String url = ApiUrl.vendorGetAllAdditionalSlotApi + "?VendorId=$vendorId";
    log("Get All Additional Slot API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log('Response : ${response.body}');

      GetAllAdditionalSlotModel getAllAdditionalSlotModel =
          GetAllAdditionalSlotModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAdditionalSlotModel.success.obs;
      log("Status Code : ${getAllAdditionalSlotModel.statusCode}");

      if (isSuccessStatus.value) {
        allAdditionalSlotList.clear();

        /// Add Initial Value
        allAdditionalSlotList.add(
            AdditionalSlotWorkerList(id: 0, name: "Select Additional Slot"));

        /// Add Backend values
        allAdditionalSlotList.addAll(getAllAdditionalSlotModel.workerList);

        /// Set First Value of list in DD Value Object
        additionalSlotWorkerList = allAdditionalSlotList[0];
        log('additionalSlotWorkerList: $additionalSlotWorkerList');
        // }

      } else {
        log("Something went wrong!");
        Fluttertoast.showToast(
            msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
      }
    } catch (e) {
      log("getAllAdditionalSlotFunction Error ::: $e");
    } /*finally {
      isLoading(false);
    }*/
    isLoading(false);
  }

  /// 6) Book Slot
  bookSelectedSlotFunction(
      {required String userName, required String email}) async {
    String s1 = selectedServiceList.toString();
    String s2 = s1.substring(1, s1.length - 1);
    String serviceId = s2.replaceAll(" ", "");

    if (serviceId.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please select any service box!",
          toastLength: Toast.LENGTH_SHORT);
    } else if (selectedResourceTimeSlotId == 0) {
      Fluttertoast.showToast(
          msg: "Please select any timing slot!",
          toastLength: Toast.LENGTH_SHORT);
    } else {
      isLoading(true);
      String url = ApiUrl.bookSelectedSlotApi +
          "?ResourceId=$selectedResourceTimeSlotId&VendorId=${UserDetails.tableWiseId}&ServiceId=$serviceId";
      log("Book Selected Slot API URL : $url");
      log("token is: ${UserDetails.apiToken}");

      try {
        // UserCheckoutScreenController().makePayment();
        http.Response response = await http.post(
          Uri.parse(url), /*headers: apiHeader.headers*/
        );
        log("Book Slot API Response : ${response.body}");

        BookAppointmentModel bookAppointmentModel =
            BookAppointmentModel.fromJson(json.decode(response.body));
        isSuccessStatus = bookAppointmentModel.success.obs;

        if (isSuccessStatus.value) {
          log('bookAppointmentModel.message123 : ${bookAppointmentModel.message}');
          // Fluttertoast.showToast(msg: bookAppointmentModel.message, toastLength: Toast.LENGTH_SHORT);
          String bookingId = bookAppointmentModel.id;
          log("bookingId : $bookingId");
          // await addVendorInFavoriteFunction();
          Get.to(
            () => UserCheckoutScreen(),
            arguments: [
              bookingId,
              userName,
              email,
              selectedResourceIsEvent,
              0,
              selectedResource,
              false,
              isEvent.value,
            ],
          );
        } else {
          log("bookSelectedSlotFunction Else Else");
          Fluttertoast.showToast(
              msg: bookAppointmentModel.errorMessage,
              toastLength: Toast.LENGTH_SHORT);
        }
      } catch (e) {
        log("bookSelectedSlotFunction Error ::: $e");
      } /*finally {
        isLoading(false);
      }*/
    }
    isLoading(false);
  }

  /// 6) Book Available Time Slot
  bookAvailableTimeSlotFunction(
      {required String userName, required String email}) async {
    isLoading(true);
    String url = ApiUrl.bookSelectedAvailableTimeSlotApi;
    // String url = additionalSlotWorkerList.name == "Select Additional Slot"
    // ? ApiUrl.bookSelectedAvailableTimeSlotApi + "?ResourceId=$selectedResourceTimeSlotId&VendorId=$vendorId&Duration"
    // : ApiUrl.bookSelectedAvailableTimeSlotApi + "?ResourceId=$selectedResourceTimeSlotId&VendorId=$vendorId&Duration=${additionalSlotWorkerList.id}";
    log("Book Available Time Slot API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll(apiHeader.headers);

      if (additionalSlotWorkerList.id == 0) {
        request.fields['ResourceId'] = selectedResourceTimeSlotId.toString();
        request.fields['VendorId'] = vendorId.toString();
        // request.fields['Duration'] = "";
      } else if (additionalSlotWorkerList.id != 0) {
        request.fields['ResourceId'] = selectedResourceTimeSlotId.toString();
        request.fields['VendorId'] = vendorId.toString();
        request.fields['Duration'] = "${additionalSlotWorkerList.id}";
      }
      log('request.fields: ${request.fields}');
      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log("value : $value");

        BookAppointmentModel bookAppointmentModel =
            BookAppointmentModel.fromJson(json.decode(value));
        isSuccessStatus = bookAppointmentModel.success.obs;
        var msg = bookAppointmentModel.message.split(".")[0];
        log('bookAppointmentModel123: $msg');
        if (isSuccessStatus.value) {
          // Fluttertoast.showToast(msg: "Your slot is confirm");
          String bookingId = bookAppointmentModel.id;
          log("bookingId123 : $bookingId");
          // await addVendorInFavoriteFunction();
          Get.to(
            () => UserCheckoutScreen(),
            arguments: [
              bookingId,
              userName,
              email,
              selectedResourceIsEvent,
              additionalSlotWorkerList.id,
              selectedResource,
              true,
              isEvent.value,
            ],
          );
        } else {
          log("bookAvailableTimeSlotFunction Else Else");
          Fluttertoast.showToast(
              msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
        }
      });
    } catch (e) {
      log("bookAvailableTimeSlotFunction Error ::: $e");
    } /*finally {
      isLoading(false);
    }*/

    isLoading(false);
  }

  addVendorInFavoriteFunction() async {
    isLoading(true);
    String url = ApiUrl.addFavouriteVendorApi;
    log("Add Vendor in Favourite API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(apiHeader.headers);

      request.fields['VendorId'] = "$vendorId";
      request.fields['CustomerId'] = "${UserDetails.tableWiseId}";

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log("vendor favorite add body : ${json.decode(value)}");
        AddVendorInFavouriteModel addVendorInFavouriteModel =
            AddVendorInFavouriteModel.fromJson(json.decode(value));
        isSuccessStatus = addVendorInFavouriteModel.success.obs;
        log("status code : ${addVendorInFavouriteModel.statusCode}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(
              msg: "Added to favourites", toastLength: Toast.LENGTH_SHORT);
        } else {
          Fluttertoast.showToast(
              msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
        }
      });
    } catch (e) {
      log("addVendorInFavoriteFunction Error ::: $e");
      Fluttertoast.showToast(
          msg: "Something went wrong!", toastLength: Toast.LENGTH_SHORT);
    } /*finally {
      // isLoading(false);
      loadUI();
    }*/
    loadUI();
  }

  @override
  void onInit() {
    getBookVendorDetailsByIdFunction();

    /// Get Today Date Only
    getTodayDateFunction();
    if (Platform.isAndroid) {
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
      isIosPlatform.value = true;
    }
    super.onInit();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  getTodayDateFunction() {
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

    selectedDate.value = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    selectedShowDate.value =
        "${dateTime.day}-${dateTime.month}-${dateTime.year}";
    selectedTime.value = "$hour:$minute:00";
    log("selectedDate : ${selectedDate.value}");
  }

  Future signInWithGoogleFunction() async {
    isLoading(true);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      // User? user = result.user;
      log("Email: ${result.user!.email}");
      log("Username: ${result.user!.displayName}");
      log("User Id: ${result.user!.uid}");

      //login = prefs.getString('userId');
      //print(login);
      if (result != null) {
        String userName = result.user!.displayName!;
        String email = result.user!.email!;

        prefs.setString('userId', result.user!.uid);
        prefs.setString('userName', result.user!.displayName!);
        prefs.setString('email', result.user!.email!);
        prefs.setString('photo', result.user!.photoURL!);
        prefs.setBool('isLoggedIn', false);

        // Entry in Database
        await authenticationFunction(
          userName: result.user!.displayName!,
          email: result.user!.email!,
          socialProv: "google",
        );
        // userNameFieldController.text = userName.wordCapitalize();
        // emailFieldController.text = email;
        // passwordFieldController.text = "${userNameFieldController.text}@123";

        // prefs.setString('userId', result.user!.uid);
        // prefs.setString('userName', result.user!.displayName!);
        // prefs.setString('email', result.user!.email!);
        // prefs.setString('photo', result.user!.photoURL!);
        // prefs.setBool('isLoggedIn', false);

        // Get.offAll(() => IndexScreen());

        // if (isServiceSlot.value) {
        //   await bookSelectedSlotFunction(userName: userName, email: email);
        // } else {
        //   await bookAvailableTimeSlotFunction(userName: userName, email: email);
        // }
      }
    }
    isLoading(false);
  }

  Future signInWithFacebookFunction() async {
    await plugin.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ],
    );

    await subPartOfFacebookLogin();
    await plugin.logOut();
  }

  subPartOfFacebookLogin() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final plugin1 = plugin;
    final token = await plugin1.accessToken;

    String? email;
    String? imageUrl;

    if (token != null) {
      log("token===$token");
      profile = await plugin1.getUserProfile();
      log("profile===$profile");
      if (token.permissions.contains(FacebookPermission.email.name)) {
        email = await plugin1.getUserEmail();
      }
      imageUrl = await plugin1.getProfileImageUrl(width: 100);
      if (profile != null) {
        if (profile!.userId.isNotEmpty) {
          String userName = profile!.name!;

          // Entry in Database
          await authenticationFunction(
            userName: userName,
            email: email!,
            socialProv: "facebook",
          );

          // if (isServiceSlot.value) {
          //   await bookSelectedSlotFunction(userName: userName, email: email!);
          // } else {
          //   await bookAvailableTimeSlotFunction(
          //       userName: userName, email: email!);
          // }
        }
      }
    }
  }

  Future<void> authenticationFunction({
    required String userName,
    required String email,
    required String socialProv,
  }) async {
    String finalUserName = userName.replaceAll(" ", "");

    String url = ApiUrl.authenticationApi +
        "?userName=${finalUserName.trim()}" +
        "&email=$email" +
        "&password=Admin@123" +
        "&socialProvider=$socialProv";
    log('authenticationFunction Api Url $url');
    try {
      http.Response response = await http.post(Uri.parse(url));
      log('Response status code : ${response.statusCode}');
      log('Response : ${response.body}');

      var body = jsonDecode(response.body);
      if (response.body.toString().contains("Please confirm your email")) {
        SignInVendorErrorModel signInVendorErrorModel =
            SignInVendorErrorModel.fromJson(json.decode(response.body));
        Fluttertoast.showToast(
            msg:
                "Your account is in-active. Please check your email to activate.",
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.statusCode.toString().contains("417")) {
        SignInVendorErrorModel signInVendorErrorModel =
            SignInVendorErrorModel.fromJson(json.decode(response.body));
        Fluttertoast.showToast(
            msg: signInVendorErrorModel.message,
            toastLength: Toast.LENGTH_SHORT);
      } else if (body["statusCode"].toString().contains("417")) {
        Get.snackbar("Login Failed", body["errorMessage"]);
      } else {
        SignInModel signInModel =
            SignInModel.fromJson(json.decode(response.body));

        isSuccessStatus = signInModel.success.obs;

        log("status: $isSuccessStatus");

        if (isSuccessStatus.value) {
          if (signInModel.message.toString().contains("not Verified")) {
            Get.snackbar(signInModel.message, '');
          }
          /*else if (signInModel.message.contains("Invalid login attempt")) {
            Get.snackbar(signInModel.message, '');
          }*/

          else if (signInModel.role[0] == "Customer") {
            log('customer side');
            Get.snackbar("${signInModel.data.userName} login successfully", '');

            // String dob = signInModel.customer.dateOfBirth;
            // String finalDob = dob.substring(0, dob.length - 9);
            // log("finalDob : $finalDob");

            if (signInModel.message
                .toString()
                .contains("Successfully Logged")) {
              log("user logged in ");
              sharedPreferenceData.setUserLoginDetailsInPrefs(
                apiToken: signInModel.data.apiToken,
                uniqueId: signInModel.data.id,
                tableWiseId: signInModel.customer.id,
                userName: signInModel.data.userName,
                email: signInModel.data.email,
                phoneNo: signInModel.data.phoneNumber,
                dob: signInModel.customer.dateOfBirth,
                roleName: signInModel.role[0],
                gender: signInModel.customer.gender,
                businessName: "",
                address: "",
                street: "",
                state: "",
                country: "",
                subUrb: "",
                postCode: "",
                stripeId: "",
                //slotDuration: ""
                vendorVerification: false,
                businessId: "",
                serviceSlot: false,
                institutionName: "",
                accountName: "",
                accountNumber: "",
                ifscCode: "",
                isPriceDisplay: false,
              );
              log("Fcm Token : ${UserDetails.fcmToken}");
              if (isServiceSlot.value) {
                await bookSelectedSlotFunction(
                    userName: userName, email: email);
              } else {
                await bookAvailableTimeSlotFunction(
                    userName: userName, email: email);
              }
              // if (signInRoute == SignInRoute.fromBookScreen) {
              //   Get.back();
              //   Get.back();
              // } else {
              //   Get.offAll(() => IndexScreen());
              // }
            }

            //Get.snackbar(signInModel.message, '');
          }

          // else if (signInModel.role[0] == "Vendor") {
          //   log('Vendor side');
          //   log('Api token: ${signInModel.data.apiToken}');
          //   Get.snackbar("${signInModel.data.fullName} login successfully", '');

          //   var isSub = true;
          //   if (signInModel.message.contains("Subscription pending")) {
          //     isSub = false;
          //     log("vendor has no subscription");
          //     log("logged in state");
          //     log("subscription state is : $isSub");

          //     sharedPreferenceData.setUserLoginDetailsInPrefs(
          //       apiToken: signInModel.data.apiToken,
          //       uniqueId: signInModel.data.id,
          //       tableWiseId: signInModel.vendor.id,
          //       userName: signInModel.data.fullName,
          //       email: signInModel.data.email,
          //       phoneNo: signInModel.data.phoneNumber,
          //       dob: "",
          //       roleName: signInModel.role[0],
          //       gender: "",
          //       businessName: signInModel.vendor.businessName,
          //       address: signInModel.vendor.address,
          //       street: signInModel.vendor.street,
          //       state: signInModel.vendor.state,
          //       country: signInModel.vendor.country,
          //       subUrb: signInModel.vendor.suburb,
          //       postCode: signInModel.vendor.postcode,
          //       stripeId: signInModel.vendor.stripeId.isEmpty
          //           ? ""
          //           : signInModel.vendor.stripeId,
          //       isSubscription: isSub,
          //       // slotDuration: signInModel.vendor.
          //       vendorVerification: signInModel.vendor.vendorVerification,
          //       businessId: signInModel.vendor.businessId,
          //       serviceSlot: signInModel.vendor.isServiceSlots,
          //       institutionName: signInModel.vendor.financialInstitutionName,
          //       accountName: signInModel.vendor.accountName,
          //       accountNumber: signInModel.vendor.accountNumber,
          //       ifscCode: signInModel.vendor.accountCode,
          //       isPriceDisplay: signInModel.vendor.isPriceDisplay,
          //     );

          //     // DateTime subscription = signInModel.vendor.nextPayment;
          //     //
          //     // if(subscription == "") {
          //     //   Get.offAll(()=> VendorSubscriptionPlanScreen(), transition: Transition.zoom);
          //     // }
          //     // else {
          //     //   Get.offAll(() => VendorIndexScreen());
          //     // }

          //     log("navigate to subscription plan screen");

          //     // Get.offAll(
          //     //   () => VendorSubscriptionPlanScreen(),
          //     //   arguments: SubscriptionOption.direct,
          //     // );
          //   } else
          //   if (signInModel.message
          //       .toString()
          //       .contains("Successfully Logged")) {
          //     isSub = true;

          //     log("logged in state");
          //     log("subscription state is : $isSub");

          //     sharedPreferenceData.setUserLoginDetailsInPrefs(
          //       apiToken: signInModel.data.apiToken,
          //       uniqueId: signInModel.data.id,
          //       tableWiseId: signInModel.vendor.id,
          //       userName: signInModel.data.fullName,
          //       email: signInModel.data.email,
          //       phoneNo: signInModel.data.phoneNumber,
          //       dob: "",
          //       roleName: signInModel.role[0],
          //       gender: "",
          //       businessName: signInModel.vendor.businessName,
          //       address: signInModel.vendor.address,
          //       street: signInModel.vendor.street,
          //       state: signInModel.vendor.state,
          //       country: signInModel.vendor.country,
          //       subUrb: signInModel.vendor.suburb,
          //       postCode: signInModel.vendor.postcode,
          //       stripeId: signInModel.vendor.stripeId.isEmpty
          //           ? ""
          //           : signInModel.vendor.stripeId,
          //       isSubscription: isSub,
          //       // slotDuration: signInModel.vendor.
          //       vendorVerification: signInModel.vendor.vendorVerification,
          //       businessId: signInModel.vendor.businessId,
          //       serviceSlot: signInModel.vendor.isServiceSlots,
          //       institutionName: signInModel.vendor.financialInstitutionName,
          //       accountName: signInModel.vendor.accountName,
          //       accountNumber: signInModel.vendor.accountNumber,
          //       ifscCode: signInModel.vendor.accountCode,
          //       isPriceDisplay: signInModel.vendor.isPriceDisplay,
          //     );

          //     // DateTime subscription = signInModel.vendor.nextPayment;
          //     //
          //     // if(subscription == "") {
          //     //   Get.offAll(()=> VendorSubscriptionPlanScreen(), transition: Transition.zoom);
          //     // }
          //     // else {
          //     //   Get.offAll(() => VendorIndexScreen());
          //     // }

          //     // if (isSub == false) {
          //     log("navigate to subscription plan screen");
          //     Get.offAll(
          //       () => VendorIndexScreen(),
          //       arguments: SubscriptionOption.direct,
          //     );
          //     // } else {
          //     //   log("navigate to vendor index screen");
          //     //   Get.offAll(() => VendorIndexScreen());
          //     // }

          //   }
          // }
        } else {
          log('SignIn False False');
          log('SignIn message from api ' + signInModel.message);
          // Get.snackbar(signInModel.message, '');
          log("asdasdsd");
        }
      }
    } catch (e) {
      log('SignIn Error : $e');
      Fluttertoast.showToast(
          msg: "Invalid login attempt", toastLength: Toast.LENGTH_SHORT);
      rethrow;
    }
  }
}
