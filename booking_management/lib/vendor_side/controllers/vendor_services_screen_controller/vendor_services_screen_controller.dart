import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/vendor_service_screen_model/add_vendor_service_model.dart';
import '../../model/vendor_service_screen_model/delete_vendor_service_model.dart';
import '../../model/vendor_service_screen_model/get_vendor_service_details_model.dart';
import '../../model/vendor_service_screen_model/get_vendor_service_model.dart';
import '../../model/vendor_service_screen_model/update_vendor_service_model.dart';

class VendorServicesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  /// Add New Service Fields
  GlobalKey<FormState> serviceAddFormKey = GlobalKey();
  TextEditingController serviceNameFieldController = TextEditingController();
  TextEditingController servicePriceFieldController = TextEditingController();
  TextEditingController serviceShortDesFieldController =
      TextEditingController();
  TextEditingController serviceLongDesFieldController = TextEditingController();
  RxInt selectTimeDuration = 15.obs;

  /// Update Service Fields
  GlobalKey<FormState> serviceUpdateFormKey = GlobalKey();
  TextEditingController updateServiceNameFieldController =
      TextEditingController();
  TextEditingController updateServicePriceFieldController =
      TextEditingController();
  TextEditingController updateServiceShortDesFieldController =
      TextEditingController();
  TextEditingController updateServiceLongDesFieldController =
      TextEditingController();
  RxInt updateTimeDuration = 15.obs;
  int selectedItemId = 0;

  List<WorkerList1> allResourcesList = [];
  ApiHeader apiHeader = ApiHeader();

  List<int> timeDurationList = [15, 30, 45, 1];

  /// Get All Services
  getAllVendorServiceFunction() async {
    isLoading(true);
    String url =
        ApiUrl.vendorGetAllServicesApi + "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Service API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response : $response');

      GetAllVendorServiceModel getAllVendorServiceModel =
          GetAllVendorServiceModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllVendorServiceModel.success.obs;
      log("Code : ${getAllVendorServiceModel.statusCode}");

      if (isSuccessStatus.value) {
        allResourcesList = getAllVendorServiceModel.workerList;
      } else {
        Fluttertoast.showToast(msg: "Something wnt wrong!");
      }
    } catch (e) {
      log("getAllVendorServiceFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add New Service
  addVendorServiceFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddAndUpdateServiceApi;
    log("Add Resources API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(apiHeader.headers);

      request.fields['Name'] = serviceNameFieldController.text.trim();
      request.fields['ShortDescription'] =
          serviceShortDesFieldController.text.trim();
      request.fields['Price'] = servicePriceFieldController.text.trim();
      request.fields['LongDescription'] =
          serviceLongDesFieldController.text.trim();
      request.fields['TimeDuration'] = "${selectTimeDuration.value}";
      request.fields['CreatedBy'] = UserDetails.uniqueId;
      request.fields['VendorId'] = "${UserDetails.tableWiseId}";

      log("Add Resources Fields : ${request.fields}");
      log("Add Resources headers : ${apiHeader.headers}");

      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        AddVendorServiceModel addVendorServiceModel =
            AddVendorServiceModel.fromJson(json.decode(value));
        log("Add Resources res body : $value");
        isSuccessStatus = addVendorServiceModel.success.obs;
        log("Code : ${addVendorServiceModel.statusCode}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: "Service has been added successfully.");
          removeFieldData();
          await getAllVendorServiceFunction();
          Get.back();
        } else {
          log("addVendorResourcesFunction Else Else ${addVendorServiceModel.message}");
          Fluttertoast.showToast(msg: "Something wnt wrong!");
        }
      });
    } catch (e) {
      log("addVendorResourcesFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Delete Service
  deleteVendorServiceFunction({required String resourceId}) async {
    isLoading(true);
    String url = ApiUrl.vendorDeleteServiceApi + "?id=$resourceId";
    log("Delete Vendor Resources API URL : $url");

    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: apiHeader.headers);
      log("response : ${response.body}");

      DeleteServiceServiceModel deleteServiceServiceModel =
          DeleteServiceServiceModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteServiceServiceModel.success.obs;
      log("Code : ${deleteServiceServiceModel.statusCode}");

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "Service has been deleted successfully.");
        await getAllVendorServiceFunction();
      } else {
        Fluttertoast.showToast(msg: "Something wnt wrong!");
      }
    } catch (e) {
      log("deleteVendorResourcesFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Update Service
  updateVendorServiceFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddAndUpdateServiceApi;
    log("Update Resources API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['Name'] = updateServiceNameFieldController.text.trim();
      request.fields['ShortDescription'] =
          updateServiceShortDesFieldController.text.trim();
      request.fields['Price'] = updateServicePriceFieldController.text.trim();
      request.fields['LongDescription'] =
          updateServiceLongDesFieldController.text.trim();
      request.fields['TimeDuration'] = "${updateTimeDuration.value}";
      request.fields['ModifiedBy'] = UserDetails.uniqueId;
      request.fields['VendorId'] = "${UserDetails.tableWiseId}";
      request.fields['Id'] = "$selectedItemId";

      log("Fields123 : ${request.fields}");
      log("headers : ${apiHeader.headers}");

      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) {
        UpdateVendorServiceModel updateVendorServiceModel =
            UpdateVendorServiceModel.fromJson(json.decode(value));
        isSuccessStatus = updateVendorServiceModel.success.obs;
        log("Code : ${updateVendorServiceModel.statusCode}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: updateVendorServiceModel.message);
          // removeFieldData();
          getAllVendorServiceFunction();
          Get.back();
        } else {
          log("addVendorResourcesFunction Else Else ${updateVendorServiceModel.message}");
          Fluttertoast.showToast(msg: "Something wnt wrong!");
        }
      });
    } catch (e) {
      log("");
    } finally {
      isLoading(false);
    }
  }

  /// Get Service Details By Id
  getAdditionalDetailsByIdFunction({required int id}) async {
    isLoading(true);
    String url = ApiUrl.vendorGetServiceDetailsApi + "?id=$id";
    log("Get Service By ID API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response : ${response.body}');

      GetServiceDetailsModel getServiceDetailsModel =
          GetServiceDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getServiceDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        selectedItemId = getServiceDetailsModel.workerList.id;
        updateServiceNameFieldController.text =
            getServiceDetailsModel.workerList.name;
        updateServiceShortDesFieldController.text =
            getServiceDetailsModel.workerList.shortDescription;
        updateServiceLongDesFieldController.text =
            getServiceDetailsModel.workerList.longDescription;
        updateServicePriceFieldController.text =
            getServiceDetailsModel.workerList.price.toString();
        updateTimeDuration = getServiceDetailsModel.workerList.timeDuration.obs;
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getAdditionalDetailsByIdFunction Else Else");
      }
    } catch (e) {
      log("getAdditionalDetailsByIdFunction Error ::: $e");
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
