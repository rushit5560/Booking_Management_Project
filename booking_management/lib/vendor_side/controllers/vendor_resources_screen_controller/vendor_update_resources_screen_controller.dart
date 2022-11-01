import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:booking_management/vendor_side/controllers/vendor_resources_screen_controller/vendor_resources_screen_controller.dart';
import 'package:booking_management/vendor_side/model/vendor_get_all_resources_list_model/criteria_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_header.dart';
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/vendor_get_all_resources_list_model/get_vendor_service_details_model.dart';
import '../../model/vendor_get_all_resources_list_model/update_vendor_resource_model.dart';
import '../../screens/vendor_resources_screen/vendor_update_resources_screen/vendor_update_resources_screen_widgets.dart';

class VendorUpdateResourcesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final int resourceId = Get.arguments;

  List<CriteriaData> criteriaGetList = [];
  List<int> criteriaGetIndexList = [];

  /// Update Resource Form TextField
  GlobalKey<FormState> resourceUpdateFormKey = GlobalKey();
  TextEditingController updateResourceNameFieldController =
      TextEditingController();
  TextEditingController updateResourceDetailsFieldController =
      TextEditingController();
  TextEditingController updateResourcePriceFieldController =
      TextEditingController();
  TextEditingController updateResourceCapacityFieldController =
      TextEditingController();

  /// update resource  values
  RxBool updateEvent = false.obs;
  RxBool updateRequireCriteria = false.obs;

  List<Widget> criteriaUpdateList = [];

  List<String> criteriaIdNumberUpdateList = [];
  List<TextEditingController> criteriaNameUpdateControllerList = [];
  List<TextEditingController> criteriaOptionUpdateControllerList = [];

  List<Map<String, dynamic>> criteriaObjectUpdateList = [];

  // TextEditingController criteriaNameFieldUpdateController =
  //     TextEditingController();
  // TextEditingController criteriaOptionFieldUpdateController =
  //     TextEditingController();

  File? updateFile;

  String updatePhotoUrl = "";

  ApiHeader apiHeader = ApiHeader();
  int selectedItemId = 0;

  List<CriteriaModel> apiResourceCriteriaList = [];
  List<NewCriteriaModel> localResourceCriteriaList = [];

  @override
  void onInit() {
    super.onInit();

    getResourcesDetailsByIdFunction(
      id: resourceId,
    );

    // criteriaNameUpdateControllerList.add(criteriaNameFieldUpdateController);
    // criteriaOptionUpdateControllerList.add(criteriaOptionFieldUpdateController);

    // criteriaUpdateList = [
    //   CriteriaFormWidget(
    //     index: 0,
    //     criteriaNameFieldController: criteriaNameUpdateControllerList[0],
    //     optionFieldController: criteriaOptionUpdateControllerList[0],
    //   ),
    // ];

    // getAllResourceAPI();
  }

  @override
  void dispose() {
    super.dispose();
    updateFile!.delete();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  // /// Get New Resource
  // getAllResourceAPI() async {
  //   isLoading(true);

  //   String url = ApiUrl.vendorGetAllResourcesApi +
  //       "?VendorId=${UserDetails.tableWiseId}";
  //   log('getAllResourceAPI Url : $url');

  //   try {
  //     http.Response response =
  //         await http.post(Uri.parse(url), headers: ApiHeader().headers);
  //     log('getAllResource headers: ${ApiHeader().headers}');
  //     log('Response : ${response.body}');

  //     GetAllResorcesListModel getAllResorcesListModelModel =
  //         GetAllResorcesListModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = getAllResorcesListModelModel.success.obs;

  //     log("status: $isSuccessStatus");

  //     if (isSuccessStatus.value) {
  //       getResourceList = getAllResorcesListModelModel.workerList;
  //       log('getResourceList: $getResourceList');
  //     } else {
  //       log('getAllResource False False');
  //       Get.snackbar("${getAllResorcesListModelModel.success}", '');
  //     }
  //   } catch (e) {
  //     log('getAllResource Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  /// Update Resource
  updateVendorResourceFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorAddAndUpdateResourcesApi;
    log("Update Resources API URL : $url");

    final vendorResScreenController =
        Get.find<VendorResourcesScreenController>();

    try {
      if (updateFile != null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers.addAll(apiHeader.headers);

        // Image file add
        request.files
            .add(await http.MultipartFile.fromPath("Image", updateFile!.path));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        // var length = await file!.length();
        // var multiPart = http.MultipartFile('Image', stream, length);
        // request.files.add(multiPart);

        request.fields['ResourceName'] = updateResourceNameFieldController.text.trim();
        request.fields['Details'] = updateResourceDetailsFieldController.text.trim();
        request.fields['Price'] = updateResourcePriceFieldController.text.trim();
        request.fields['id'] = "$selectedItemId";
        request.fields['CreatedBy'] = UserDetails.uniqueId;
        request.fields['Capacity'] = updateResourceCapacityFieldController.text.isEmpty
                ? "0"
                : updateResourceCapacityFieldController.text.trim();
        request.fields['isEvent'] = "${updateEvent.value}";
        request.fields['RequireCriteria'] = "${updateRequireCriteria.value}";
        request.fields['id'] = "$resourceId";

        if (updateRequireCriteria.value == true) {
          request.fields['Criterias'] = json.encode(criteriaObjectUpdateList);
        } else {
          log("require criterias is not true.");
        }

        log("Fields123 : ${request.fields}");
        log("image Files len: ${request.files.length}");
        log("image Filename: ${request.files.first.filename}");
        log("headers : ${apiHeader.headers}");

        var response = await request.send();

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((value) {
          log('value: $value');
          UpdateVendorResourceModel updateVendorResourceModel =
              UpdateVendorResourceModel.fromJson(json.decode(value));
          isSuccessStatus = updateVendorResourceModel.success.obs;
          log("Code : ${updateVendorResourceModel.statusCode}");

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateVendorResourceModel.message);
            // removeFieldData();
            vendorResScreenController.getAllResourceAPI();
            Get.back();
          } else {
            log("updateVendorResourcesFunction if file ${updateVendorResourceModel.message}");
            Fluttertoast.showToast(msg: "Something want wrong!");
          }
        });
      } else if (updateFile == null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));
        request.headers.addAll(apiHeader.headers);

        request.fields['ResourceName'] =
            updateResourceNameFieldController.text.trim();
        request.fields['Details'] =
            updateResourceDetailsFieldController.text.trim();
        request.fields['Price'] =
            updateResourcePriceFieldController.text.trim();
        request.fields['id'] = "$selectedItemId";
        request.fields['CreatedBy'] = UserDetails.uniqueId;
        request.fields['Capacity'] =
            updateResourceCapacityFieldController.text.isEmpty
                ? "0"
                : updateResourceCapacityFieldController.text.trim();
        request.fields['isEvent'] = "${updateEvent.value}";
        request.fields['RequireCriteria'] = "${updateRequireCriteria.value}";
        request.fields['id'] = "$resourceId";

        if (updateRequireCriteria.value == true) {
          request.fields['Criterias'] = json.encode(criteriaObjectUpdateList);
        } else {
          log("require criterias is not true.");
        }

        log("image is : $updatePhotoUrl");

        log("Fields1234 : ${request.fields}");
        log("headers : ${apiHeader.headers}");

        var response = await request.send();

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((value) {
          UpdateVendorResourceModel updateVendorResourceModel =
              UpdateVendorResourceModel.fromJson(json.decode(value));
          isSuccessStatus = updateVendorResourceModel.success.obs;
          log("Code : ${updateVendorResourceModel.statusCode}");

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: updateVendorResourceModel.message);
            vendorResScreenController.getAllResourceAPI();
            Get.back();
          } else {
            log("updateVendorResourcesFunction Else ${updateVendorResourceModel.message}");
            Fluttertoast.showToast(msg: "Something want wrong!");
          }
        });
      }
    } catch (e) {
      log("updateVendorResource: $e");

      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// Get Resources Details By Id
  getResourcesDetailsByIdFunction({required int id}) async {
    isLoading(true);
    String url = ApiUrl.vendorGetResourceDetailsApi + "?id=$id";
    log("Get Service By ID API URL : $url");
    log("headers121 : ${apiHeader.headers}");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Response : ${response.body}');

      GetResourceDetailsModel getResourceDetailsModel =
          GetResourceDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getResourceDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        selectedItemId = getResourceDetailsModel.workerList.id;
        updateResourceNameFieldController.text =getResourceDetailsModel.workerList.resourceName;
        updateResourceDetailsFieldController.text = getResourceDetailsModel.workerList.details;
        updateResourcePriceFieldController.text = getResourceDetailsModel.workerList.price.toString();
        updateResourceCapacityFieldController.text = getResourceDetailsModel.workerList.capacity.toString();
        updateEvent.value = getResourceDetailsModel.workerList.isEvent;
        updateRequireCriteria.value = getResourceDetailsModel.workerList.requireCriteria;

        criteriaGetList = getResourceDetailsModel.workerList.criterias;

        if (criteriaGetList.isEmpty) {
          log("criteria list is empty");
        } else {
          for (int i = 0; i < criteriaGetList.length; i++) {
            criteriaGetIndexList.add(criteriaGetList[i].id);

            // Criteria Getting from server & add in local list
            /*apiResourceCriteriaList.add(
              CriteriaModel(
                index: "${criteriaGetList[i].id}",
                criteriaName: criteriaGetList[i].name,
                criteriaOption: criteriaGetList[i].options,
              ),
            );*/

            log("criteriaGetIndexList is  :: ${criteriaGetIndexList.toString()}");

            //   criteriaList.add(
            //     CriteriaFormWidget(
            //       index: criteriaGetList[i].id,
            //       criteriaNameFieldController: criteriaNameFieldController,
            //       optionFieldController: criteriaOptionFieldController,
            //     ),
            //   );
            //   criteriaIdNumberList[i] = criteriaGetList[0].name;

            //   criteriaNameControllerList[i].text = criteriaGetList[0].name;
            //   criteriaOptionControllerList[i].text = criteriaGetList[0].options;
            // }

            // int iNumber = criteriaGetList.length;

            // TextEditingController criteriaNameUpdateFieldController =
            //     TextEditingController();
            // TextEditingController criteriaOptionUpdateFieldController =
            //     TextEditingController();

            // criteriaNameUpdateFieldController.text = criteriaGetList[i].name;
            // criteriaOptionUpdateFieldController.text =
            //     criteriaGetList[i].options;

            criteriaNameUpdateControllerList.add(TextEditingController(text: criteriaGetList[i].name));
            criteriaOptionUpdateControllerList.add(TextEditingController(text: criteriaGetList[i].options));

            criteriaUpdateList.add(
              CriteriaFormUpdateWidget(
                index: i,
                id: criteriaGetList[i].id,
                criteriaNameFieldController:
                    criteriaNameUpdateControllerList[i],
                optionFieldController: criteriaOptionUpdateControllerList[i],
              ),
            );
          }
        }

        log('isEvent123 : ${getResourceDetailsModel.workerList.isEvent}');
        updatePhotoUrl =
            "${ApiUrl.apiImagePath}${getResourceDetailsModel.workerList.image}";
        log("updatePhotoUrl : $updatePhotoUrl");

        // updateServiceNameFieldController.text = getServiceDetailsModel.workerList.name;
        // updateServiceShortDesFieldController.text = getServiceDetailsModel.workerList.shortDescription;
        // updateServiceLongDesFieldController.text = getServiceDetailsModel.workerList.longDescription;
        // updateServicePriceFieldController.text = getServiceDetailsModel.workerList.price.toString();
        // updateTimeDuration = getServiceDetailsModel.workerList.timeDuration.obs;

      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getResourcesDetailsByIdFunction Else Else");
      }
    } catch (e) {
      log("getResourcesDetailsByIdFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  removeFieldData() {
    updateResourceNameFieldController.clear();
    updateResourceDetailsFieldController.clear();
    updateResourcePriceFieldController.clear();
    updateResourceCapacityFieldController.clear();
    // file!.deleteSync();
    updateFile!.delete();
    //updatePhotoUrl = "";
  }
}
