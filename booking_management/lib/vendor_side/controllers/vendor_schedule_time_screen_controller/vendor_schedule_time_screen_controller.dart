import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/vendor_get_all_resources_list_model/vendor_get_all_resources_model.dart';
import '../../model/vendor_schedule_time_screen_model/get_all_resource_by_vendor_id_model.dart';
import '../../model/vendor_schedule_time_screen_model/get_all_schedule_time_model.dart';
import '../../model/vendor_schedule_time_screen_model/get_all_time_list_by_resource_id_model.dart';
import '../../model/vendor_schedule_time_screen_model/set_schedule_time_model.dart';

class VendorScheduleTimeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<WorkerList1> getResourceList = [
    WorkerList1(resourceName: "Select Resources", id: 0)
  ];
  WorkerList1 selectResourceValue = WorkerList1();
  List<String> selectResourceTimeTypeList = [
    "Hours",
    "Days",
  ];
  RxString selectResourceTimeType = "Hours".obs;

  RxBool isCalenderShow = false.obs;
  RxString selectedDate = "".obs;
  RxBool isEndCalenderShow = false.obs;
  RxString selectedEndDate = "".obs;

  List<String> allScheduleTimeList = [];
  List<String> allScheduleDaysList = [];
  List<bool> checkScheduleTimeList = [];

  // List<AllResourcesWorkerList> getAllResourcesList = [];

  /// Get All Resources - DD
  getAllResourceAPIFunction() async {
    isLoading(true);

    String url = ApiUrl.vendorGetAllResourcesApi +
        "?VendorId=${UserDetails.tableWiseId}";
    log('Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getAllResourceAPI Response st code : ${response.statusCode}');
      log('getAllResourceAPI Response : ${response.body}');

      GetAllResorcesListModel getAllResorcesListModelModel =
          GetAllResorcesListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllResorcesListModelModel.success.obs;

      log("getAllResourceAPI status: $isSuccessStatus");

      if (isSuccessStatus.value) {
        getResourceList = getAllResorcesListModelModel.workerList;
        selectResourceValue = getAllResorcesListModelModel.workerList[0];
        if (selectResourceValue.isEvent == true) {
          selectResourceTimeType = "Days".obs;
        }
        log('getResourceList: $getResourceList');
        log('selectResourceTimeType: $selectResourceTimeType');

        // for(int i = 0; i < getResourceList.length; i++) {
        //   await getResourcesTimeListFunction(resId: getResourceList[i].id.toString());
        // }
      } else {
        log('getAllResourceAPI False False');
        Get.snackbar("${getAllResorcesListModelModel.success}", '');
      }
    } catch (e) {
      log(' getAllResourceAPI Error : $e');

      rethrow;
    }
    // finally {
    //   // await getAllResourcesByIdFunction();
    // }
    isLoading(false);
  }

  /// Get Slot List
  getAllSLotsFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllScheduleSlotApi;
    log("getAllSLots aPI URL : $url");

    try {
      if (selectResourceTimeType.value == "Hours") {
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers.addAll(apiHeader.headers);

        request.fields['VendorId'] = UserDetails.tableWiseId.toString();
        request.fields['ResourceId'] = "${selectResourceValue.id}";
        request.fields['setEventDays'] = "false";
        request.fields['StartTime'] = selectedDate.value;

        log("getAllSLots Fields : ${request.fields}");
        log('getAllSLots request.headers: ${request.headers}');

        var response = await request.send();
        log('getAllSLots status code: ${response.statusCode}');

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((value) async {
          log("getAllSlots value ::: $value");
          GetAllScheduleTimeModel getAllScheduleTimeModel =
              GetAllScheduleTimeModel.fromJson(json.decode(value));
          isSuccessStatus = getAllScheduleTimeModel.success.obs;

          if (isSuccessStatus.value) {
            allScheduleTimeList.clear();

            allScheduleTimeList = getAllScheduleTimeModel.workerList;
            log("getAllScheduleTimeModel : $getAllScheduleTimeModel");

            for (int i = 0; i < allScheduleTimeList.length; i++) {
              checkScheduleTimeList.add(true);
            }
          } else {
            log("getAllSLotsFunction Else Else");
            Fluttertoast.showToast(msg: "Something went wrong!");
          }
        });
      } else {
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers.addAll(apiHeader.headers);

        request.fields['VendorId'] = UserDetails.tableWiseId.toString();
        request.fields['ResourceId'] = "${selectResourceValue.id}";
        request.fields['setEventDays'] = "true";
        request.fields['StartTime'] = selectedDate.value;
        request.fields['EndTime'] = selectedEndDate.value;

        log("getAllSLots days Fields : ${request.fields}");
        log('getAllSLots days request.headers: ${request.headers}');

        var response = await request.send();
        log('getAllSLots days status code: ${response.statusCode}');

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((value) async {
          log("getAllSlots value ::: $value");
          GetAllScheduleTimeModel getAllScheduleTimeModel =
              GetAllScheduleTimeModel.fromJson(json.decode(value));
          isSuccessStatus = getAllScheduleTimeModel.success.obs;

          if (isSuccessStatus.value) {
            allScheduleDaysList.clear();

            allScheduleDaysList = getAllScheduleTimeModel.workerList;
            log("getAllScheduleTimeModel : $getAllScheduleTimeModel");

            for (int i = 0; i < allScheduleDaysList.length; i++) {
              checkScheduleTimeList.add(true);
            }
          } else {
            log("getAllSLotsFunction days Else Else");
            Fluttertoast.showToast(msg: "Something went wrong!");
          }
        });
      }
    } catch (e) {
      log("getAllSLotsFunction Error ::: $e");

      rethrow;
    }

    isLoading(false);
  }

  /// Set Selected Schedule Timing
  setSelectedScheduleTimeFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorSetScheduleTimeApi;
    log("Set Schedule Time API URL : $url");

    try {
      List trueList = [];

      if (selectResourceTimeType.value == "Hours") {
        for (int i = 0; i < allScheduleTimeList.length - 1; i++) {
          if (checkScheduleTimeList[i] == true) {
            String startTime = allScheduleTimeList[i].split("T")[1];
            String endTime = allScheduleTimeList[i + 1].split("T")[1];

            /// Remove AM & PM
            String start = startTime;
            String end = endTime;

            trueList.add({
              "ResourceId": selectResourceValue.id,
              "ScheduleDate": selectedDate.value.toString(),
              "start": start,
              "end": end,
            });
          }
        }

        log("listData : $trueList");

        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers.addAll(apiHeader.headers);

        request.fields['bookings'] = jsonEncode(trueList);
        request.fields['VendorId'] = "${UserDetails.tableWiseId}";

        log("Fields : ${request.fields}");
        // log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.statusCode}');

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((dataLine) {
          log('response body : $dataLine');
          SetScheduleTimeModel setScheduleTimeModel =
              SetScheduleTimeModel.fromJson(json.decode(dataLine));
          isSuccessStatus = setScheduleTimeModel.success.obs;
          log("setScheduleTimeModel.statusCode : ${setScheduleTimeModel.statusCode}");
          log("setScheduleTimeModel.success : ${setScheduleTimeModel.success}");
          log("setScheduleTimeModel.message : ${setScheduleTimeModel.message}");

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: setScheduleTimeModel.message);

            Get.back();
          } else {
            log("setSelectedScheduleTimeFunction Else Else");
            Fluttertoast.showToast(msg: "Something went wrong!");
          }
        });
      } else {
        for (int i = 0; i < allScheduleTimeList.length; i++) {
          if (checkScheduleTimeList[i] == true) {
            String startTime = DateFormat("d/MM/yyyy")
                .format(DateTime.parse(allScheduleTimeList[i].toString()))
                .split("T")[0];
            String endTime = DateFormat("d/MM/yyyy")
                .format(DateTime.parse(allScheduleTimeList[i].toString()))
                .split("T")[0];

            /// Rformat date for api call
            String scheduleDate = DateFormat("d-MMMM-yyyy")
                .format(DateTime.parse(allScheduleTimeList[i].toString()))
                .split("T")[0];
            String startDate = startTime;
            String endDate = endTime;

            trueList.add({
              "ResourceId": selectResourceValue.id,
              "ScheduleDate": scheduleDate.toString(),
              "start": startDate,
              "end": endDate,
            });
          }
        }

        // log("listData : $trueList");

        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers.addAll(apiHeader.headers);

        request.fields['bookings'] = jsonEncode(trueList);
        // request.fields['VendorId'] = "${UserDetails.tableWiseId}";

        log("Fields : ${request.fields}");
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.statusCode}');

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((dataLine) {
          log('response body : ${dataLine}');
          SetScheduleTimeModel setScheduleTimeModel =
              SetScheduleTimeModel.fromJson(json.decode(dataLine));
          isSuccessStatus = setScheduleTimeModel.success.obs;
          log("setScheduleTimeModel.statusCode : ${setScheduleTimeModel.statusCode}");
          log("setScheduleTimeModel.success : ${setScheduleTimeModel.success}");
          log("setScheduleTimeModel.message : ${setScheduleTimeModel.message}");

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: setScheduleTimeModel.message);

            Get.back();
          } else {
            log("setSelectedScheduleTimeFunction Else Else");
            Fluttertoast.showToast(msg: "Something went wrong!");
          }
        });
      }
    } catch (e) {
      log("setSelectedScheduleTimeFunction Error ::: $e");
      rethrow;
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
    String url = ApiUrl.getResourcesTimeSlotApi +
        "?Id=$resId&dDate=${dateModule}T$timeModule&Duration&Time";
    log("Get Resources Time List API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Resource Time List : ${response.body}");

      GetAllTimeListByResourceIdModel getAllTimeListByResourceIdModel =
          GetAllTimeListByResourceIdModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllTimeListByResourceIdModel.success.obs;

      if (isSuccessStatus.value) {
        for (int i = 0;
            i < getAllTimeListByResourceIdModel.workerList!.length;
            i++) {
          String t = getAllTimeListByResourceIdModel
              .workerList![i].startDateTime
              .substring(
                  11, getAllTimeListByResourceIdModel.workerList!.length - 3);
          timeList.add(t);
        }

        log("Time List : $timeList");
      } else {
        log("getResourcesTimeListFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getResourcesTimeListFunction Error ::: $e");
    } finally {
      isLoading(true);
    }

    return timeList;
  }

  /// Get All Resources By Id
  /*getAllResourcesByIdFunction() async {
    DateTime dateTime = DateTime.now();
    String dateModule = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
    String timeModule = "${dateTime.hour}:${dateTime.minute}:00";
    isLoading(true);
    String url = ApiUrl.getAllResourcesByVendorIdApi + "?Id=${UserDetails.tableWiseId}&dDate=${dateModule}T$timeModule&Duration&Time";
    log("Get All Resources By Id API URL ::: $url");


   try {
     http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
     log("All Resources API Response : ${response.body}");

     GetAllResourceByVendorIdModel getAllResourceByVendorIdModel = GetAllResourceByVendorIdModel.fromJson(json.decode(response.body));
     isSuccessStatus = getAllResourceByVendorIdModel.success.obs;

     if(isSuccessStatus.value) {
       getAllResourcesList.clear();

       getAllResourcesList = getAllResourceByVendorIdModel.workerList;
       log("getAllResourcesList : ${getAllResourcesList.length}");

       for(int i = 0; i < getAllResourcesList.length; i++) {
         getAllResourcesList[i].timingList = await getResourcesTimeListFunction(resId: getResourceList[i].id.toString());
       }

     } else {
       log("getAllResourcesByIdFunction Else Else");
       Fluttertoast.showToast(msg: "Something went wrong!");
     }
   } catch(e) {
     log("getAllResourcesByIdFunction Error ::: $e");
   } finally {
     isLoading(false);
   }
  }*/

  @override
  void onInit() {
    getAllResourceAPIFunction();
    super.onInit();
  }

  loadUI() async {
    isLoading(true);
    isLoading(false);
  }
}
