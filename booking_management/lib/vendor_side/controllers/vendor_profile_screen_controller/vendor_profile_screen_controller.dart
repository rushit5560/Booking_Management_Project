import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/vendor_side/model/get_business_type_model/get_business_type_model.dart';
import 'package:booking_management/vendor_side/model/vendor_update_profile_model/vendor_update_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VendorProfileScreenController extends GetxController{
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
  var selectDatePageController = PageController(initialPage: 0, viewportFraction: 0.16);

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt selectedPageIndex = 0.obs;
  //RxInt selectedTimeIndex = 0.obs;
  RxInt selectedDateIndex = 0.obs;
  RxString timeSlots = 'Hour'.obs;
  List<String> dateList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24' , '25', '26', '27', '28', '29', '30', '31'];

  File? file;
  RxString slotDurationValue = '15'.obs;
  RxString businessTypeValue = 'Saloon'.obs;
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  RxList<Datum> businessTypeLists = [Datum(name: "Select Business Type")].obs;
  Datum? businessDropDownValue;

  ApiHeader apiHeader = ApiHeader();

  selectDatePreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  selectDateNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  vendorEditProfileFunction() async {
    isLoading(true);
    log('UserDetails.userId : ${UserDetails.userId}');
    print('selectedStartTime : $selectedStartTime');
    //String date= (DateTime.parse(selectedStartTime.hour.toString()).toString()) + ":" + (DateTime.parse(selectedStartTime.minute.toString()).toString());
    //String date1= (selectedStartTime.hour.toString()) + ":" + (selectedStartTime.minute.toString());
    //log('date: $date');
    String url = ApiUrl.vendorEditProfileApi;
    log('Url : $url');

    Map<String, String> headers= <String,String>{
      'Authorization': UserDetails.apiToken
    };
    log('UserDetails.apiToken: ${UserDetails.apiToken}');

    try{
      //if(file != null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(file!.openRead());
        //stream.cast();

        //var length = await file!.length();

        request.headers.addAll(headers);
        // request.files.add(
        //     await http.MultipartFile.fromPath("file", file!.path));
        request.fields['BusinessId'] = businessIdTextFieldController.text.trim();
        request.fields['CategoryId'] = "$businessDropDownValue";
        request.fields['BusinessName'] = businessNameTextFieldController.text.trim();
        request.fields['PhoneNo'] = mobileTextFieldController.text.trim();
        request.fields['Street'] = streetTextFieldController.text.trim();
        request.fields['Suburb'] = subUrbTextFieldController.text.trim();
        request.fields['Postcode'] = postCodeTextFieldController.text.trim();
        request.fields['State'] = stateTextFieldController.text.trim();
        request.fields['Country'] = countryTextFieldController.text.trim();
        request.fields['Address'] = addressTextFieldController.text.trim();
        request.fields['ModifiedBy'] = UserDetails.uniqueId;
        request.fields['Duration'] = slotDurationValue.value;
        request.fields['StartTime'] = "${selectedStartTime.hour}:${selectedStartTime.minute}";
        request.fields['EndTime'] = "${selectedEndTime.hour}:${selectedEndTime.minute}";
        request.fields['Id'] = UserDetails.tableWiseId.toString();


        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');
        log('request.headers: ${request.headers}');
        // var multiPart = http.MultipartFile(
        //   'file',
        //   stream,
        //   length,
        // );

        //request.files.add(multiPart);

        //var multiPart = http.MultipartFile('file', stream, length);
        //request.files.add(multiPart);
        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          VendorEditProfileModel response1 = VendorEditProfileModel.fromJson(json.decode(value));
          log('response1 ::::::${response1.statusCode}');
          isStatus = response1.statusCode.obs;
          log('status : $isStatus');
          log('success : ${response1.statusCode}');

          if(isStatus.value == 200){
            //UserDetails().vendorId = response1.data.id;
            //log("Vendor Id: ${UserDetails().vendorId}");
            Fluttertoast.showToast(msg: response1.message);
            //clearSignUpFieldsFunction();
            //Get.off(SignInScreen(), transition: Transition.zoom);

          } else {
            // Fluttertoast.showToast(msg: "${response1.message}");
            log('False False');
          }
        });
     /* } else if(file == null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(file!.openRead());
        //stream.cast();

        //var length = await file!.length();

        // request.files.add(
        //     await http.MultipartFile.fromPath("file", file!.path));

        request.headers.addAll(headers);

        request.fields['CategoryId'] = "1";
        request.fields['BusinessName'] = businessNameTextFieldController.text.trim();
        request.fields['PhoneNo'] = mobileTextFieldController.text.trim();
        request.fields['Street'] = streetTextFieldController.text.trim();
        request.fields['Suburb'] = subUrbTextFieldController.text.trim();
        request.fields['Postcode'] = postCodeTextFieldController.text.trim();
        request.fields['State'] = stateTextFieldController.text.trim();
        request.fields['Country'] = countryTextFieldController.text.trim();
        request.fields['Address'] = addressTextFieldController.text.trim();
        request.fields['ModifiedBy'] = UserDetails.uniqueId;
        request.fields['Duration'] = slotDurationValue.value;
        request.fields['StartTime'] = "09-05-2022 19:30:00";
        request.fields['EndTime'] = "09-05-2022 19:30:00";
        request.fields['Id'] = UserDetails.tableWiseId.toString();


        log('request.fields: ${request.fields}');
        log('request.files: ${request.files}');

        // var multiPart = http.MultipartFile(
        //   'file',
        //   stream,
        //   length,
        // );

        //request.files.add(multiPart);

        //var multiPart = http.MultipartFile('file', stream, length);
       // request.files.add(multiPart);
        var response = await request.send();
        log('response: ${response.request}');

        response.stream.transform(utf8.decoder).listen((value) {
          VendorEditProfileModel response1 = VendorEditProfileModel.fromJson(json.decode(value));
          log('response1 ::::::${response1.statusCode}');
          isStatus = response1.statusCode.obs;
          log('status : $isStatus');
          log('success : ${response1.statusCode}');

          if(isStatus.value == 200){
            //UserDetails().vendorId = response1.data.id;
            //log("Vendor Id: ${UserDetails().vendorId}");
            Fluttertoast.showToast(msg: response1.message);
            //clearSignUpFieldsFunction();
            //Get.off(SignInScreen(), transition: Transition.zoom);

          } else {
            // Fluttertoast.showToast(msg: "${response1.message}");
            log('False False');
          }
        });
      }*/


      // http.Response response = await http.post(Uri.parse(url));
      //
      // UserSignUpModel userSignUpModel = UserSignUpModel.fromJson(json.decode(response.body));
      // isStatus = userSignUpModel.statusCode!.obs;
      //
      // if(isStatus.value == 200) {
      //   //String userToken = signInModel.token;
      //   //print('userToken : $userToken');
      //   // await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
      //   // await createUserWallet();
      //   Get.offAll(() => IndexScreen());
      //   Get.snackbar('User Register Successfully.', '');
      // } else {
      //   print('SignUp False False');
      // }

    } catch(e) {
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
    log("Dispose Method Call");
    super.dispose();
  }


  getDataFromPrefs() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool(sharedPreferenceData.isUserLoggedInKey) ?? false;
    prefs.getString(sharedPreferenceData.apiTokenKey) ?? "";
    prefs.getString(sharedPreferenceData.uniqueIdKey) ?? "";
    prefs.getInt(sharedPreferenceData.tableWiseIdKey) ?? 0;
    nameTextFieldController.text = prefs.getString(sharedPreferenceData.userNameKey) ?? "";
    emailTextFieldController.text = prefs.getString(sharedPreferenceData.emailKey) ?? "";
    mobileTextFieldController.text = prefs.getString(sharedPreferenceData.phoneNoKey) ?? "";
    prefs.getString(sharedPreferenceData.dobKey) ?? "";
    prefs.getString(sharedPreferenceData.roleNameKey) ?? "";
    prefs.getString(sharedPreferenceData.genderKey) ?? "";
    businessNameTextFieldController.text = prefs.getString(sharedPreferenceData.businessNameKey) ?? "";
    addressTextFieldController.text = prefs.getString(sharedPreferenceData.addressKey) ?? "";
    streetTextFieldController.text = prefs.getString(sharedPreferenceData.streetKey) ?? "";
    stateTextFieldController.text = prefs.getString(sharedPreferenceData.stateKey) ?? "";
    countryTextFieldController.text = prefs.getString(sharedPreferenceData.countryKey) ?? "";
    subUrbTextFieldController.text = prefs.getString(sharedPreferenceData.subUrbKey) ?? "";
    postCodeTextFieldController.text = prefs.getString(sharedPreferenceData.postCodeKey) ?? "";

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


    isLoading(false);
    loadUI();
  }

  getAllBusinessTypeList() async {
    isLoading(true);
    String url = ApiUrl.vendorBusinessTypeApi;
    log('Url : $url');

    try{
      // Map<String, String> headers = <String,String>{
      //   'Authorization': "d/R2zvBXjM3qrWn65cE2IDjYC6MJhMkfuqKpRP4Z9Eg="
      // };

      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Get All Business Type List Response : ${response.body}');

      GetAllBusinessTypeModel getAllBusinessTypeModel = GetAllBusinessTypeModel.fromJson(json.decode(response.body));
      log('allBusinessModel : $getAllBusinessTypeModel');
      isSuccessStatus = getAllBusinessTypeModel.success!.obs;
      log('allBusinessModelStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        log("Success");
        businessTypeLists.addAll(getAllBusinessTypeModel.data!);
        businessDropDownValue = businessTypeLists[0];
        log('businessLists : ${businessTypeLists.length}');
      } else {
        log('Get All Business Else Else');
      }

    } catch(e) {
      log('Get All Business False False: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() async {
    await getDataFromPrefs();
    getAllBusinessTypeList();
    super.onInit();

  }


}