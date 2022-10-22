import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/model/book_appointment_screen_model/get_booking_resources_model.dart';
import 'package:booking_management/vendor_side/model/get_search_with_resource_list_model/get_search_with_resource_list_model.dart';
import 'package:booking_management/vendor_side/model/get_vendor_auto_schedule_model/get_vendor_auto_schedule_model.dart';
import 'package:booking_management/vendor_side/model/vendor_schedule_time_screen_model/available_timing_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorScheduleManagementScreenController extends GetxController {
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

  RxBool allResourceCheckBoxValue = false.obs;
  List<RxBool> resourcesCheckList = [];
  List<String> resourcesNameList = [];

  List<BookingResourceWorkerData> allResourcesList = [];
  RxBool isAllSelected = true.obs;
  List selectedResourceIdList = [];

  ApiHeader apiHeader = ApiHeader();
  RxBool isTiming = true.obs;

  int resourceId = 0;
  List<WorkerList> searchWithResourceList = [];

  /// Get Auto Schedule API Filter wise
  getAutoScheduleFunction() async {
    isLoading(true);
    String url = ApiUrl.getAutoScheduleNewApi;

    log("Appointment Report Api Url : $url");
    log('header: ${apiHeader.headers}');

    try {
      // List trueList = [];
      // trueList.add({
      //   "StartTimes": startDate.value,
      //   "EndTimes": endDate.value,
      // });

      // Selected Resource List To String Logic
      String selectedResourcesString = "";
      String tempString = selectedResourceIdList.toString();
      String tempString2 = tempString.substring(1, tempString.length - 1);
      selectedResourcesString = tempString2;
      //

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['StartTimes'] = startDate.value;
      request.fields['EndTimes'] = endDate.value;
      request.fields['VendorId'] = "${UserDetails.tableWiseId}";
      request.fields['ResourceListData'] = selectedResourcesString;

      log("auto schedule Fields : ${request.fields}");
      // log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response1234: ${response.statusCode}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((dataLine) {
        log('Auto schedule Response: $dataLine');
        GetVendorAutoScheduleModel getVendorAutoScheduleModel =
            GetVendorAutoScheduleModel.fromJson(json.decode(dataLine));
        isSuccessStatus = getVendorAutoScheduleModel.success.obs;

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: getVendorAutoScheduleModel.message);
        } else {
          log("getVendorAutoScheduleFunction Else Else");
          Fluttertoast.showToast(msg: "Something went wrong!");
        }
      });
    } catch (e) {
      log("getVendorAutoScheduleFunction Error ::: $e");
      rethrow;
    } finally {
      // isLoading(false);
      await getSearchWithResourceListFunction();
    }
  }

  getAllResourceListFunction({SearchWise searchWise = SearchWise.none}) async {
    isLoading(true);
    String url =
        ApiUrl.getAllResourceListApi + "?Id=${UserDetails.tableWiseId}";
    log("Resource List Api Url : $url");
    log('Header: ${apiHeader.headers}');

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Resource List Response : ${response.body}");

      GetBookingResourcesModel getBookingResourcesModel =
          GetBookingResourcesModel.fromJson(json.decode(response.body));
      isSuccessStatus = getBookingResourcesModel.success.obs;

      if (isSuccessStatus.value) {
        allResourcesList = getBookingResourcesModel.workerList;

        for (int i = 0; i < allResourcesList.length; i++) {
          RxBool resourceCheckValue = false.obs;
          resourcesCheckList.add(resourceCheckValue);
          resourcesNameList.add(allResourcesList[i].resourceName);
        }
        log("allResourcesList : ${allResourcesList.length}");
        for (int i = 0; i < allResourcesList.length; i++) {
          resourceId = allResourcesList[i].id;
          log('Resource id: $resourceId');
          Map<String, dynamic> mapData =
              await getSearchWithResourceListFunction(searchWise: searchWise);
          allResourcesList[i].timingList = mapData["timeList"];
          allResourcesList[i].nextDate = mapData["nextDate"];
        }

        for (int i = 0; i < allResourcesList.length; i++) {
          selectedResourceIdList.add(allResourcesList[i].id);
        }
        log('selectedResourceIdList : $selectedResourceIdList');
      } else {
        log("getResourcesFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getResourcesFunction Error ::: $e");
    } finally {
      //todo
      // isLoading(false);
      await getTimingFunction();
    }
  }

  getSearchWithResourceListFunction(
      {SearchWise searchWise = SearchWise.none}) async {
    isLoading(true);
    String nextDate = "";
    List<TimingSlot> timeList = [];
    DateTime dateTime = DateTime.now();
    String hour = "${dateTime.hour}";
    String minute = "${dateTime.minute}";

    String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String timeModule = "$hour:$minute:00";

    String url = searchWise == SearchWise.none
        ? ApiUrl.vendorResourceScheduleApi +
            "?Id=$resourceId" "&dDate=${dateModule}T$timeModule"
        : ApiUrl.vendorResourceScheduleApi +
            "?Id=$resourceId" "&dDate=${scheduleTimingDate.value}";

    // ApiUrl.getAllSearchWithResourceListApi + "?Id=$resourceId&dDate=${scheduleTimingDate.value}";
    log("Search With Resource List Api Url : $url");
    log('Header: ${apiHeader.headers}');

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Search With Resource List Response : ${response.body}");

      GetSearchWithResourceListModel getSearchWithResourceListModel =
          GetSearchWithResourceListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getSearchWithResourceListModel.success.obs;

      if (isSuccessStatus.value) {
        nextDate = getSearchWithResourceListModel.nextDate;
        log("Success: $isSuccessStatus");
        searchWithResourceList = getSearchWithResourceListModel.workerList;

        log('searchWithResourceList: ${searchWithResourceList.length}');

        for (int i = 0; i < searchWithResourceList.length; i++) {
          String startTime = searchWithResourceList[i].startDateTime.substring(
              11, searchWithResourceList[i].startDateTime.length - 3);
          String endTime = searchWithResourceList[i]
              .endDateTime
              .substring(11, searchWithResourceList[i].endDateTime.length - 3);

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
        log("Time List1  length : ${timeList.length}");
        log("Time start : ${timeList.first.startDateTime}");
        log("Time end : ${timeList.first.endDateTime}");
      } else {
        log("Search With Resource List Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("Search With Resource List Error ::: $e");
    } finally {
      isLoading(false);
    }

    // return timeList;
    return {"timeList": timeList, "nextDate": nextDate};
  }

  Future<void> getTimingFunction() async {
    isLoading(true);
    String url = ApiUrl.getTimingApi + "?userId=${UserDetails.uniqueId}";
    log("Get Timing Api Url : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("response body 111 : ${response.body}");

      AvailableTimingModel availableTimingModel =
          AvailableTimingModel.fromJson(json.decode(response.body));
      isSuccessStatus = availableTimingModel.success.obs;

      if (isSuccessStatus.value) {
        isTiming = availableTimingModel.timings.obs;
        log("isTiming : ${isTiming.value}");
      } else {
        log("getTimingFunction Else");
      }
    } catch (e) {
      log("getTimingFunction Error ::: $e");
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
    resourcesCheckList.add(allResourceCheckBoxValue);
    resourcesNameList.add("all");
    getAllResourceListFunction();
  }
}
