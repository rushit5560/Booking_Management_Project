import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/vendor_side/model/get_business_type_model/get_business_type_model.dart';
import 'package:booking_management/vendor_side/model/vendor_profile_screen_model/timeslot_duration_model.dart';
import 'package:booking_management/vendor_side/model/vendor_profile_screen_model/vendor_profile_details_model.dart';
import 'package:booking_management/vendor_side/model/vendor_update_profile_model/vendor_update_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/vendor_profile_screen_model/save_vendor_lat_long_model.dart';

class VendorProfileScreenController extends GetxController {
  RxString selectedDate = 'DOB'.obs;
  RxString slot = 'Single'.obs;
  GlobalKey<FormState> vendorProfileFormKey = GlobalKey<FormState>();
  final nameTextFieldController = TextEditingController();
  final businessNameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final addressTextFieldController = TextEditingController();
  final mobileTextFieldController = TextEditingController();
  final streetTextFieldController = TextEditingController();
  final stateTextFieldController = TextEditingController();
  final countryTextFieldController = TextEditingController();
  final subUrbTextFieldController = TextEditingController();
  final postCodeTextFieldController = TextEditingController();
  final businessIdTextFieldController = TextEditingController();
  var selectDatePageController =
      PageController(initialPage: 0, viewportFraction: 0.16);
  String vendorProfile = "";

  RxString currentSlotDuration = "".obs;

  late GooglePlace googlePlace;

  File? file;

  // String? userImage;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  // String defaultLatitude = "";
  // String defaultLongitude = "";

  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt selectedPageIndex = 0.obs;
  //RxInt selectedTimeIndex = 0.obs;
  RxInt selectedDateIndex = 0.obs;
  RxString timeSlots = 'Hour'.obs;
  RxString categoryId = '0'.obs;
  List<String> dateList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31'
  ];

  List<TimeSlotDurationModel> timeSlotDurationList = [
    TimeSlotDurationModel(name: "", value: "0"),
    TimeSlotDurationModel(name: "15 Mins", value: "15"),
    TimeSlotDurationModel(name: "30 Mins", value: "30"),
    TimeSlotDurationModel(name: "45 Mins", value: "45"),
    TimeSlotDurationModel(name: "1 Hour", value: "60"),
    TimeSlotDurationModel(name: "2 Hour", value: "120"),
    TimeSlotDurationModel(name: "3 Hour", value: "180"),
    TimeSlotDurationModel(name: "4 Hour", value: "240"),
    TimeSlotDurationModel(name: "5 Hour", value: "300"),
    TimeSlotDurationModel(name: "6 Hour", value: "360"),
    TimeSlotDurationModel(name: "7 Hour", value: "420"),
    TimeSlotDurationModel(name: "8 Hour", value: "480"),
    TimeSlotDurationModel(name: "9 Hour", value: "540"),
    TimeSlotDurationModel(name: "10 Hour", value: "600"),
  ];
  TimeSlotDurationModel? timeSlotDurationModel;
  RxString slotDurationValue = '0'.obs;
  String slotDuration = "";
  //RxString businessTypeValue = 'Saloon'.obs;
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  RxList<Datum> businessTypeLists = [Datum(name: "Select Business List")].obs;
  Datum? businessDropDownValue;
  ApiHeader apiHeader = ApiHeader();

  List<AutocompletePrediction> predictions = [];
  Timer? debounce;

  /// Map Module
  RxBool isMapShow = false.obs;
  RxString selectedLatitude = "".obs;
  RxString selectedLongitude = "".obs;
  Completer<GoogleMapController> mapController = Completer();
  late CameraPosition kGooglePlex;
  Set<Marker> markers = {};

  selectDatePreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  selectDateNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  vendorEditProfileFunction() async {
    isLoading(true);
    log('UserDetails.userId : ${UserDetails.userId}');
    log('selectedStartTime : $selectedStartTime');
    //String date= (DateTime.parse(selectedStartTime.hour.toString()).toString()) + ":" + (DateTime.parse(selectedStartTime.minute.toString()).toString());
    //String date1= (selectedStartTime.hour.toString()) + ":" + (selectedStartTime.minute.toString());
    //log('date: $date');
    String url = ApiUrl.vendorEditProfileApi;
    log('Url : $url');

    try {
      if (file != null) {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(file!.openRead());
        stream.cast();

        var length = await file!.length();

        request.files
            .add(await http.MultipartFile.fromPath("file", file!.path));

        request.headers.addAll(apiHeader.headers);

        request.fields['BusinessName'] =
            businessNameTextFieldController.text.trim();
        request.fields['Address'] = addressTextFieldController.text.trim();
        request.fields['PhoneNo'] = mobileTextFieldController.text.trim();
        request.fields['Duration'] = slotDurationValue.value;
        request.fields['CategoryId'] = "${businessDropDownValue!.id}";
        request.fields['ModifiedBy'] = UserDetails.uniqueId;
        request.fields['Id'] = UserDetails.tableWiseId.toString();
        request.fields['Longitude'] = selectedLongitude.value;
        request.fields['Latitude'] = selectedLatitude.value;

        var multiPart = http.MultipartFile(
          'file',
          stream,
          length,
        );

        request.files.add(multiPart);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        //log('request.files length : ${request.files.length}');
        //log('request.files name : ${request.files.first.filename}');
        //log('request.files filetype : ${request.files.first.contentType}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((value) {
              log('value123 : $value');
          VendorEditProfileModel response1 =
              VendorEditProfileModel.fromJson(json.decode(value));
          log('response1 ::::::${response1.statusCode}');
          isStatus = response1.statusCode.obs;
          log('status : $isStatus');
          log('success : ${response1.statusCode}');

          if (isStatus.value == 200) {
            getUserDetailsById();
            log("response1.message : ${response1.message}");
            Fluttertoast.showToast(msg: response1.message);
          } else {
            // Fluttertoast.showToast(msg: "${response1.message}");
            log('False False');
          }
        });
      } else {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        request.headers.addAll(apiHeader.headers);

        request.fields['BusinessName'] =
            businessNameTextFieldController.text.trim();
        request.fields['Address'] = addressTextFieldController.text.trim();
        request.fields['PhoneNo'] = mobileTextFieldController.text.trim();
        request.fields['Duration'] = slotDurationValue.value;
        request.fields['CategoryId'] = "${businessDropDownValue!.id}";
        request.fields['ModifiedBy'] = UserDetails.uniqueId;
        request.fields['Id'] = UserDetails.tableWiseId.toString();
        request.fields['Longitude'] = selectedLongitude.value;
        request.fields['Latitude'] = selectedLatitude.value;

        // request.fields['BusinessId'] = businessIdTextFieldController.text.trim();
        // request.fields['CategoryId'] = "${businessDropDownValue!.id}";
        // request.fields['Street'] = streetTextFieldController.text.trim();
        // request.fields['Suburb'] = subUrbTextFieldController.text.trim();
        // request.fields['Postcode'] = postCodeTextFieldController.text.trim();
        // request.fields['State'] = stateTextFieldController.text.trim();
        // request.fields['Country'] = countryTextFieldController.text.trim();

        // var multiPart = http.MultipartFile(
        //   'file',
        //   stream,
        //   length,
        // );
        //
        // request.files.add(multiPart);

        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        log('request.headers: ${request.headers}');

        var response = await request.send();
        log('response: ${response.request}');

        response.stream
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .listen((value) {
          log("value : $value");
          // Future.delayed(Duration(milliseconds: 800), () {});
          VendorEditProfileModel response1 =
              VendorEditProfileModel.fromJson(json.decode(value));
          log('response1 ::::::${response1.statusCode}');
          isStatus = response1.statusCode.obs;
          log('status : $isStatus');
          log('success : ${response1.statusCode}');

          if (isStatus.value == 200) {
            getUserDetailsById();
            log("response1.message : ${response1.message}");
            Fluttertoast.showToast(msg: response1.message);
          } else {
            // Fluttertoast.showToast(msg: "${response1.message}");
            log('False False');
          }
        });
      }
    } catch (e) {
      log('SignUp Error : $e');
    } finally {
      isLoading(false);
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  @override
  void dispose() {
    nameTextFieldController.clear();
    mobileTextFieldController.clear();
    emailTextFieldController.clear();
    businessNameTextFieldController.clear();
    addressTextFieldController.clear();
    streetTextFieldController.clear();
    stateTextFieldController.clear();
    countryTextFieldController.clear();
    subUrbTextFieldController.clear();
    postCodeTextFieldController.clear();
    businessIdTextFieldController.clear();
    log("Dispose Method Call");
    super.dispose();
  }

  getDataFromPrefs() async {
    // isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    prefs.getString(sharedPreferenceData.apiTokenKey) ?? "";
    prefs.getString(sharedPreferenceData.uniqueIdKey) ?? "";
    prefs.getInt(sharedPreferenceData.tableWiseIdKey) ?? 0;
    nameTextFieldController.text =
        prefs.getString(sharedPreferenceData.userNameKey) ?? "";
    emailTextFieldController.text =
        prefs.getString(sharedPreferenceData.emailKey) ?? "";
    mobileTextFieldController.text =
        prefs.getString(sharedPreferenceData.phoneNoKey) ?? "";
    prefs.getString(sharedPreferenceData.dobKey) ?? "";
    prefs.getString(sharedPreferenceData.roleNameKey) ?? "";
    prefs.getString(sharedPreferenceData.genderKey) ?? "";
    businessNameTextFieldController.text =
        prefs.getString(sharedPreferenceData.businessNameKey) ?? "";
    addressTextFieldController.text =
        prefs.getString(sharedPreferenceData.addressKey) ?? "";
    streetTextFieldController.text =
        prefs.getString(sharedPreferenceData.streetKey) ?? "";
    stateTextFieldController.text =
        prefs.getString(sharedPreferenceData.stateKey) ?? "";
    countryTextFieldController.text =
        prefs.getString(sharedPreferenceData.countryKey) ?? "";
    subUrbTextFieldController.text =
        prefs.getString(sharedPreferenceData.subUrbKey) ?? "";
    postCodeTextFieldController.text =
        prefs.getString(sharedPreferenceData.postCodeKey) ?? "";
    businessIdTextFieldController.text =
        prefs.getString(sharedPreferenceData.businessIdKey) ?? "";

    log("UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}");
    log("UserDetails.apiToken : ${UserDetails.apiToken}");
    log("UserDetails.uniqueId : ${UserDetails.uniqueId}");
    log("UserDetails.tableWiseId : ${UserDetails.tableWiseId}");
    log("UserDetails.userName : ${UserDetails.userName}");
    log("UserDetails.email : ${UserDetails.email}");
    log("UserDetails.phoneNo : ${UserDetails.phoneNo}");
    log("UserDetails.dob : ${UserDetails.dob}");
    log("UserDetails.roleName : ${UserDetails.roleName}");
    log("UserDetails.gender : ${UserDetails.gender}");
    log("UserDetails.businessName : ${UserDetails.businessName}");
    log("UserDetails.address : ${UserDetails.address}");
    log("UserDetails.street : ${UserDetails.street}");
    log("UserDetails.state : ${UserDetails.state}");
    log("UserDetails.country : ${UserDetails.country}");
    log("UserDetails.subUrb : ${UserDetails.subUrb}");
    log("UserDetails.postCode : ${UserDetails.postCode}");
    log("UserDetails.stripeId : ${UserDetails.stripeId}");
    log("UserDetails.businessId : ${UserDetails.businessId}");

    isLoading(false);
  }

  getAllBusinessTypeList() async {
    isLoading(true);
    String url = ApiUrl.vendorBusinessTypeApi;
    log('Url : $url');

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Get All Business Type List Response : ${response.body}');

      GetAllBusinessTypeModel getAllBusinessTypeModel =
          GetAllBusinessTypeModel.fromJson(json.decode(response.body));
      log('allBusinessModel : $getAllBusinessTypeModel');
      isSuccessStatus = getAllBusinessTypeModel.success!.obs;
      log('allBusinessModelStatus : $isSuccessStatus');

      if (isSuccessStatus.value) {
        log("Success");
        businessTypeLists.addAll(getAllBusinessTypeModel.data!);
        businessDropDownValue = businessTypeLists[0];
        log('businessDropDownValue: ${businessDropDownValue!.name}');
        log('businessLists : ${businessTypeLists.length}');
        kGooglePlex = CameraPosition(
          target: LatLng(
            double.parse(selectedLatitude.value.isEmpty
                ? "44.92057"
                : selectedLatitude.value),
            double.parse(selectedLongitude.value.isEmpty
                ? "-93.44786"
                : selectedLongitude.value),
          ),
          zoom: 16,
        );
      } else {
        log('Get All Business Else Else');
      }
    } catch (e) {
      log('Get All Business False False: $e');
    } finally {
      // isLoading(false);
      await getUserDetailsById();
    }
  }

  /// Get User Details By Id
  getUserDetailsById() async {
    // isLoading(true);
    String url = ApiUrl.getUserDetailsByIdApi + "?id=${UserDetails.uniqueId}";
    log('Url : $url');
    log('Url : ${{UserDetails.apiToken}}');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log('Get All User Details Response : ${response.body}');

      VendorProfileDetailsModel getUserDetailsByIdModel =
          VendorProfileDetailsModel.fromJson(json.decode(response.body));
      //log('getUserDetailsByIdModel : ${getUserDetailsByIdModel.data}');
      isStatus = getUserDetailsByIdModel.statusCode.obs;
      log('getUserDetailsByIdModel: ${getUserDetailsByIdModel.success}');
      log('getUserDetailsByIdModelStatus : $isStatus');

      if (isStatus.value == 200) {
        log("Success");
        vendorProfile = getUserDetailsByIdModel.data.businessLogo;
        log('vendorProfileApi : ${getUserDetailsByIdModel.data.businessLogo}');
        log('vendorProfile : $vendorProfile');
        businessIdTextFieldController.text =
            getUserDetailsByIdModel.data.businessId;
        categoryId.value = getUserDetailsByIdModel.data.categoryId.toString();
        nameTextFieldController.text = getUserDetailsByIdModel.data.userName;
        emailTextFieldController.text = getUserDetailsByIdModel.data.email;
        businessNameTextFieldController.text =
            getUserDetailsByIdModel.data.businessName;
        mobileTextFieldController.text = getUserDetailsByIdModel.data.phoneNo;
        addressTextFieldController.text = getUserDetailsByIdModel.data.address;
        streetTextFieldController.text = getUserDetailsByIdModel.data.street;
        stateTextFieldController.text = getUserDetailsByIdModel.data.state;
        countryTextFieldController.text = getUserDetailsByIdModel.data.country;
        subUrbTextFieldController.text = getUserDetailsByIdModel.data.suburb;
        postCodeTextFieldController.text =
            getUserDetailsByIdModel.data.postcode;
        slotDurationValue.value =
            getUserDetailsByIdModel.data.duration.toString();

        for(int i =0; i < timeSlotDurationList.length; i++) {
          if(timeSlotDurationList[i].value == slotDurationValue.value) {
            timeSlotDurationModel = timeSlotDurationList[i];
          }
        }

        currentSlotDuration.value =
            getUserDetailsByIdModel.data.duration.toString();
        businessDropDownValue!.name =
            getUserDetailsByIdModel.data.categories.name;
        businessDropDownValue!.id = getUserDetailsByIdModel.data.categories.id;
        slotDurationValue.value = slotDurationValue.value;
        selectedLatitude.value = getUserDetailsByIdModel.data.latitude == ""
            ? UserDetails.latitude
            : getUserDetailsByIdModel.data.latitude;

        selectedLongitude.value = getUserDetailsByIdModel.data.longitude == ""
            ? UserDetails.longitude
            : getUserDetailsByIdModel.data.longitude;

        kGooglePlex = CameraPosition(
          target: LatLng(
            double.parse(selectedLatitude.value.isEmpty
                ? "44.92057"
                : selectedLatitude.value),
            double.parse(selectedLongitude.value.isEmpty
                ? "-93.44786"
                : selectedLongitude.value),
          ),
          zoom: 16,
        );

        log("kGooglePlex : $kGooglePlex");
        log('slotDuration: ${slotDurationValue.value}');

        //log('businessLists : ${businessTypeLists.length}');

        // log('businessIdTextFieldController.text : ${businessIdTextFieldController.text}');
        // log('nameTextFieldController.text : ${nameTextFieldController.text}');
        // log('emailTextFieldController.text : ${emailTextFieldController.text}');
        // log('businessNameTextFieldController.text : ${businessNameTextFieldController.text}');
        // log('mobileTextFieldController.text : ${mobileTextFieldController.text}');
        // log('addressTextFieldController.text : ${addressTextFieldController.text}');
        // log('streetTextFieldController.text : ${streetTextFieldController.text}');
        // log('stateTextFieldController.text : ${stateTextFieldController.text}');
        // log('countryTextFieldController.text : ${countryTextFieldController.text}');
        // log('subUrbTextFieldController.text : ${subUrbTextFieldController.text}');
        // log('postCodeTextFieldController.text : ${postCodeTextFieldController.text}');
        // log('slotDurationValue.value : ${slotDurationValue.value}');
        // log('businessDropDownValue : ${businessDropDownValue!.name}');
      } else {
        log('Get All User Details Else Else');
      }
    } catch (e) {
      log('Get All User Details False False: $e');
    } finally {
      getDataFromPrefs();
      // isLoading(false);
    }
  }

  saveVendorLatLongFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorSaveLatLongApi +
        "?CurrentLatitude=${selectedLatitude.value}" +
        "&CurrentLongitude=${selectedLongitude.value}" +
        "&id=${UserDetails.tableWiseId}";
    log("save Vendor API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Save Vendor Response : ${response.body}");

      SaveVendorLatLongModel saveVendorLatLongModel =
          SaveVendorLatLongModel.fromJson(json.decode(response.body));
      isSuccessStatus = saveVendorLatLongModel.success.obs;

      if (isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "Location Saved");
        await getAllBusinessTypeList();
      } else {
        log("saveVendorLatLongFunction Else Else");
      }
    } catch (e) {
      log("saveVendorLatLongFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    //await getDataFromPrefs();
    getAllBusinessTypeList();

    googlePlace = GooglePlace(ApiUrl.googleApiKey);

    // getUserDetailsById();
    super.onInit();
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);

    if (result != null && result.predictions != null) {
      log(result.predictions!.first.description!);
      predictions = result.predictions!;
      isLoading(true);
      isLoading(false);
    }
  }
}
