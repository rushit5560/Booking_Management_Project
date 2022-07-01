import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/add_vendor_resource_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/delete_vendor_resource_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/get_vendor_service_details_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/update_vendor_resource_model.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/vendor_get_all_resources_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorResourcesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<WorkerList1> getResourceList = [];

  /// Add Resource Form TextField
  GlobalKey<FormState> resourceAddFormKey = GlobalKey();
  TextEditingController resourceNameFieldController = TextEditingController();
  TextEditingController resourceDetailsFieldController = TextEditingController();
  TextEditingController resourcePriceFieldController = TextEditingController();
  TextEditingController resourceCapacityFieldController = TextEditingController();

  /// Update Resource Form TextField
  GlobalKey<FormState> resourceUpdateFormKey = GlobalKey();
  TextEditingController updateResourceNameFieldController = TextEditingController();
  TextEditingController updateResourceDetailsFieldController = TextEditingController();
  TextEditingController updateResourcePriceFieldController = TextEditingController();
  TextEditingController updateResourceCapacityFieldController = TextEditingController();

  /// isEvent checkbox value
  RxBool isEvent = false.obs;
  bool updateEvent = false;

  File? addFile;
  File? file;
  String updatePhotoUrl = "";

  ApiHeader apiHeader = ApiHeader();
  int selectedItemId = 0;

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
    String url = ApiUrl.vendorAddAndUpdateResourcesApi;
    log("Add Resources API URL : $url");

    try {
      Map<String, String> headers = <String,String>{
        'Authorization': UserDetails.apiToken
      };

      var request = http.MultipartRequest('POST', Uri.parse(url));

      var stream = http.ByteStream(addFile!.openRead());
      stream.cast();

      var length = await addFile!.length();

      request.headers.addAll(headers);

      request.fields['ResourceName'] = resourceNameFieldController.text.trim();
      request.fields['Details'] = resourceDetailsFieldController.text.trim();
      request.fields['Price'] = resourcePriceFieldController.text.trim();
      request.fields['id'] = "${UserDetails.tableWiseId}";
      request.fields['CreatedBy'] = UserDetails.uniqueId;
      request.fields['Capacity'] = resourceCapacityFieldController.text.trim();
      request.fields['isEvent'] = "${isEvent.value}";

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
      //log('request.headers: ${request}');

      var multiPart = http.MultipartFile(
        'Image',
        stream,
        length,
      );

      request.files.add(multiPart);

      var response = await request.send();
      log('response: ${response.request}');

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value : $value");
        AddVendorResourceModel addVendorResourceModel = AddVendorResourceModel.fromJson(json.decode(value));
        isSuccessStatus = addVendorResourceModel.success.obs;
        log("Code : ${addVendorResourceModel.statusCode}");


        if(isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addVendorResourceModel.message);
          removeFieldData();
          await getAllResourceAPI();
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

  /// Delete Resource
  deleteVendorResourceFunction({required String resourceId}) async {
    isLoading(true);
    String url = ApiUrl.vendorDeleteResourcesApi + "?id=$resourceId";
    log("Delete Vendor Resources API URL : $url");

    try {
      // Map<String, String> headers = <String,String>{
      //   'Authorization': UserDetails.apiToken
      // };

      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers);
      log("response : ${response.body}");

      DeleteVendorResourceModel deleteVendorResourceModel = DeleteVendorResourceModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteVendorResourceModel.success.obs;
      log("Code : ${deleteVendorResourceModel.statusCode}");

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: deleteVendorResourceModel.message);
        await getAllResourceAPI();
      } else {
        Fluttertoast.showToast(msg: "Something wnt wrong!");
      }

    } catch(e) {
      log("deleteVendorResourcesFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  /// Update Resource
  updateVendorResourceFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddAndUpdateResourcesApi;
    log("Update Resources API URL : $url");

    try {
      // Map<String, String> headers = <String,String>{
      //   'Authorization': UserDetails.apiToken
      // };
      if(file != null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(file!.openRead());
        stream.cast();

        var length = await file!.length();

        request.headers.addAll(apiHeader.headers);

        request.fields['ResourceName'] = updateResourceNameFieldController.text.trim();
        request.fields['Details'] = updateResourceDetailsFieldController.text.trim();
        request.fields['Price'] = updateResourcePriceFieldController.text.trim();
        //request.fields['Image'] = updateServiceLongDesFieldController.text.trim();
        request.fields['id'] = "$selectedItemId";
        request.fields['CreatedBy'] = UserDetails.uniqueId;
        request.fields['Capacity'] = updateResourceCapacityFieldController.text.trim();
        request.fields['isEvent'] = "$updateEvent";


        log("Fields : ${request.fields}");
        log("headers : ${apiHeader.headers}");

        var multiPart = http.MultipartFile(
          'Image',
          stream,
          length,
        );

        request.files.add(multiPart);

        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateVendorResourceModel updateVendorResourceModel = UpdateVendorResourceModel.fromJson(json.decode(value));
          isSuccessStatus = updateVendorResourceModel.success.obs;
          log("Code : ${updateVendorResourceModel.statusCode}");


          if(isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateVendorResourceModel.message);
            // removeFieldData();
            getAllResourceAPI();
            Get.back();
          } else {
            log("addVendorResourcesFunction Else Else ${updateVendorResourceModel.message}");
            Fluttertoast.showToast(msg: "Something wnt wrong!");

          }
        });
      }
      else if(file == null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(file!.openRead());
        //stream.cast();

        //var length = await file!.length();

        request.headers.addAll(apiHeader.headers);

        request.fields['ResourceName'] = updateResourceNameFieldController.text.trim();
        request.fields['Details'] = updateResourceDetailsFieldController.text.trim();
        request.fields['Price'] = updateResourcePriceFieldController.text.trim();
        //request.fields['Image'] = updateServiceLongDesFieldController.text.trim();
        request.fields['id'] = "$selectedItemId";
        request.fields['CreatedBy'] = UserDetails.uniqueId;
        request.fields['Capacity'] = updateResourceCapacityFieldController.text.trim();
        request.fields['isEvent'] = "$isEvent";

        log("Fields : ${request.fields}");
        log("headers : ${apiHeader.headers}");

        // var multiPart = http.MultipartFile(
        //   'Image',
        //   stream,
        //   length,
        // );

        //request.files.add(multiPart);

        var response = await request.send();

        response.stream.transform(utf8.decoder).listen((value) {
          UpdateVendorResourceModel updateVendorResourceModel = UpdateVendorResourceModel.fromJson(json.decode(value));
          isSuccessStatus = updateVendorResourceModel.success.obs;
          log("Code : ${updateVendorResourceModel.statusCode}");


          if(isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateVendorResourceModel.message);
            // removeFieldData();
            getAllResourceAPI();
            Get.back();
          } else {
            log("addVendorResourcesFunction Else Else ${updateVendorResourceModel.message}");
            Fluttertoast.showToast(msg: "Something wnt wrong!");

          }
        });
      }


    } catch(e) {
      log("updateVendorResource: $e");
    } finally {
      isLoading(false);
    }


  }

  /// Get Resources Details By Id
  getResourcesDetailsByIdFunction({required int id}) async {
    isLoading(true);
    String url = ApiUrl.vendorGetResourceDetailsApi + "?id=$id";
    log("Get Service By ID API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response : ${response.body}');

      GetResourceDetailsModel getResourceDetailsModel = GetResourceDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getResourceDetailsModel.success.obs;

      if(isSuccessStatus.value) {
        selectedItemId = getResourceDetailsModel.workerList.id;
        updateResourceNameFieldController.text = getResourceDetailsModel.workerList.resourceName;
        updateResourceDetailsFieldController.text = getResourceDetailsModel.workerList.details;
        updateResourcePriceFieldController.text = getResourceDetailsModel.workerList.price.toString();
        updateResourceCapacityFieldController.text = getResourceDetailsModel.workerList.capacity.toString();
        updateEvent = getResourceDetailsModel.workerList.isEvent;
        //updatePhotoUrl = "http://5.189.147.159:9600///images//Resource//9188f689-6c67-4fae-9045-a55a32888891.png";
        updatePhotoUrl = "${ApiUrl.apiImagePath}${getResourceDetailsModel.workerList.resourceName}";

        // updateServiceNameFieldController.text = getServiceDetailsModel.workerList.name;
        // updateServiceShortDesFieldController.text = getServiceDetailsModel.workerList.shortDescription;
        // updateServiceLongDesFieldController.text = getServiceDetailsModel.workerList.longDescription;
        // updateServicePriceFieldController.text = getServiceDetailsModel.workerList.price.toString();
        // updateTimeDuration = getServiceDetailsModel.workerList.timeDuration.obs;

      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getResourcesDetailsByIdFunction Else Else");
      }
    } catch(e) {
      log("getResourcesDetailsByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  removeFieldData() {
    resourceNameFieldController.clear();
    resourceDetailsFieldController.clear();
    resourcePriceFieldController.clear();
    file!.delete();
    addFile!.deleteSync();
    //updatePhotoUrl = "";
  }

}