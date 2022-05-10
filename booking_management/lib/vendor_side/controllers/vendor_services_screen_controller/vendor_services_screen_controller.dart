import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/vendor_service_screen_model/add_vendor_service_model.dart';
import '../../model/vendor_service_screen_model/get_vendor_service_model.dart';

class VendorServicesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;


  GlobalKey<FormState> serviceAddFormKey = GlobalKey();
  TextEditingController serviceNameFieldController = TextEditingController();
  // TextEditingController serviceTimeDurationFieldController = TextEditingController();
  TextEditingController servicePriceFieldController = TextEditingController();
  TextEditingController serviceShortDesFieldController = TextEditingController();
  TextEditingController serviceLongDesFieldController = TextEditingController();

  List<WorkerList> allResourcesList = [];

  RxInt selectTimeDuration = 15.obs;
  List<int> timeDurationList = [
    15, 30, 45, 1
  ];


  /// Get All Services
  getAllVendorServiceFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllResourcesApi + "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Service API URL : $url");

    try {
      Map<String, String> headers = <String,String>{
        'Authorization': UserDetails.apiToken
      };

      var request = http.MultipartRequest('GET', Uri.parse(url));
      request.headers.addAll(headers);
      // request.fields['VendorId'] = "${UserDetails.tableWiseId}";
      log("headers : $headers");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        GetAllVendorServiceModel getAllVendorServiceModel = GetAllVendorServiceModel.fromJson(json.decode(value));
        isSuccessStatus = getAllVendorServiceModel.success.obs;
        log("Code : ${getAllVendorServiceModel.statusCode}");


        if(isSuccessStatus.value) {
          allResourcesList = getAllVendorServiceModel.workerList;
          log("List $allResourcesList");
          Get.back();
        } else {
          Fluttertoast.showToast(msg: "Something wnt wrong!");

        }
      });

    } catch(e) {
      log("getAllVendorServiceFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  /// Add New Service
  addVendorResourcesFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddAndUpdateServiceApi;
    log("Add Resources API URL : $url");

    try {
      Map<String, String> headers = <String,String>{
        'Authorization': UserDetails.apiToken
      };

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(headers);

      request.fields['Name'] = serviceNameFieldController.text.trim();
      request.fields['ShortDescription'] = serviceShortDesFieldController.text.trim();
      request.fields['Price'] = servicePriceFieldController.text.trim();
      request.fields['LongDescription'] = serviceLongDesFieldController.text.trim();
      request.fields['TimeDuration'] = "${selectTimeDuration.value}";
      request.fields['CreatedBy'] = UserDetails.uniqueId;
      request.fields['VendorId'] = "${UserDetails.tableWiseId}";

      // request.fields['Name'] = "Shaving";
      // request.fields['ShortDescription'] = "Lorem Ipsum is simply dummy text of the printing.";
      // request.fields['Price'] = "123.50";
      // request.fields['LongDescription'] = "Lorem Ipsum is simply dummy text of the printing.";
      // request.fields['TimeDuration'] = "30";
      // request.fields['CreatedBy'] = UserDetails.uniqueId;
      // request.fields['VendorId'] = "${UserDetails.tableWiseId}";

      log("Fields : ${request.fields}");
      log("headers : $headers");

      var response = await request.send();

      response.stream.transform(utf8.decoder).listen((value) {
        AddVendorServiceModel addVendorServiceModel = AddVendorServiceModel.fromJson(json.decode(value));
        isSuccessStatus = addVendorServiceModel.success.obs;
        log("Code : ${addVendorServiceModel.statusCode}");


        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addVendorServiceModel.message);
          removeFieldData();
          getAllVendorServiceFunction();
          Get.back();
        } else {
          log("addVendorResourcesFunction Else Else ${addVendorServiceModel.message}");
          Fluttertoast.showToast(msg: "Something wnt wrong!");

        }
      });

    } catch(e) {
      log("addVendorResourcesFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  removeFieldData() {
    serviceNameFieldController.clear();
    servicePriceFieldController.clear();
    serviceShortDesFieldController.clear();
    serviceLongDesFieldController.clear();
    selectTimeDuration = 15.obs;
  }

  @override
  void onInit() {
    getAllVendorServiceFunction();
    super.onInit();
  }


}