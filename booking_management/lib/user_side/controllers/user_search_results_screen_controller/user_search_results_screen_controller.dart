import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_url.dart';
import '../../model/home_screen_models/search_vendor_model.dart';

class UserSearchResultsScreenController extends GetxController {
  String searchText = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  TextEditingController categoryFieldController = TextEditingController();

  String ? distance;
  String ? date;
  String ? ratting;

  /// Search Vendor
//   searchVendorFunction() async {
//     isLoading(true);
//     String url = ApiUrl.searchVendorApi;
//     log("Search Vendor API URL : $url");
//
//     try {
//       http.Response response = await http.post(Uri.parse(url),
//           headers: apiHeader.headers, body: data);
//       log("searchVendorFunction Response : ${response.body}");
//
//       SearchVendorModel searchVendorModel = SearchVendorModel.fromJson(json.decode(response.body));
//       isSuccessStatus = searchVendorModel.success.obs;
//
//       if (isSuccessStatus.value) {
//         /// Set List todo
//       } else {
//         Fluttertoast.showToast(msg: "Something went wrong!");
//         log("searchVendorFunction Else Else");
//       }
//     } catch (e) {
//       log("searchVendorFunction Error ::: $e");
//     } finally {
//       isLoading(false);
//     }
//   }


  /// Search Filter
  searchFilterListFunction() async {
    isLoading(true);
    String url = ApiUrl.searchFilterApi + "?rating=$ratting";
    log("Search Filter API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Search Filter API URL : ${response.body}");



    } catch(e) {
      log("searchFilterListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }
 @override
  void onInit() {
   categoryFieldController.text = searchText;
   // searchVendorFunction();
    super.onInit();
  }
}