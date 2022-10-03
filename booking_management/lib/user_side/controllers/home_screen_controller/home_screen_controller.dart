import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/model/home_screen_models/get_all_appointment_list_model.dart';
import 'package:booking_management/user_side/model/home_screen_models/search_model.dart';
import 'package:booking_management/user_side/model/user_business_details_model/add_vendor_in_favourite_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../../common_modules/sharedpreference_data/sharedpreference_data.dart';
import '../../model/home_screen_models/get_all_category_model.dart';
import '../../model/home_screen_models/get_appointment_details_model.dart';
import '../../model/home_screen_models/get_favourite_vendor_model.dart';

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  final TextEditingController categoryFieldController = TextEditingController();
  final TextEditingController locationFieldController = TextEditingController();

  List<CategoryDatum> allCategoryList = [];
  List<UpcomingAppointmentDatum> allUpcomingAppointmentList = [];
  List<FavouriteVendorDetails> favouriteVendorList = [];

  AppointDetailsData? appointDetailsData;
  List<String> serviceList = [];

  RxBool isServiceCalenderShow = false.obs;
  RxString selectedDate = "".obs;
  RxString selectedDisplayDate = "".obs;
  RxString selectedTime = "".obs;

  String selectedFromListLatitude = "";
  String selectedFromListLongitude = "";

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
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Category Response : ${response.body}");

      GetAllCategoryModel getAllCategoryModel =
          GetAllCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllCategoryModel.success.obs;

      if (isSuccessStatus.value) {
        allCategoryList.clear();
        allCategoryList = getAllCategoryModel.data;
        log("allCategoryList : ${allCategoryList.length}");
      } else {
        log("getAllCategoriesFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getAllCategoriesFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getAllUpcomingAppointmentFunction();
    }
  }

  Future getCategorySearchFunction(String searchText) async {
    String url = ApiUrl.searchApi + "?prefix=$searchText";
    log("Search Category Api Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Get Category Api Response : ${response.body}");
      SearchModel searchModel =
          SearchModel.fromJson(json.decode(response.body));
      isSuccessStatus = searchModel.success.obs;

      if (isSuccessStatus.value) {
        List<String> searchList = searchModel.data;
        log("searchList : $searchList");
        return searchText.isEmpty
            ? searchList
            : searchList.where((element) {
                String searchListString = element.toLowerCase();
                String searchTextNew = searchText.toLowerCase();

                return searchListString.contains(searchTextNew);
              }).toList();
      } else {
        Fluttertoast.showToast(msg: searchModel.message);
      }
    } catch (e) {
      log("getCategorySearchFunction Error :::$e");
      return [];
    }
  }

  // Future<List<String>> getLocationSearchFunction(String searchText) async {
  //   String url = ApiUrl.locationSearchApi + "?prefix=$searchText";
  //   log("Search Location Api Url : $url");

  //   try {
  //     http.Response response = await http.get(Uri.parse(url));
  //     log("Get Location Api Response : ${response.body}");

  //     SearchModel searchModel =
  //         SearchModel.fromJson(json.decode(response.body));

  //     List<String> locationSearchList = searchModel.data;
  //     log("searchList : $locationSearchList");

  //     return searchText.isEmpty
  //         ? locationSearchList
  //         : locationSearchList.where((element) {
  //             String searchListString = element.toLowerCase();
  //             String searchTextNew = searchText.toLowerCase();

  //             return searchListString.contains(searchTextNew);
  //           }).toList();
  //   } catch (e) {
  //     log("getLocationSearchFunction Error :::$e");
  //     return [];
  //   }
  // }

  /// Get All Upcoming Appointment
  getAllUpcomingAppointmentFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllUpcomingAppointment +
        "?customerid=${UserDetails.uniqueId}";
    log("Upcoming Appointment API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log(" getAllUpcomingAppointment res body : ${response.body}");

      GetAllAppointmentListModel getAllAppointmentListModel =
          GetAllAppointmentListModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllAppointmentListModel.success.obs;
      if (isSuccessStatus.value) {
        allUpcomingAppointmentList.clear();

        allUpcomingAppointmentList = getAllAppointmentListModel.data;
        log(" getAllUpcomingAppointment list : $allUpcomingAppointmentList");
      } else {
        log(" getAllUpcomingAppointment Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log(" getAllUpcomingAppointment Error ::: $e");
    } finally {
      // isLoading(false);
      await getFavouriteVendorByIdFunction();
    }
  }

  ///getUpcomingAppointDateWise
  getAllUpcomingAppointmentDateWiseFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllUpcomingAppointment +
        "?cutomerid=${UserDetails.uniqueId}" +
        "&dDate=${selectedDate.value}";
    log("getAllUpcomingAppointmentDateWise API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);

      GetAllAppointmentListModel getAllAppointmentListModel =
          GetAllAppointmentListModel.fromJson(json.decode(response.body));

      isSuccessStatus = getAllAppointmentListModel.success.obs;

      if (isSuccessStatus.value) {
        allUpcomingAppointmentList.clear();

        allUpcomingAppointmentList = getAllAppointmentListModel.data;
        log("getAllUpcomingAppointmentDateWise : ${allUpcomingAppointmentList.length}");
      } else {
        log("getAllUpcomingAppointmentDateWise Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getAllUpcomingAppointmentDateWise  Error ::: $e");
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
  getUpcomingAppointmentDetailsFunction({required String id}) async {
    isLoading(true);
    String url = ApiUrl.upcomingAppointmentDetailsApi + "?id=$id";
    log("Appointment Details API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Appointment Details Response : ${response.body}");

      GetAppointmentDetailsModel getAppointmentDetailsModel =
          GetAppointmentDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAppointmentDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        appointDetailsData = getAppointmentDetailsModel.data;
        serviceList = getAppointmentDetailsModel.list;
        log("appointmentDetails : $appointDetailsData");
      } else {
        log("getUpcomingAppointmentDetailsFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getUpcomingAppointmentDetailsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Get Favourite Vendor List
  getFavouriteVendorByIdFunction() async {
    isLoading(true);
    String url =
        ApiUrl.favouriteVendorListApi + "?cutomerid=${UserDetails.tableWiseId}";
    log("Favourite vendor List API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log("Favourite Vendor Response : ${response.body}");

      GetFavouriteVendorModel getFavouriteVendorModel =
          GetFavouriteVendorModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFavouriteVendorModel.success.obs;

      log("Favourite vendor List API res body  : ${response.body}");
      if (isSuccessStatus.value) {
        favouriteVendorList.clear();
        favouriteVendorList = getFavouriteVendorModel.data;
        log("favouriteVendorList : ${favouriteVendorList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getFavouriteVendorByIdFunction Else Else");
      }
    } catch (e) {
      log("getFavouriteVendorByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Add Vendor in Favorite
  addVendorInFavoriteFunction(int vendorId) async {
    // isLoading(true);
    String url = ApiUrl.addFavouriteVendorApi;
    log("Add Vendor in Favourite API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(apiHeader.headers);

      request.fields['VendorId'] = "$vendorId";
      request.fields['CustomerId'] = "${UserDetails.tableWiseId}";

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        AddVendorInFavouriteModel addVendorInFavouriteModel =
            AddVendorInFavouriteModel.fromJson(json.decode(value));
        isSuccessStatus = addVendorInFavouriteModel.success.obs;
        log("Body : ${addVendorInFavouriteModel.statusCode}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: "Removed from favourite");
        } else {
          Fluttertoast.showToast(msg: "Something went wrong!");
        }
      });
    } catch (e) {
      log("addVendorInFavoriteFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      // isLoading(false);
      await getFavouriteVendorByIdFunction();
    }
  }

  Position? position;
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  void getCurrentLocation() async {
    Position position1 = await determinePosition();
    position = position1;

    selectedFromListLatitude = position1.latitude.toString();
    selectedFromListLongitude = position1.longitude.toString();
    sharedPreferenceData.setLatAndLongInPrefs(
      lat: "${position!.latitude}",
      long: "${position!.longitude}",
    );
    log("position123 : $position");
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permission are denied");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void onInit() {
    getAllCategoriesFunction();
    getCurrentLocation();
    googlePlace = GooglePlace(ApiUrl.googleApiKey);

    super.onInit();
  }

  void autoCompleteLocationSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);

    if (result != null && result.predictions != null) {
      log(result.predictions!.first.description!);
      predictions = result.predictions!;
      isLoading(true);
      isLoading(false);
    }
  }
}
