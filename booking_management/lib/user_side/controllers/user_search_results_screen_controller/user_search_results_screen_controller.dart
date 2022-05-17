import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_url.dart';
import '../../model/user_search_results_screen_model/get_all_search_vendor_model.dart';

class UserSearchResultsScreenController extends GetxController {
  String searchText = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  TextEditingController categoryFieldController = TextEditingController();
  List<SearchVendorDatum> searchVendorList = [];

  String ? distance;
  String ? date;
  String ? ratting;

  /// Search Vendor List
  getAllSearchVendorListFunction({required String searchText}) async {
    isLoading(true);
    String url = ApiUrl.searchVendorApi + "?category=$searchText";
    log("Search Vendor List API URL : $url");

    try {
    http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
    // log("Search Vendor List ${response.body}");

    GetAllSearchVendorModel getAllSearchVendorModel = GetAllSearchVendorModel.fromJson(json.decode(response.body));
    isSuccessStatus = getAllSearchVendorModel.success.obs;

    if(isSuccessStatus.value) {
      searchVendorList.clear();

      searchVendorList = getAllSearchVendorModel.data;
      log("searchVendorList : ${searchVendorList.length}");

    } else {
    Fluttertoast.showToast(msg: "Something went wrong!");
    log("getAllSearchVendorListFunction Else Else");
    }

    } catch(e) {
    log("getAllSearchVendorListFunction Error ::: $e");
    } finally {
    isLoading(false);
    }

  }

  /// Search Vendor Rating Wise
  getAllSearchVendorListRatingWiseFunction({required String searchText}) async {
    isLoading(true);
    String url = ApiUrl.searchVendorApi + "?category=$searchText&rating=$ratting";
    log("Search Vendor List API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);

      GetAllSearchVendorModel getAllSearchVendorModel = GetAllSearchVendorModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllSearchVendorModel.success.obs;

      if(isSuccessStatus.value) {
        searchVendorList.clear();

        searchVendorList = getAllSearchVendorModel.data;
        log("searchVendorList : ${searchVendorList.length}");

      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getAllSearchVendorListFunction Else Else");
      }

    } catch(e) {
      log("getAllSearchVendorListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  /// Search Filter
  searchFilterListFunction() async {
    isLoading(true);
    String url = ApiUrl.searchFilterApi + "?rating=$ratting";
    log("Search Filter API URL : $url");

    try {
      http.Response response = await http.get(
          Uri.parse(url), headers: apiHeader.headers);
      log("Search Filter API URL : ${response.body}");
    } catch (e) {
      log("searchFilterListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    categoryFieldController.text = searchText;
    getAllSearchVendorListFunction(searchText: categoryFieldController.text);
    super.onInit();
  }
}