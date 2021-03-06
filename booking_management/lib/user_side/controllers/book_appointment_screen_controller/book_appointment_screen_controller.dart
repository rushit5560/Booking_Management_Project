import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/model/user_business_details_model/add_vendor_in_favourite_model.dart';
import 'package:booking_management/user_side/model/user_sign_up_model/user_sign_up_model.dart';
import 'package:booking_management/user_side/model/vendor_details_screen_models/vendor_details_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
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
  RxInt isStatus = 0.obs;

   ApiHeader apiHeader = ApiHeader();

  /// Fb Login
  FacebookUserProfile? profile;
  final FacebookLogin  plugin = FacebookLogin(debug: true);

  VendorBookingWorkerList? bookVendorDetails;
  RxBool isServiceSlot = false.obs;

  String resourcePrefix = "";

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
  RxBool isServiceCalenderShow = false.obs;
  RxBool isCalenderShow = false.obs;
  RxInt selectedTimeIndex = 0.obs;
  RxBool isPriceDisplay = false.obs;
  String vendorUniqueId = "";


  List<String> timeList = [ 'Any Time',
    '06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30',
    '10:00', '10:30', '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',
    '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30',
    '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', '21:00', '21:30',
    '22:00', '22:30', '23:00', '23:30'];
  RxString selectedTimeValue = "Any Time".obs;

  RxBool isEvent = false.obs;

  VendorDetailsData? vendorDetailsData;


  /// 1) Get Booking Vendor
  getBookVendorDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorBookingDetailsApi + "?Id=$vendorId";
    log("Book Vendor Details API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      // log("Book Vendor Details Response : ${response.body}");

      GetVendorBookingModel getVendorBookingModel = GetVendorBookingModel.fromJson(json.decode(response.body));
      isSuccessStatus = getVendorBookingModel.success.obs;

      if(isSuccessStatus.value) {
        bookVendorDetails = getVendorBookingModel.workerList;
        resourcePrefix = getVendorBookingModel.workerList.vendor.categories.prefix;
        isServiceSlot.value = getVendorBookingModel.workerList.vendor.isServiceSlots;
        isPriceDisplay.value = getVendorBookingModel.workerList.vendor.isPriceDisplay;
        vendorUniqueId = getVendorBookingModel.workerList.vendor.userId;
        log("isServiceSlot : ${isServiceSlot.value}");
        log("isPriceDisplay : ${isPriceDisplay.value}");

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
        await getAllAdditionalSlotFunction();
      }
    }
  }

  /// 2) Get Services List
  getServicesListByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorServicesApi + "?Id=$vendorId";
    log("Get Services List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      // log("Services List API Response : ${response.body}");

      GetBookingServiceModel getBookingServiceModel = GetBookingServiceModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingServiceModel.success.obs;

      if(isSuccessStatus.value) {
        allServicesList.clear();

        allServicesList = getBookingServiceModel.workerList;
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

  /// 2 & 3) Get Resources List
  getAllResourcesListByIdFunction({SearchType2 searchType2 = SearchType2.none}) async {
    isLoading(true);
    String url = ApiUrl.vendorBookingResourcesApi + "?Id=$vendorId";
    log("Booking Resources API URL  :$url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      // log("Resources API Response : ${response.body}");

      GetBookingResourcesModel getBookingResourcesModel = GetBookingResourcesModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingResourcesModel.success.obs;

      if(isSuccessStatus.value) {
        allResourcesList = getBookingResourcesModel.workerList;
        for(int i =0; i < getBookingResourcesModel.workerList.length; i++){

          if(getBookingResourcesModel.workerList[i].isEvent == true) {
            isEvent = getBookingResourcesModel.workerList[i].isEvent.obs;
          }
          log('isEvent: $isEvent');
        }
        log("allResourcesList : ${allResourcesList.length}");

        if(searchType2 == SearchType2.none) {
          log("searchType2 : $searchType2");
          if(selectedServiceList.isEmpty) {
            for(int i = 0; i < allResourcesList.length; i++) {
              allResourcesList[i].timingList =
              await getResourcesTimeListFunction(resId: allResourcesList[i].id.toString());
            }
          } else if(selectedServiceList.isNotEmpty) {
            for(int i = 0; i < allResourcesList.length; i++) {
              allResourcesList[i].timingList =
              await getSelectedResourcesTimeSlotFunction(resId: allResourcesList[i].id.toString());
            }
          }

        }
        else if(searchType2 == SearchType2.anyTimeWithAdditionalSlotWise) {
          log("searchType2 : $searchType2");
          for(int i = 0; i < allResourcesList.length; i++) {
            allResourcesList[i].timingList =
            await getResourcesAdditionalSlotAndAnytimeFunction(resId: allResourcesList[i].id.toString());
            log("allResourcesList[i].id ${allResourcesList[i].id}");
          }
        }
        else if(searchType2 == SearchType2.anyTimeWise) {
          log("searchType2 : $searchType2");
          for(int i = 0; i < allResourcesList.length; i++) {
            allResourcesList[i].timingList =
            await getResourcesAndAnytimeFunction(resId: allResourcesList[i].id.toString());
          }
        }
        else if(searchType2 == SearchType2.additionalSlotWise) {
          log("searchType2 : $searchType2");
          for(int i = 0; i < allResourcesList.length; i++) {
            allResourcesList[i].timingList =
            await getResourcesAdditionalSlotFunction(resId: allResourcesList[i].id.toString());
          }
        }
        else if(searchType2 == SearchType2.dateTimeWise) {
          log("searchType2 : $searchType2");
          if(selectedServiceList.isEmpty) {
            for(int i = 0; i < allResourcesList.length; i++) {
              allResourcesList[i].timingList =
              await getResourcesDateAndTimeListFunction(resId: allResourcesList[i].id.toString());
            }
          } else if(selectedServiceList.isNotEmpty) {
            for(int i = 0; i < allResourcesList.length; i++) {
              allResourcesList[i].timingList =
              await getSelectedResourcesTimeSlotFunction(resId: allResourcesList[i].id.toString());
            }
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
      log("isServiceSlot.value : ${isServiceSlot.value}");
      isLoading(false);

      // if(isServiceSlot.value == true) {
      //   isLoading(false);
      // } else if(isServiceSlot.value == false){
      //   await getAllAdditionalSlotFunction();
      // }

    }

  }

  /// 4) Get Resources Time List
  getResourcesTimeListFunction({required String resId}) async {
    log("Resource Id : $resId");
    DateTime dateTime = DateTime.now();

    String hour = "${dateTime.hour}";
    String minute = "${dateTime.minute}";

    /// For Hour Format
    for(int i = 0; i < 10; i++) {
      if(dateTime.hour.toString() == i.toString()) {
        if(dateTime.hour.toString().length == 1) {
          hour = "0${dateTime.hour}";
        }
      }
    }

    /// For Minute
    for (int i = 0; i < 10; i++) {
      if(dateTime.minute.toString() == i.toString()) {
        if(dateTime.minute.toString().length == 1) {
          minute = "0${dateTime.minute}";
        }
      }
    }



    String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String timeModule = "$hour:$minute:00";
    log("dateTime : $dateTime");
    log("timeModule : $timeModule");
    List<TimingSlot> timeList = [];
    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi + "?Id=$resId&dDate=${dateModule}T$timeModule&Duration";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList!.length; i++) {
          String startTime = getAllTimeListByResourceIdModel.workerList![i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].startDateTime.length-3);
          String endTime = getAllTimeListByResourceIdModel.workerList![i].endDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].endDateTime.length-3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList![i].id,
            resourceId: getAllTimeListByResourceIdModel.workerList![i].resourceId,
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

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(true);
    }

    return timeList;
  }

  /// 4) Get Selected Resource Time List
  getSelectedResourcesTimeSlotFunction({required String resId, required }) async {
    log("Resource Id : $resId");
    DateTime dateTime = DateTime.now();
    bool isToday = selectedDate.value == "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    log("isToday isToday isToday :$isToday");

    String s1 = selectedServiceList.toString();
    String s2 = s1.substring(1, s1.length-1);
    String serviceId = s2.replaceAll(" ", "");

    String hour = "${dateTime.hour}";
    String minute = "${dateTime.minute}";

    /// For Hour Format
    for(int i = 0; i < 10; i++) {
      if(dateTime.hour.toString() == i.toString()) {
        if(dateTime.hour.toString().length == 1) {
          hour = "0${dateTime.hour}";
        }
      }
    }

    /// For Minute
    for (int i = 0; i < 10; i++) {
      if(dateTime.minute.toString() == i.toString()) {
        if(dateTime.minute.toString().length == 1) {
          minute = "0${dateTime.minute}";
        }
      }
    }



    String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String timeModule = "$hour:$minute:00";
    log("dateTime : $dateTime");
    log("timeModule : $timeModule");
    List<TimingSlot> timeList = [];
    isLoading(true);
    String url = isToday
        ? ApiUrl.selectedServicesWiseResourceSlotSearchApi + "?Id=$resId&dDate=${dateModule}T$timeModule&Service=$serviceId"
        : ApiUrl.selectedServicesWiseResourceSlotSearchApi + "?Id=$resId&dDate=$dateModule&Service=$serviceId";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
       log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList!.length; i++) {
          String startTime = getAllTimeListByResourceIdModel.workerList![i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].startDateTime.length-3);
          String endTime = getAllTimeListByResourceIdModel.workerList![i].endDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].endDateTime.length-3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList![i].id,
            resourceId: getAllTimeListByResourceIdModel.workerList![i].resourceId,
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

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(true);
    }

    return timeList;
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
    log('Rushit');
        List<TimingSlot> timeList = [];
    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi + "?Id=$resId&dDate=${selectedDate.value}T${selectedTime.value}&Duration";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList!.length; i++) {
          String startTime = getAllTimeListByResourceIdModel.workerList![i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].startDateTime.length-3);
          String endTime = getAllTimeListByResourceIdModel.workerList![i].endDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].endDateTime.length-3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList![i].id,
            resourceId: getAllTimeListByResourceIdModel.workerList![i].resourceId,
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

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(true);
    }

    return timeList;
  }

  /// 4) Get Resources Additional Slot & Anny Time Wise List
  getResourcesAdditionalSlotAndAnytimeFunction({required String resId}) async {
    List<TimingSlot> timeList = [];

    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi + "?Id=$resId&dDate=${selectedDate.value}&Duration=${additionalSlotWorkerList.id}";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList!.length; i++) {
          String startTime = getAllTimeListByResourceIdModel.workerList![i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].startDateTime.length-3);
          String endTime = getAllTimeListByResourceIdModel.workerList![i].endDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].endDateTime.length-3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList![i].id,
            resourceId: getAllTimeListByResourceIdModel.workerList![i].resourceId,
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
        Fluttertoast.showToast(msg: getAllTimeListByResourceIdModel.errorMessage);
      }

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
      // Fluttertoast.showToast(msg: "Something went wrong!");
      Fluttertoast.showToast(msg: "Selected resource slot is available but rest of the slot are already reserved. Please select another slot.");
    } finally {
      isLoading(true);
    }

    return timeList;

  }

  /// 4) Get Resources Any Time Wise List
  getResourcesAndAnytimeFunction({required String resId}) async {
    List<TimingSlot> timeList = [];

    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi + "?Id=$resId&dDate=${selectedDate.value}&Duration";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      // log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList!.length; i++) {
          String startTime = getAllTimeListByResourceIdModel.workerList![i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].startDateTime.length-3);
          String endTime = getAllTimeListByResourceIdModel.workerList![i].endDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].endDateTime.length-3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList![i].id,
            resourceId: getAllTimeListByResourceIdModel.workerList![i].resourceId,
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
        // Fluttertoast.showToast(msg: getAllTimeListByResourceIdModel.errorMessage);
      }

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(true);
    }

    return timeList;

  }

  /// 4) Get Resources Additional Slot Wise List
  getResourcesAdditionalSlotFunction({required String resId}) async {
    List<TimingSlot> timeList = [];

    isLoading(true);
    String url = ApiUrl.getResourcesTimeSlotApi + "?Id=$resId&dDate=${selectedDate.value}T${selectedTime.value}&Duration=${additionalSlotWorkerList.id}";
    log("Get Resources Additional Time API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel = GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus =  getAllTimeListByResourceIdModel.success.obs;

      if(isSuccessStatus.value) {

        for(int i =0; i < getAllTimeListByResourceIdModel.workerList!.length; i++) {
          String startTime = getAllTimeListByResourceIdModel.workerList![i].startDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].startDateTime.length-3);
          String endTime = getAllTimeListByResourceIdModel.workerList![i].endDateTime.substring(11, getAllTimeListByResourceIdModel.workerList![i].endDateTime.length-3);

          timeList.add(TimingSlot(
            id: getAllTimeListByResourceIdModel.workerList![i].id,
            resourceId: getAllTimeListByResourceIdModel.workerList![i].resourceId,
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
        // Fluttertoast.showToast(msg: getAllTimeListByResourceIdModel.errorMessage);
      }

    } catch(e) {
      log("getResourcesTimeListFunction Error ::: $e");
      // Fluttertoast.showToast(msg: "Something went wrong!");
      Fluttertoast.showToast(msg: "Selected resource slot is available but rest of the slot are already reserved. Please select another slot.");
    } finally {
      isLoading(true);
    }

    return timeList;

  }

  /// 5) Additional Slot
  getAllAdditionalSlotFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllAdditionalSlotApi + "?VendorId=$vendorId";
    log("Get All Additional Slot API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      log('Response : ${response.body}');

      GetAllAdditionalSlotModel getAllAdditionalSlotModel = GetAllAdditionalSlotModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAdditionalSlotModel.success.obs;
      log("Status Code : ${getAllAdditionalSlotModel.statusCode}");

      if (isSuccessStatus.value) {
        allAdditionalSlotList.clear();

        /// Add Initial Value
        allAdditionalSlotList.add(AdditionalSlotWorkerList(id: 0, name: "Select Additional Slot"));
        /// Add Backend values
        allAdditionalSlotList.addAll(getAllAdditionalSlotModel.workerList);
        /// Set First Value of list in DD Value Object
        additionalSlotWorkerList = allAdditionalSlotList[0];
        log('additionalSlotWorkerList: $additionalSlotWorkerList');
        // }

      } else {
        log("Something went wrong!");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch(e) {
      log("getAllAdditionalSlotFunction Error ::: $e");
    } finally {
        isLoading(false);
    }

  }

  /// 6) Book Slot
  bookSelectedSlotFunction({required String userName, required String email}) async {
    String s1 = selectedServiceList.toString();
    String s2 = s1.substring(1, s1.length-1);
    String serviceId = s2.replaceAll(" ", "");

    isLoading(true);
    String url = ApiUrl.bookSelectedSlotApi + "?ResourceId=$selectedResourceTimeSlotId&VendorId=${UserDetails.tableWiseId}&ServiceId=$serviceId";
    log("Book Selected Slot API URL : $url");

    try {
      http.Response response = await http.post(Uri.parse(url), /*headers: apiHeader.headers*/);
      log("Book Slot API Response : ${response.body}");

      BookAppointmentModel bookAppointmentModel = BookAppointmentModel.fromJson(json.decode(response.body));
      isSuccessStatus = bookAppointmentModel.success.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: bookAppointmentModel.message);
        String bookingId = bookAppointmentModel.id;
        log("bookingId : $bookingId");
        Get.to(() => UserCheckoutScreen(), arguments: [bookingId, userName, email]);
      } else {
        log("bookSelectedSlotFunction Else Else");
        Fluttertoast.showToast(msg: bookAppointmentModel.errorMessage);
      }


    } catch(e) {
      log("bookSelectedSlotFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// 6) Book Available Time Slot
  bookAvailableTimeSlotFunction({required String userName, required String email}) async {
    isLoading(true);
    String url = ApiUrl.bookSelectedAvailableTimeSlotApi;
    // String url = additionalSlotWorkerList.name == "Select Additional Slot"
    // ? ApiUrl.bookSelectedAvailableTimeSlotApi + "?ResourceId=$selectedResourceTimeSlotId&VendorId=$vendorId&Duration"
    // : ApiUrl.bookSelectedAvailableTimeSlotApi + "?ResourceId=$selectedResourceTimeSlotId&VendorId=$vendorId&Duration=${additionalSlotWorkerList.id}";
    log("Book Available Time Slot API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      // request.headers.addAll(apiHeader.headers);


      if(additionalSlotWorkerList.id == 0) {
        request.fields['ResourceId'] = selectedResourceTimeSlotId.toString();
        request.fields['VendorId'] = vendorId.toString();
       // request.fields['Duration'] = "";
      } else if(additionalSlotWorkerList.id != 0) {
        request.fields['ResourceId'] = selectedResourceTimeSlotId.toString();
        request.fields['VendorId'] = vendorId.toString();
        request.fields['Duration'] = "${additionalSlotWorkerList.id}";
      }
      log('request.fields: ${request.fields}');
      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value : $value");

        BookAppointmentModel bookAppointmentModel =
            BookAppointmentModel.fromJson(json.decode(value));
        isSuccessStatus = bookAppointmentModel.success.obs;
        log('bookAppointmentModel: ${bookAppointmentModel.message}');
        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: bookAppointmentModel.message);
          String bookingId = bookAppointmentModel.id;
          log("bookingId : $bookingId");
          await addVendorInFavoriteFunction();
          Get.to(() => UserCheckoutScreen(), arguments: [bookingId, userName, email]);
        } else {
          log("bookAvailableTimeSlotFunction Else Else");
          Fluttertoast.showToast(msg: "Something went wrong!");
        }
      });
    } catch (e) {
      log("bookAvailableTimeSlotFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
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

    response.stream.transform(utf8.decoder).listen((value) async {
      AddVendorInFavouriteModel addVendorInFavouriteModel =
      AddVendorInFavouriteModel.fromJson(json.decode(value));
      isSuccessStatus = addVendorInFavouriteModel.success.obs;
      log("Body : ${addVendorInFavouriteModel.statusCode}");

      if (isSuccessStatus.value) {
        vendorDetailsData!.favourites = !vendorDetailsData!.favourites;
        if(vendorDetailsData!.favourites) {
          //Fluttertoast.showToast(msg: "Added in favourite");
        } else {
          //Fluttertoast.showToast(msg: "Removed from favourite");
        }
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    });
  } catch (e) {
    log("addVendorInFavoriteFunction Error ::: $e");
    Fluttertoast.showToast(msg: "Something went wrong!");
  } finally {
    // isLoading(false);
    loadUI();
  }
}


  @override
  void onInit() {
    getBookVendorDetailsByIdFunction();
    /// Get Today Date Only
    getTodayDateFunction();
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
    for(int i = 0; i < 10; i++) {
      if(dateTime.hour.toString() == i.toString()) {
        if(dateTime.hour.toString().length == 1) {
          hour = "0${dateTime.hour}";
        }
      }
    }

    /// For Minute
    for (int i = 0; i < 10; i++) {
      if(dateTime.minute.toString() == i.toString()) {
        if(dateTime.minute.toString().length == 1) {
          minute = "0${dateTime.minute}";
        }
      }
    }


    selectedDate.value = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    selectedTime.value = "$hour:$minute:00";
    log("selectedDate : ${selectedDate.value}");
  }


  Future signInWithGoogleFunction() async {
    isLoading(true);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
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
        // userNameFieldController.text = userName.wordCapitalize();
        // emailFieldController.text = email;
        // passwordFieldController.text = "${userNameFieldController.text}@123";

        // prefs.setString('userId', result.user!.uid);
        // prefs.setString('userName', result.user!.displayName!);
        // prefs.setString('email', result.user!.email!);
        // prefs.setString('photo', result.user!.photoURL!);
        // prefs.setBool('isLoggedIn', false);

        // Get.offAll(() => IndexScreen());

        if (isServiceSlot.value) {
          await bookSelectedSlotFunction(userName: userName, email: email);
        } else {
          await bookAvailableTimeSlotFunction(userName: userName, email: email);
        }
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

          if (isServiceSlot.value) {
            await bookSelectedSlotFunction(userName: userName, email: email!);
          } else {
            await bookAvailableTimeSlotFunction(
                userName: userName, email: email!);
          }
        }
      }
    }
  }
}