import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_url.dart';
import '../../../common_modules/constants/enums.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/user_search_results_screen_model/get_all_search_vendor_model.dart';

class UserSearchResultsScreenController extends GetxController {
  /// Getting From Home Screen
  String searchText = Get.arguments[0];
  String locationText = Get.arguments[1];
  SearchType searchType = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxString selectedDate = "".obs;
  RxString selectedTime = "".obs;
  RxBool isServiceCalenderShow = false.obs;
  DateTime selectedDay = DateTime.now();

  ApiHeader apiHeader = ApiHeader();
  TextEditingController categoryFieldController = TextEditingController();
  List<SearchVendorDatum> searchVendorList = [];

  String distance = "Distance";
  String date = "Date";
  String ratting = "Ratting";

  String latitude = "";
  String longitude = "";

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
    date = "${selectedDay.day}-${selectedDay.month}-${selectedDay.year}";
    //date = "${selectedDay.day}-";
    log('date: $date');

    String url = "";
    if(distance != "Distance" && ratting != "Ratting" && date != "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating=$ratting&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date=$date";
    } else if(distance != "Distance" && ratting == "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date";
    } else if(distance == "Distance" && ratting != "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating=$ratting&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date";
    } else if(distance == "Distance" && ratting == "Ratting" && date != "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date=$date";
    }

    else if(distance == "Distance" && ratting != "Ratting" && date != "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating=$ratting&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date=$date";
    } else if(distance != "Distance" && ratting == "Ratting" &&date != "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date=$date";
    } else if(distance != "Distance" && ratting != "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating=$ratting&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date";
    }
    else if(distance == "Distance" && ratting == "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date";
    }
    else if(distance != "Distance" && ratting == "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date";
    } else if(distance == "Distance" && ratting != "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating=$ratting&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date";
    } else if(distance == "Distance" && ratting == "Ratting" && date != "Date") {
      url = ApiUrl.searchVendorApi + "?category=$searchText&rating&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date=$date";
    }

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
        log("getAllSearchVendorListRatingWiseFunction Else Else");
      }

    } catch(e) {
      log("getAllSearchVendorListRatingWiseFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }




  /// Category Search
  getSearchCategoryWiseFunction({required String catId}) async {
    isLoading(true);
    String url = ApiUrl.searchVendorApi + "?categoryid=$catId";
    log("Search Category Wise API URL : $url");

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
        log("getSearchCategoryWiseFunction Else Else");
      }

    } catch(e) {
      log("getSearchCategoryWiseFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  /// Category With Rating Search
  getSearchCategoryWithRatingWiseFunction() async {
    isLoading(true);
    String url = "";
    date = "${selectedDay.day}-${selectedDay.month}-${selectedDay.year}";
    /*if(distance != "Distance" && ratting != "Ratting") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating=$ratting&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText";
    } else if(distance != "Distance" && ratting == "Ratting") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText";
    } else if(distance == "Distance" && ratting != "Ratting") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating=$ratting&CurrentLatitude&CurrentLongitude&Distance&location=$locationText";
    } else if(distance == "Distance" && ratting == "Ratting") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating&CurrentLatitude&CurrentLongitude&Distance&location=$locationText";
    }*/

    if(distance != "Distance" && ratting != "Ratting" && date != "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating=$ratting&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date=$date";
    } else if(distance != "Distance" && ratting == "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date";
    } else if(distance == "Distance" && ratting != "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating=$ratting&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date";
    } else if(distance == "Distance" && ratting == "Ratting" && date != "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date=$date";
    }

    else if(distance == "Distance" && ratting != "Ratting" && date != "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating=$ratting&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date=$date";
    } else if(distance != "Distance" && ratting == "Ratting" &&date != "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date=$date";
    } else if(distance != "Distance" && ratting != "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating=$ratting&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date";
    }
    else if(distance == "Distance" && ratting == "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date";
    }
    else if(distance != "Distance" && ratting == "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating&CurrentLatitude=$latitude&CurrentLongitude=$longitude&Distance=$distance&location=$locationText&date";
    } else if(distance == "Distance" && ratting != "Ratting" && date == "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating=$ratting&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date";
    } else if(distance == "Distance" && ratting == "Ratting" && date != "Date") {
      url = ApiUrl.searchVendorApi + "?categoryid=$searchText&rating&CurrentLatitude&CurrentLongitude&Distance&location=$locationText&date=$date";
    }

    log("Search Category And Rating Wise API URL : $url");
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
        log("getSearchCategoryWithRatingWiseFunction Else Else");
      }

    } catch(e) {
      log("getSearchCategoryWithRatingWiseFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  @override
  void onInit() {
    categoryFieldController.text = searchText;
    latitude = UserDetails.latitude;
    longitude = UserDetails.longitude;

    if(searchType == SearchType.categoryWise) {
      getSearchCategoryWiseFunction(catId: searchText);
    } else if(searchType == SearchType.none){
      getAllSearchVendorListFunction(searchText: categoryFieldController.text);
    }

    super.onInit();
  }
}