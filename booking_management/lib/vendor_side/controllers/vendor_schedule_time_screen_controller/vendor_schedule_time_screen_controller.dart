import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/vendor_get_all_resources_list_model/vendor_get_all_resources_model.dart';
import '../../model/vendor_schedule_time_screen_model/get_all_schedule_time_model.dart';


class VendorScheduleTimeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<WorkerList1> getResourceList = [WorkerList1(resourceName: "Select Resources", id: 0)];
  WorkerList1 selectResourceValue = WorkerList1();

  RxBool isCalenderShow = false.obs;
  RxString selectedDate = "".obs;

  List<String> allScheduleTimeList = [];



  /// Get All Resources - DD
  getAllResourceAPIFunction() async {
    isLoading(true);

    String url = ApiUrl.vendorGetAllResourcesApi + "?VendorId=${UserDetails.tableWiseId}";
    log('Url : $url');
    Map<String, String> headers= <String,String>{
      'Authorization': UserDetails.apiToken
    };
    log('headers: $headers');

    try {
      http.Response response = await http.post(Uri.parse(url),headers: headers);
      log('Response : ${response.body}');

      GetAllResorcesListModel getAllResorcesListModelModel = GetAllResorcesListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllResorcesListModelModel.success.obs;

      log("status: $isSuccessStatus");

      if (isSuccessStatus.value) {
        getResourceList = getAllResorcesListModelModel.workerList;
        selectResourceValue = getResourceList[0];
        log('getResourceList: $getResourceList');
      } else {
        log('SignIn False False');
        Get.snackbar("${getAllResorcesListModelModel.success}", '');
      }
    } catch (e) {
      log('SignIn Error : $e');
    } finally {
      isLoading(false);
    }
  }


  /// Get Slot List
  getAllSLotsFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllScheduleSlotApi;
    log("Slot SPI URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['VendorId'] = UserDetails.tableWiseId.toString();
      request.fields['ResourceId'] = "${selectResourceValue.id}";
      request.fields['StartTime'] = selectedDate.value;

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');
      log('response: $response');

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value ::: $value");
        GetAllScheduleTimeModel getAllScheduleTimeModel = GetAllScheduleTimeModel.fromJson(json.decode(value));
        isSuccessStatus = getAllScheduleTimeModel.success.obs;

        if(isSuccessStatus.value) {
          allScheduleTimeList.clear();

          allScheduleTimeList = getAllScheduleTimeModel.workerList;
          log("getAllScheduleTimeModel : $getAllScheduleTimeModel");

        } else {
          log("getAllSLotsFunction Else Else");
          Fluttertoast.showToast(msg: "Something went wrong!");
        }
      });
    } catch(e) {
      log("getAllSLotsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

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