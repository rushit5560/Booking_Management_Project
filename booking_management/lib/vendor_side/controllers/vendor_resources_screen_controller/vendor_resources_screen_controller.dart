import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_header.dart';
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/vendor_get_all_resources_list_model/delete_vendor_resource_model.dart';
import '../../model/vendor_get_all_resources_list_model/vendor_get_all_resources_model.dart';

class VendorResourcesScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<WorkerList1> getResourceList = [];

  ApiHeader apiHeader = ApiHeader();

  /// Get New Resource
  getAllResourceAPI() async {
    isLoading(true);

    String url = ApiUrl.vendorGetAllResourcesApi +
        "?VendorId=${UserDetails.tableWiseId}";
    log('getAllResourceAPI Url : $url');

    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: ApiHeader().headers);
      log('getAllResource headers: ${ApiHeader().headers}');
      log('Response : ${response.body}');

      GetAllResorcesListModel getAllResorcesListModelModel =
          GetAllResorcesListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllResorcesListModelModel.success.obs;

      log("status: $isSuccessStatus");

      if (isSuccessStatus.value) {
        getResourceList = getAllResorcesListModelModel.workerList;
        log('getResourceList: $getResourceList');
      } else {
        log('getAllResource False False');
        Get.snackbar("${getAllResorcesListModelModel.success}", '');
      }
    } catch (e) {
      log('getAllResource Error : $e');
    } finally {
      isLoading(false);
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
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

      http.Response response =
          await http.post(Uri.parse(url), headers: apiHeader.headers);
      log("response : ${response.body}");

      DeleteVendorResourceModel deleteVendorResourceModel =
          DeleteVendorResourceModel.fromJson(json.decode(response.body));
      isSuccessStatus = deleteVendorResourceModel.success.obs;
      log("Code : ${deleteVendorResourceModel.statusCode}");

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: deleteVendorResourceModel.message);
        await getAllResourceAPI();
      } else {
        Fluttertoast.showToast(msg: "Something wnt wrong!");
      }
    } catch (e) {
      log("deleteVendorResourcesFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllResourceAPI();
    super.onInit();
  }
}
