import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/vendor_side/controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/add_vendor_resource_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/delete_vendor_resource_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/get_vendor_service_details_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/update_vendor_resource_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/vendor_get_all_resources_model.dart';
import 'package:booking_management/vendor_side/screens/vendor_resources_screen/vendor_add_resource_screen/vendor_add_resource_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import '../../../common_modules/constants/app_colors.dart';

class VendorAddResourcesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<WorkerList1> getResourceList = [];

  /// Add Resource Form TextField
  GlobalKey<FormState> resourceAddFormKey = GlobalKey();
  TextEditingController resourceNameFieldController = TextEditingController();
  TextEditingController resourceDetailsFieldController =
      TextEditingController();
  TextEditingController resourcePriceFieldController = TextEditingController();
  TextEditingController resourceCapacityFieldController =
      TextEditingController();

  /// add resource  values
  RxBool isEvent = false.obs;
  RxBool isAdditionalCriteria = false.obs;

  List<Widget> criteriaList = [];

  List<String> criteriaIdNumberList = [];
  List<TextEditingController> criteriaNameControllerList = [];
  List<TextEditingController> criteriaOptionControllerList = [];

  List<Map<String, String>> criteriaObjectList = [];

  TextEditingController criteriaNameFieldController = TextEditingController();
  TextEditingController criteriaOptionFieldController = TextEditingController();

  File? addFile;

  ApiHeader apiHeader = ApiHeader();
  int selectedItemId = 0;

  @override
  void onInit() {
    super.onInit();

    criteriaNameControllerList.add(criteriaNameFieldController);
    criteriaOptionControllerList.add(criteriaOptionFieldController);

    criteriaList = [
      CriteriaFormWidget(
        index: 0,
        criteriaNameFieldController: criteriaNameControllerList[0],
        optionFieldController: criteriaOptionControllerList[0],
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    addFile!.delete();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  /// Add New Resource
  addVendorResourcesFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddAndUpdateResourcesApi;
    log("Add Resources API URL : $url");

    final vendorResScreenController =
        Get.find<VendorResourcesScreenController>();

    try {
      // Map<String, String> headers = <String,String>{
      //   'Authorization': UserDetails.apiToken
      // };

      var request = http.MultipartRequest('POST', Uri.parse(url));
      var stream = http.ByteStream(addFile!.openRead());
      stream.cast();
      var length = await addFile!.length();

      request.files
          .add(await http.MultipartFile.fromPath("Image", addFile!.path));

      request.headers.addAll(apiHeader.headers);

      request.fields['ResourceName'] = resourceNameFieldController.text.trim();
      request.fields['Details'] = resourceDetailsFieldController.text.trim();
      request.fields['Price'] = resourcePriceFieldController.text.trim();
      request.fields['vendorId'] = "${UserDetails.tableWiseId}";
      request.fields['CreatedBy'] = UserDetails.uniqueId;
      request.fields['Capacity'] = resourceCapacityFieldController.text == ""
          ? "0"
          : resourceCapacityFieldController.text.trim();
      request.fields['IsEvent'] = "${isEvent.value}";
      request.fields['RequireCriteria'] = "${isAdditionalCriteria.value}";

      if (isAdditionalCriteria.value == true) {
        request.fields['Criterias'] = json.encode(criteriaObjectList);
      } else {
        request.fields['Criterias'] = json.encode([]);
        log("require criterias is not true.");
      }

      // request.fields['Name'] = "Shaving";
      // request.fields['ShortDescription'] = "Lorem Ipsum is simply dummy text of the printing.";
      // request.fields['Price'] = "123.50";
      // request.fields['LongDescription'] = "Lorem Ipsum is simply dummy text of the printing.";
      // request.fields['TimeDuration'] = "30";
      // request.fields['CreatedBy'] = UserDetails.uniqueId;
      // request.fields['VendorId'] = "${UserDetails.tableWiseId}";

      //log('request.headers: ${request}');

      var multiPart = http.MultipartFile(
        'Image',
        stream,
        length,
      );

      request.files.add(multiPart);
      log("Fields : ${request.fields}");
      log("request.files: ${request.files}");
      //log("headers : $headers");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.request}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log("value : $value");
        AddVendorResourceModel addVendorResourceModel =
            AddVendorResourceModel.fromJson(json.decode(value));
        isSuccessStatus = addVendorResourceModel.success.obs;
        log("Code : ${addVendorResourceModel.statusCode}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addVendorResourceModel.message);
          removeFieldData();
          await vendorResScreenController.getAllResourceAPI();
          Get.back();
        } else {
          log("addVendorResourcesFunction Else Else ${addVendorResourceModel.message}");
          Fluttertoast.showToast(msg: addVendorResourceModel.message);
        }
      });
    } catch (e) {
      log("addVendorResourcesFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  removeFieldData() {
    resourceNameFieldController.clear();
    resourceDetailsFieldController.clear();
    resourcePriceFieldController.clear();
    // file!.deleteSync();
    addFile!.deleteSync();
    //updatePhotoUrl = "";
  }
}
