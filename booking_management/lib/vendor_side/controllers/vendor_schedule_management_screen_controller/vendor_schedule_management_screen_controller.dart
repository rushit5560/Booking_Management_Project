import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/model/book_appointment_screen_model/get_booking_resources_model.dart';
import 'package:booking_management/vendor_side/model/get_search_with_resource_list_model/get_search_with_resource_list_model.dart';
import 'package:booking_management/vendor_side/model/get_vendor_auto_schedule_model/get_vendor_auto_schedule_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorScheduleManagementScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  /// For Filter
  RxString startDate = "Select Start Date".obs;
  RxString endDate = "Select End Date".obs;
  RxBool isStartDateCalenderShow = false.obs;
  RxBool isEndDateCalenderShow = false.obs;

  DateTime selectedStartDate = DateTime.now();

  /// Search Schedule timing
  RxString scheduleTimingDate = "Select Date".obs;
  RxBool isScheduleTimingCalenderShow = false.obs;

  List<BookingResourceWorkerData> allResourcesList = [];

  ApiHeader apiHeader = ApiHeader();

  int resourceId = 0;
  List<WorkerList> searchWithResourceList = [];

  /// Get Auto Schedule API Filter wise
  getAutoScheduleFunction()async {
    isLoading(true);
    String url =  ApiUrl.getAutoScheduleApi;

    log("Appointment Report Api Url : $url");
    log('header: ${apiHeader.headers}');

    try {

      List trueList = [];
      trueList.add({
        "StartTimes" : startDate.value,
        "EndTimes" : endDate.value,
        "VendorId" : "${UserDetails.tableWiseId}"
      });

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['bookings'] = jsonEncode(trueList);

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(const Utf8Decoder()).transform(const LineSplitter()).listen((dataLine) {
        log('Auto schedule Response: $dataLine');
        GetVendorAutoScheduleModel getVendorAutoScheduleModel = GetVendorAutoScheduleModel.fromJson(json.decode(dataLine));
        isSuccessStatus = getVendorAutoScheduleModel.success.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: getVendorAutoScheduleModel.message);
        } else {
          log("getVendorAutoScheduleFunction Else Else");
          Fluttertoast.showToast(msg: "Something went wrong!");
        }

      });

    } catch(e) {
      log("getVendorAutoScheduleFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  getAllResourceListFunction()async{
    isLoading(true);
    String url = ApiUrl.getAllResourceListApi + "?Id=${UserDetails.tableWiseId}";
    log("Resource List Api Url : $url");
    log('Header: ${apiHeader.headers}');

    try {
      http.Response response = await http.get(Uri.parse(url),  headers: apiHeader.headers);
      log("Resource List Response : ${response.body}");

      GetBookingResourcesModel getBookingResourcesModel = GetBookingResourcesModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingResourcesModel.success.obs;

      if(isSuccessStatus.value) {
        allResourcesList = getBookingResourcesModel.workerList;
        log("allResourcesList : ${allResourcesList.length}");
        for(int i= 0 ; i < allResourcesList.length ; i++){
          resourceId = allResourcesList[i].id;
          log('Resource id: $resourceId');
          /*allResourcesList[i].timingList =*/ await getSearchWithResourceListFunction();
        }


      } else {
        log("getResourcesFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getResourcesFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  getSearchWithResourceListFunction()async{
    isLoading(true);
    List<TimingSlot> timeList = [];
    String url = ApiUrl.getAllSearchWithResourceListApi + "?Id=$resourceId&dDate=${scheduleTimingDate.value}";
    log("Search With Resource List Api Url : $url");
    log('Header: ${apiHeader.headers}');

    try {
      http.Response response = await http.get(Uri.parse(url),  headers: apiHeader.headers);
      log("Search With Resource List Response : ${response.body}");

      GetSearchWithResourceListModel getSearchWithResourceListModel = GetSearchWithResourceListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getSearchWithResourceListModel.success.obs;

      if(isSuccessStatus.value) {
       log("Success: $isSuccessStatus");
       searchWithResourceList = getSearchWithResourceListModel.workerList;

        log('searchWithResourceList: ${searchWithResourceList.length}');

       for(int i =0; i < searchWithResourceList.length; i++) {
         String startTime = searchWithResourceList[i].startDateTime.substring(11, searchWithResourceList[i].startDateTime.length-3);
         String endTime = searchWithResourceList[i].endDateTime.substring(11, searchWithResourceList[i].endDateTime.length-3);

         timeList.add(TimingSlot(
           id: searchWithResourceList[i].id,
           resourceId: searchWithResourceList[i].resourceId,
           startDateTime: startTime,
           endDateTime: endTime,
           isActive: searchWithResourceList[i].isActive,
           booking: searchWithResourceList[i].booking,
           isSelected: false,
         ));
       }
       log("Time List1 : ${timeList.length}");
      } else {
        log("Search With Resource List Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("Search With Resource List Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllResourceListFunction();
  }
}