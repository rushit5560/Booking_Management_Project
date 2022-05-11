import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/add_vendor_resource_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/vendor_get_all_resources_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorResourcesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<WorkerList> getResourceList = [];

  GlobalKey<FormState> resourceAddFormKey = GlobalKey();
  TextEditingController resourceNameFieldController = TextEditingController();
  TextEditingController resourceDetailsFieldController = TextEditingController();
  TextEditingController resourcePriceFieldController = TextEditingController();


  File? file;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllResourceAPI();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  /// Get New Resource
  getAllResourceAPI() async {
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

  /// Add New Resource
  addVendorResourcesFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddResourcesApi;
    log("Add Resources API URL : $url");

    try {
      Map<String, String> headers = <String,String>{
        'Authorization': UserDetails.apiToken
      };

      var request = http.MultipartRequest('POST', Uri.parse(url));

      var stream = http.ByteStream(file!.openRead());
      stream.cast();

      var length = await file!.length();

      request.headers.addAll(headers);

      request.fields['ResourceName'] = resourceNameFieldController.text.trim();
      request.fields['Details'] = resourceDetailsFieldController.text.trim();
      request.fields['Price'] = resourcePriceFieldController.text.trim();
      request.fields['VendorId'] = "${UserDetails.tableWiseId}";
      request.fields['CreatedBy'] = UserDetails.uniqueId;

      // request.fields['Name'] = "Shaving";
      // request.fields['ShortDescription'] = "Lorem Ipsum is simply dummy text of the printing.";
      // request.fields['Price'] = "123.50";
      // request.fields['LongDescription'] = "Lorem Ipsum is simply dummy text of the printing.";
      // request.fields['TimeDuration'] = "30";
      // request.fields['CreatedBy'] = UserDetails.uniqueId;
      // request.fields['VendorId'] = "${UserDetails.tableWiseId}";

      log("Fields : ${request.fields}");
      log("request.files: ${request.files}");
      log("headers : $headers");
      log('request.headers: ${request.headers}');

      var multiPart = http.MultipartFile(
        'file',
        stream,
        length,
      );

      request.files.add(multiPart);

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) {
        AddVendorResourceModel addVendorResourceModel = AddVendorResourceModel.fromJson(json.decode(value));
        isSuccessStatus = addVendorResourceModel.success.obs;
        log("Code : ${addVendorResourceModel.statusCode}");


        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addVendorResourceModel.message);
          removeFieldData();
          getAllResourceAPI();
          Get.back();
        } else {
          log("addVendorResourcesFunction Else Else ${addVendorResourceModel.message}");
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
    resourceNameFieldController.clear();
    resourceDetailsFieldController.clear();
    resourcePriceFieldController.clear();
  }

}