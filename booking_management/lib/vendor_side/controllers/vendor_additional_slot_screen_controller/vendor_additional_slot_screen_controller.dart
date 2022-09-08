import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/vendor_side/model/vendor_additional_slot_screen_model/get_all_additional_slot_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/api_header.dart';
import '../../model/vendor_additional_slot_screen_model/add_additional_slot_model.dart';
import '../../model/vendor_additional_slot_screen_model/delete_additional_slot_model.dart';
import '../../model/vendor_additional_slot_screen_model/get_additional_slot_details_model.dart';
import '../../model/vendor_additional_slot_screen_model/update_additional_slot_model.dart';

class VendorAdditionalSlotScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  List<AdditionalSlotWorkerList> allAdditionalSlotList = [];
  List<double> timeDurationList = [
    0.5,
    1,
    1.5,
    2,
    2.5,
    3,
    3.5,
    4,
  ];

  /// Add Additional Form Field
  GlobalKey<FormState> additionalSlotAddFormKey = GlobalKey();
  TextEditingController additionalNameFieldController = TextEditingController();
  TextEditingController additionalPriceFieldController =
      TextEditingController();
  TextEditingController additionalShortDescriptionFieldController =
      TextEditingController();
  TextEditingController additionalLongDescriptionFieldController =
      TextEditingController();
  RxDouble selectAdditionalTimeDuration = 0.5.obs;
  RxInt timeDurationIs = 30.obs;

  /// Update Additional Form Field
  GlobalKey<FormState> additionalSlotUpdateFormKey = GlobalKey();
  TextEditingController updateAdditionalNameFieldController =
      TextEditingController();
  TextEditingController updateAdditionalPriceFieldController =
      TextEditingController();
  TextEditingController updateAdditionalShortDescriptionFieldController =
      TextEditingController();
  TextEditingController updateAdditionalLongDescriptionFieldController =
      TextEditingController();
  RxDouble updateAdditionalTimeDuration = 0.5.obs;
  int selectedUpdateItemId = 0;

  /// Get All Additional Slot
  getVendorAllAdditionalSlotFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllAdditionalSlotApi +
        "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Additional Slot API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('getVendorAllAdditionalSlot Response : ${response.body}');

      GetAllAdditionalSlotModel getAllAdditionalSlotModel =
          GetAllAdditionalSlotModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAdditionalSlotModel.success.obs;
      log("getVendorAllAdditionalSlot Status Code : ${getAllAdditionalSlotModel.statusCode}");

      if (isSuccessStatus.value) {
        // allAdditionalSlotList.clear();
        allAdditionalSlotList = [];
        allAdditionalSlotList = getAllAdditionalSlotModel.workerList;
        for (int i = 0; i < allAdditionalSlotList.length; i++) {
          log("Additional Slot number ${i} : ${allAdditionalSlotList[i].name.toString()}");
        }
      } else {
        log("getVendorAllAdditionalSlot Something went wrong!");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getAllAdditionalSlotFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add Additional Slot
  addVendorAdditionalSlotFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddAdditionalSlotApi;
    log("Add Additional Slot API URL : $url");

    try {
      int timeDuration = 0;
      if (selectAdditionalTimeDuration.value == 0.5) {
        timeDuration = 30;
      } else if (selectAdditionalTimeDuration.value == 1) {
        timeDuration = 60;
      } else if (selectAdditionalTimeDuration.value == 1.5) {
        timeDuration = 90;
      } else if (selectAdditionalTimeDuration.value == 2) {
        timeDuration = 120;
      } else if (selectAdditionalTimeDuration.value == 2.5) {
        timeDuration = 150;
      } else if (selectAdditionalTimeDuration.value == 3) {
        timeDuration = 180;
      } else if (selectAdditionalTimeDuration.value == 3.5) {
        timeDuration = 210;
      } else if (selectAdditionalTimeDuration.value == 4) {
        timeDuration = 240;
      }

      log("time durtation is : $timeDuration");
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      // request.fields['Name'] = additionalNameFieldController.text.trim();
      request.fields['ShortDescription'] =
          additionalShortDescriptionFieldController.text.trim();
      request.fields['Price'] = additionalPriceFieldController.text.trim();
      request.fields['LongDescription'] =
          additionalLongDescriptionFieldController.text.trim();
      request.fields['TimeDuration'] = "$timeDuration";
      request.fields['CreatedBy'] = UserDetails.uniqueId;
      request.fields['VendorId'] = "${UserDetails.tableWiseId}";

      log("Add Additional Slot Fields : ${request.fields}");
      log("Add Additional Slot headers : ${apiHeader.headers}");

      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log("Add Additional Slot res body $value");
        AddAdditionalSlotModel addAdditionalSlotModel =
            AddAdditionalSlotModel.fromJson(json.decode(value));
        isSuccessStatus = addAdditionalSlotModel.success.obs;
        log("Add Additional Slot stCode : ${addAdditionalSlotModel.statusCode}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: "Additional slot added successfully");
          _removeFieldData();
          await getVendorAllAdditionalSlotFunction();
          Get.back();
        } else {
          log("addVendorResourcesFunction Else Else ${addAdditionalSlotModel.message}");
          Fluttertoast.showToast(msg: "Something wnt wrong!");
        }
      });
    } catch (e) {
      log("addAdditionalSlotFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Delete Additional Slot
  deleteVendorAdditionalSlotFunction({required String resourceId}) async {
    isLoading(true);
    String url = ApiUrl.vendorDeleteAdditionalSlotApi + "?id=$resourceId";
    log("Delete Additional Slot API URL : $url");

    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: apiHeader.headers);
      log("response : ${response.body}");

      DeleteAdditionalSlotModel deleteAdditionalSlotModel =
          DeleteAdditionalSlotModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteAdditionalSlotModel.success.obs;
      log("Delete Additional Slot Code : ${deleteAdditionalSlotModel.statusCode}");

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: deleteAdditionalSlotModel.message);
        await getVendorAllAdditionalSlotFunction();
      } else {
        Fluttertoast.showToast(msg: "Something wnt wrong!");
      }
    } catch (e) {
      log("deleteAdditionalSlotFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Update Additional Slot
  updateVendorAdditionalSlotFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorUpdateAdditionalSlotApi;
    log("Update Resources API URL : $url");

    try {
      int timeDuration = 0;
      if (updateAdditionalTimeDuration.value == 0.5) {
        timeDuration = 30;
      } else if (updateAdditionalTimeDuration.value == 1) {
        timeDuration = 60;
      } else if (updateAdditionalTimeDuration.value == 1.5) {
        timeDuration = 90;
      } else if (updateAdditionalTimeDuration.value == 2) {
        timeDuration = 120;
      } else if (updateAdditionalTimeDuration.value == 2.5) {
        timeDuration = 150;
      } else if (updateAdditionalTimeDuration.value == 3) {
        timeDuration = 180;
      } else if (updateAdditionalTimeDuration.value == 3.5) {
        timeDuration = 210;
      } else if (updateAdditionalTimeDuration.value == 4) {
        timeDuration = 240;
      }

      log("update time duration : $timeDuration");
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['Name'] = updateAdditionalNameFieldController.text.trim();
      request.fields['ShortDescription'] =
          updateAdditionalShortDescriptionFieldController.text.trim();
      request.fields['Price'] =
          updateAdditionalPriceFieldController.text.trim();
      request.fields['LongDescription'] =
          updateAdditionalLongDescriptionFieldController.text.trim();
      request.fields['TimeDuration'] = "$timeDuration";
      request.fields['ModifiedBy'] = UserDetails.uniqueId;
      request.fields['VendorId'] = "${UserDetails.tableWiseId}";
      request.fields['Id'] = "$selectedUpdateItemId";

      log("Fields : ${request.fields}");
      log("headers : ${apiHeader.headers}");

      var response = await request.send();

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        UpdateAdditionalSlotModel updateAdditionalSlotModel =
            UpdateAdditionalSlotModel.fromJson(json.decode(value));
        isSuccessStatus = updateAdditionalSlotModel.success.obs;
        log("Code : ${updateAdditionalSlotModel.statusCode}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: "Additional slot updated successfully");
          // removeFieldData();
          await getVendorAllAdditionalSlotFunction();
          Get.back();
        } else {
          log("addVendorResourcesFunction Else Else ${updateAdditionalSlotModel.message}");
          Fluttertoast.showToast(msg: "Something wnt wrong!");
        }
      });
    } catch (e) {
      log("");
    } finally {
      isLoading(false);
    }
  }

  /// Get Additional Slot Details By Id
  getAdditionalDetailsByIdFunction({required int id}) async {
    isLoading(true);
    String url = ApiUrl.vendorGetAdditionalDetailsByIdApi + "?id=$id";
    log("Get Details By ID API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response : ${response.body}');

      GetAdditionalSlotDetailsModel getAdditionalSlotDetailsModel =
          GetAdditionalSlotDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAdditionalSlotDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        selectedUpdateItemId = getAdditionalSlotDetailsModel.workerList.id;
        updateAdditionalNameFieldController.text =
            getAdditionalSlotDetailsModel.workerList.name;
        updateAdditionalShortDescriptionFieldController.text =
            getAdditionalSlotDetailsModel.workerList.shortDescription;
        updateAdditionalLongDescriptionFieldController.text =
            getAdditionalSlotDetailsModel.workerList.longDescription;
        updateAdditionalPriceFieldController.text =
            getAdditionalSlotDetailsModel.workerList.price.toString();
        // updateAdditionalTimeDuration.value = double.parse(getAdditionalSlotDetailsModel.workerList.timeDuration.toString());

        if (getAdditionalSlotDetailsModel.workerList.timeDuration > 0 &&
            getAdditionalSlotDetailsModel.workerList.timeDuration <= 30) {
          updateAdditionalTimeDuration.value = 0.5;
        } else if (getAdditionalSlotDetailsModel.workerList.timeDuration > 30 &&
            getAdditionalSlotDetailsModel.workerList.timeDuration <= 60) {
          updateAdditionalTimeDuration.value = 1;
        } else if (getAdditionalSlotDetailsModel.workerList.timeDuration > 60 &&
            getAdditionalSlotDetailsModel.workerList.timeDuration <= 90) {
          updateAdditionalTimeDuration.value = 1.5;
        } else if (getAdditionalSlotDetailsModel.workerList.timeDuration > 90 &&
            getAdditionalSlotDetailsModel.workerList.timeDuration <= 120) {
          updateAdditionalTimeDuration.value = 2;
        } else if (getAdditionalSlotDetailsModel.workerList.timeDuration >
                120 &&
            getAdditionalSlotDetailsModel.workerList.timeDuration <= 150) {
          updateAdditionalTimeDuration.value = 2.5;
        } else if (getAdditionalSlotDetailsModel.workerList.timeDuration >
                150 &&
            getAdditionalSlotDetailsModel.workerList.timeDuration <= 180) {
          updateAdditionalTimeDuration.value = 3;
        } else if (getAdditionalSlotDetailsModel.workerList.timeDuration >
                180 &&
            getAdditionalSlotDetailsModel.workerList.timeDuration <= 210) {
          updateAdditionalTimeDuration.value = 3.5;
        } else if (getAdditionalSlotDetailsModel.workerList.timeDuration >
                210 &&
            getAdditionalSlotDetailsModel.workerList.timeDuration <= 240) {
          updateAdditionalTimeDuration.value = 4;
        }
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

  @override
  void onInit() {
    getVendorAllAdditionalSlotFunction();
    super.onInit();
  }

  void _removeFieldData() {
    additionalNameFieldController.clear();
    additionalPriceFieldController.clear();
    additionalShortDescriptionFieldController.clear();
    additionalLongDescriptionFieldController.clear();
    selectAdditionalTimeDuration = 0.5.obs;
  }
}
