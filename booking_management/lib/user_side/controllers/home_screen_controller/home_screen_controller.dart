import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/home_screen_models/get_all_category_model.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  final TextEditingController categoryFieldController = TextEditingController();
  final TextEditingController locationFieldController = TextEditingController();

  List<CategoryDatum> allCategoryList = [];


  getAllCategoriesFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllCategoryApi;
    log("Category API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Category Response : ${response.body}");

      GetAllCategoryModel getAllCategoryModel = GetAllCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllCategoryModel.success.obs;

      if(isSuccessStatus.value) {
        allCategoryList.clear();
        allCategoryList = getAllCategoryModel.data;
        log("allCategoryList : ${allCategoryList.length}");
      } else {
        log("getAllCategoriesFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("getAllCategoriesFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllCategoriesFunction();
    super.onInit();
  }

}