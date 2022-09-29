import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';
import '../../model/vendor_available_time_screen_models/get_all_vendor_available_time_model.dart';
import '../../model/vendor_available_time_screen_models/set_vendor_available_time_model.dart';

class VendorAvailableTimeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<AvailableTimeWorkerList> allAvailableTimeList = [];

  RxBool isSundayOn = false.obs;
  RxBool isMondayOn = false.obs;
  RxBool isTuesdayOn = false.obs;
  RxBool isWednesdayOn = false.obs;
  RxBool isThursdayOn = false.obs;
  RxBool isFridayOn = false.obs;
  RxBool isSaturdayOn = false.obs;

  /// Sunday
  // RxString sundayStartHourTime = "09".obs;
  // RxString sundayStartMinuteTime = "30".obs;
  // RxString sundayEndHourTime = "09".obs;
  // RxString sundayEndMinuteTime = "09".obs;
  RxString sundayStartTime = "00:00".obs;
  RxString sundayEndTime = "00:00".obs;

  /// Monday
  // RxString mondayStartHourTime = "09".obs;
  // RxString mondayStartMinuteTime = "09".obs;
  // RxString mondayEndHourTime = "09".obs;
  // RxString mondayEndMinuteTime = "30".obs;
  RxString mondayStartTime = "00:00".obs;
  RxString mondayEndTime = "00:00".obs;

  /// TuesDay
  // RxString tuesdayStartHourTime = "09".obs;
  // RxString tuesdayStartMinuteTime = "09".obs;
  // RxString tuesdayEndHourTime = "09".obs;
  // RxString tuesdayEndMinuteTime = "09".obs;
  RxString tuesdayStartTime = "00:00".obs;
  RxString tuesdayEndTime = "00:00".obs;

  /// WednesDay
  // RxString wednesdayStartHourTime = "09".obs;
  // RxString wednesdayStartMinuteTime = "09".obs;
  // RxString wednesdayEndHourTime = "09".obs;
  // RxString wednesdayEndMinuteTime = "09".obs;
  RxString wednesdayStartTime = "00:00".obs;
  RxString wednesdayEndTime = "00:00".obs;

  /// ThursDay
  // RxString thursdayStartHourTime = "09".obs;
  // RxString thursdayStartMinuteTime = "09".obs;
  // RxString thursdayEndHourTime = "09".obs;
  // RxString thursdayEndMinuteTime = "09".obs;
  RxString thursdayStartTime = "00:00".obs;
  RxString thursdayEndTime = "00:00".obs;

  /// FriDay
  // RxString fridayStartHourTime = "09".obs;
  // RxString fridayStartMinuteTime = "09".obs;
  // RxString fridayEndHourTime = "09".obs;
  // RxString fridayEndMinuteTime = "09".obs;
  RxString fridayStartTime = "00:00".obs;
  RxString fridayEndTime = "00:00".obs;

  /// SaturDay
  // RxString saturdayStartHourTime = "09".obs;
  // RxString saturdayStartMinuteTime = "09".obs;
  // RxString saturdayEndHourTime = "09".obs;
  // RxString saturdayEndMinuteTime = "09".obs;
  RxString saturdayStartTime = "00:00".obs;
  RxString saturdayEndTime = "00:00".obs;

  /// Get Available Time
  getVendorAvailableTimeFunction() async {
    isLoading(true);
    String url =
        ApiUrl.vendorAvailableTimeApi + "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Vendor API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Get All Vendor Response : ${response.body}");

      GetVendorAvailableTimeModel getVendorAvailableTimeModel =
          GetVendorAvailableTimeModel.fromJson(json.decode(response.body));
      isSuccessStatus = getVendorAvailableTimeModel.success.obs;

      if (isSuccessStatus.value) {
        allAvailableTimeList.clear();

        allAvailableTimeList = getVendorAvailableTimeModel.workerList;

        setListValuesFunction(allAvailableTimeList);
        log("allAvailableTimeList : ${allAvailableTimeList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getVendorAvailableTimeFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Set Values From API Response
  void setListValuesFunction(
      List<AvailableTimeWorkerList> allAvailableTimeList) {
    if (allAvailableTimeList.isNotEmpty) {
      for (int i = 0; i < allAvailableTimeList.length; i++) {
        if (allAvailableTimeList[i].day == "Sunday") {
          isSundayOn.value = allAvailableTimeList[i].isActive;
          if (allAvailableTimeList[i].isActive == true) {
            sundayStartTime.value = allAvailableTimeList[i].startTime;
            sundayEndTime.value = allAvailableTimeList[i].endTime;
          }
        } else if (allAvailableTimeList[i].day == "Monday") {
          isMondayOn.value = allAvailableTimeList[i].isActive;
          if (allAvailableTimeList[i].isActive == true) {
            mondayStartTime.value = allAvailableTimeList[i].startTime;
            mondayEndTime.value = allAvailableTimeList[i].endTime;
          }
        } else if (allAvailableTimeList[i].day == "Tuesday") {
          isTuesdayOn.value = allAvailableTimeList[i].isActive;
          if (allAvailableTimeList[i].isActive == true) {
            tuesdayStartTime.value = allAvailableTimeList[i].startTime;
            tuesdayEndTime.value = allAvailableTimeList[i].endTime;
          }
        } else if (allAvailableTimeList[i].day == "Wednesday") {
          isWednesdayOn.value = allAvailableTimeList[i].isActive;
          if (allAvailableTimeList[i].isActive == true) {
            wednesdayStartTime.value = allAvailableTimeList[i].startTime;
            wednesdayEndTime.value = allAvailableTimeList[i].endTime;
          }
        } else if (allAvailableTimeList[i].day == "Thursday") {
          isThursdayOn.value = allAvailableTimeList[i].isActive;
          if (allAvailableTimeList[i].isActive == true) {
            thursdayStartTime.value = allAvailableTimeList[i].startTime;
            thursdayEndTime.value = allAvailableTimeList[i].endTime;
          }
        } else if (allAvailableTimeList[i].day == "Friday") {
          isFridayOn.value = allAvailableTimeList[i].isActive;
          if (allAvailableTimeList[i].isActive == true) {
            fridayStartTime.value = allAvailableTimeList[i].startTime;
            fridayEndTime.value = allAvailableTimeList[i].endTime;
          }
        } else if (allAvailableTimeList[i].day == "Saturday") {
          isSaturdayOn.value = allAvailableTimeList[i].isActive;
          if (allAvailableTimeList[i].isActive == true) {
            saturdayStartTime.value = allAvailableTimeList[i].startTime;
            saturdayEndTime.value = allAvailableTimeList[i].endTime;
          }
        }
      }
    }
  }

  setVendorAvailableTimeFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorSetAvailableTimeApi;
    log("Set Vendor Avail Time API URL : $url");

    try {
      List trueList = [];

      if (isSundayOn.value) {
        trueList.add({
          "Day": "Sunday",
          "StartTime": sundayStartTime.value,
          "EndTime": sundayEndTime.value
        });
      }
      if (isMondayOn.value) {
        trueList.add({
          "Day": "Monday",
          "StartTime": mondayStartTime.value,
          "EndTime": mondayEndTime.value
        });
      }
      if (isTuesdayOn.value) {
        trueList.add({
          "Day": "Tuesday",
          "StartTime": tuesdayStartTime.value,
          "EndTime": tuesdayEndTime.value
        });
      }
      if (isWednesdayOn.value) {
        trueList.add({
          "Day": "Wednesday",
          "StartTime": wednesdayStartTime.value,
          "EndTime": wednesdayEndTime.value
        });
      }
      if (isThursdayOn.value) {
        trueList.add({
          "Day": "Thursday",
          "StartTime": thursdayStartTime.value,
          "EndTime": thursdayEndTime.value
        });
      }
      if (isFridayOn.value) {
        trueList.add({
          "Day": "Friday",
          "StartTime": fridayStartTime.value,
          "EndTime": fridayEndTime.value
        });
      }
      if (isSaturdayOn.value) {
        trueList.add({
          "Day": "Saturday",
          "StartTime": saturdayStartTime.value,
          "EndTime": saturdayEndTime.value
        });
      }

      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['available'] = jsonEncode(trueList);
      request.fields['VendorId'] = "${UserDetails.tableWiseId}";

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((dataLine) {
        SetVendorAvailableTimeModel setVendorAvailableTimeModel =
            SetVendorAvailableTimeModel.fromJson(json.decode(dataLine));
        isSuccessStatus = setVendorAvailableTimeModel.success.obs;

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: setVendorAvailableTimeModel.message);
        } else {
          log("setVendorAvailableTimeFunction Else Else");
          Fluttertoast.showToast(msg: "Something went wrong!");
        }
      });

      /*response.stream.transform(utf8.decoder).listen((value) async {
        SetVendorAvailableTimeModel setVendorAvailableTimeModel = SetVendorAvailableTimeModel.fromJson(json.decode(value));
        isSuccessStatus = setVendorAvailableTimeModel.success.obs;

        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: setVendorAvailableTimeModel.data);
        } else {
          log("setVendorAvailableTimeFunction Else Else");
          Fluttertoast.showToast(msg: "Something went wrong!");
        }

      });*/

    } catch (e) {
      log("setVendorAvailableTimeFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getVendorAvailableTimeFunction();
    super.onInit();
  }
}
