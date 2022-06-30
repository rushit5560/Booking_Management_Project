import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/model/home_screen_models/get_all_appointment_list_model.dart';
import 'package:booking_management/user_side/model/home_screen_models/search_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../model/home_screen_models/get_all_category_model.dart';
import '../../model/home_screen_models/get_appointment_details_model.dart';
import '../../model/home_screen_models/get_favourite_vendor_model.dart';



class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  // ApiHeader apiHeader = ApiHeader();

  final TextEditingController categoryFieldController = TextEditingController();
  final TextEditingController locationFieldController = TextEditingController();

  List<CategoryDatum> allCategoryList = [];
  List<UpcomingAppointmentDatum> allUpcomingAppointmentList = [];
  List<FavouriteVendorDetails> favouriteVendorList = [];

  AppointDetailsData? appointDetailsData;

  RxBool isServiceCalenderShow = false.obs;
  RxString selectedDate = "".obs;
  RxString selectedTime = "".obs;

  late GooglePlace googlePlace;
  List<AutocompletePrediction> predictions = [];
  Timer? debounce;


  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  /// Get All Category
  getAllCategoriesFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllCategoryApi;
    log("Category API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      // log("Category Response : ${response.body}");

      GetAllCategoryModel getAllCategoryModel = GetAllCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllCategoryModel.success.obs;

      if(isSuccessStatus.value) {
        allCategoryList.clear();
        allCategoryList = getAllCategoryModel.data;
        // log("allCategoryList : ${allCategoryList.length}");
      } else {
        log("getAllCategoriesFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("getAllCategoriesFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getAllUpcomingAppointmentFunction();
    }
  }


  Future<List<String>> getCategorySearchFunction(String searchText) async {
    String url = ApiUrl.searchApi + "?prefix=$searchText";
    log("Search Category Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Get Category Api Response : ${response.body}");

      SearchModel searchModel = SearchModel.fromJson(json.decode(response.body));

      List<String> searchList = searchModel.data;
      log("searchList : $searchList");


      return searchText.isEmpty
          ? searchList
          : searchList.where((element) {
              String searchListString = element.toLowerCase();
              String searchTextNew = searchText.toLowerCase();

              return searchListString.contains(searchTextNew);
            }).toList();
    } catch(e) {
      log("getCategorySearchFunction Error :::$e");
      return [];
    }

  }

  Future<List<String>> getLocationSearchFunction(String searchText) async {
    String url = ApiUrl.locationSearchApi + "?prefix=$searchText";
    log("Search Location Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Get Location Api Response : ${response.body}");

      SearchModel searchModel = SearchModel.fromJson(json.decode(response.body));

      List<String> locationSearchList = searchModel.data;
      log("searchList : $locationSearchList");


      return searchText.isEmpty
          ? locationSearchList
          : locationSearchList.where((element) {
        String searchListString = element.toLowerCase();
        String searchTextNew = searchText.toLowerCase();

        return searchListString.contains(searchTextNew);
      }).toList();
    } catch(e) {
      log("getLocationSearchFunction Error :::$e");
      return [];
    }

  }

  /// Get All Upcoming Appointment
  getAllUpcomingAppointmentFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllUpcomingAppointment + "?cutomerid=${UserDetails.uniqueId}";
    log("Upcoming Appointment API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);

      GetAllAppointmentListModel getAllAppointmentListModel = GetAllAppointmentListModel.fromJson(json.decode(response.body));

      isSuccessStatus = getAllAppointmentListModel.success.obs;

      if(isSuccessStatus.value) {
        allUpcomingAppointmentList.clear();

        allUpcomingAppointmentList = getAllAppointmentListModel.data;
        log("allUpcomingAppointmentList : $allUpcomingAppointmentList");
      } else {
        log("getAllUpcomingAppointment Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getAllUpcomingAppointment Error ::: $e");
    } finally {
      isLoading(false);
    }

  }


  ///getUpcomingAppointDateWise
  getAllUpcomingAppointmentDateWiseFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllUpcomingAppointment + "?cutomerid=${UserDetails.uniqueId}" + "&dDate=${selectedDate.value}";
    log("Upcoming Appointment API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);

      GetAllAppointmentListModel getAllAppointmentListModel = GetAllAppointmentListModel.fromJson(json.decode(response.body));

      isSuccessStatus = getAllAppointmentListModel.success.obs;

      if(isSuccessStatus.value) {
        allUpcomingAppointmentList.clear();

        allUpcomingAppointmentList = getAllAppointmentListModel.data;
        log("allUpcomingAppointmentList Date Wise : ${allUpcomingAppointmentList.length}");
      } else {
        log("getAllUpcomingAppointment Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getAllUpcomingAppointment Error ::: $e");
    } finally {
      isLoading(false);
    }

  }

  /// Search Vendor
  // searchVendorFunction() async {
  //   isLoading(true);
  //   String url = ApiUrl.searchVendorApi;
  //   log("Search Vendor API URL : $url");
  //
  //   try {
  //     http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers, body: data);
  //     log("searchVendorFunction Response : ${response.body}");
  //
  //     SearchVendorModel searchVendorModel = SearchVendorModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = searchVendorModel.success.obs;
  //
  //     if(isSuccessStatus.value) {
  //
  //     } else {
  //       Fluttertoast.showToast(msg: "Something went wrong!");
  //       log("searchVendorFunction Else Else");
  //     }
  //
  //
  //   } catch(e) {
  //     log("searchVendorFunction Error ::: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  //
  // }


  /// Get Upcoming Appointment Details
  getUpcomingAppointmentDetailsFunction({required int id}) async {
    isLoading(true);
    String url = ApiUrl.upcomingAppointmentDetailsApi + "?id=$id";
    log("Appointment Details API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), /*headers: apiHeader.headers*/);
      log("Appointment Details Response : ${response.body}");

      GetAppointmentDetailsModel getAppointmentDetailsModel = GetAppointmentDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAppointmentDetailsModel.success.obs;

      if(isSuccessStatus.value) {
        appointDetailsData = getAppointmentDetailsModel.data;
        log("appointmentDetails : $appointDetailsData");

      } else {
        log("getUpcomingAppointmentDetailsFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }


    } catch(e) {
      log("getUpcomingAppointmentDetailsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }

  }



  @override
  void onInit() {
    getAllCategoriesFunction();
    googlePlace = GooglePlace(ApiUrl.googleApiKey);
    super.onInit();
  }

  void autoCompleteLocationSearch(String value) async {

    var result = await googlePlace.autocomplete.get(value);

    if(result != null && result.predictions != null) {
      log(result.predictions!.first.description!);
      predictions = result.predictions!;
      isLoading(true);
      isLoading(false);
    }

  }

}