import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/model/vendor_details_screen_models/country_model.dart';
import 'package:booking_management/vendor_side/model/vendor_sign_up_model/vendor_sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorSignUpScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isCPasswordVisible = true.obs;

  RxString businessType = 'Business'.obs;
  GlobalKey<FormState> vendorSignUpFormKey = GlobalKey<FormState>();
  final TextEditingController userNameFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController fullNameFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController lastNameFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController businessNameFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController emailFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController mobileFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController businessAddress1FieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController businessAddress2FieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController streetFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController stateFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController countryFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController postCodeFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController subUrbFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController businessIdFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController passwordFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  final TextEditingController cPasswordFieldController =
      TextEditingController(/*text: "demo@gmail.com"*/);
  RxBool vendorPortal = false.obs;
  RxBool termsAndConditionCheckBox = false.obs;
  RxBool priceCheckBox = false.obs;
  RxBool serviceCheckBox = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxString selectedCountry = "Select Country".obs;

  RxString selectedCountryCode = "SC".obs;

  List<CountryData> countriesList = [CountryData()];
  CountryData? countryData;

  Future<void> getAllCountries() async {
    isLoading(true);
    String url = ApiUrl.getAllCountriesApi;
    log("get all countries Url : $url");

    try {
      http.Response response = await http.get(Uri.parse(url));
      log("Response : ${response.body}");

      CountryModel countriesModel =
          CountryModel.fromJson(json.decode(response.body));
      isSuccessStatus = countriesModel.success.obs;

      if (isSuccessStatus.value == true) {
        countriesList.clear();

        countriesList
            .add(CountryData(id: 0, code: "SC", country: "Select Country"));
        countriesList.addAll(countriesModel.workerList);
        countryData = countriesList[0];
        log("countryData :${countryData!.country}");
      } else {
        log("countries get false Else");
      }
    } catch (e) {
      log("countries get Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllCountries();
  }

  vendorSignUpFunction() async {
    isLoading(true);

    String url = ApiUrl.vendorSignUpApi;
    log('Url : $url');

    try {
      /*Map<String, dynamic> data = {
        "FirstName": firstName,
        "LastName": lastName,
        "State" : state,
        "City" : city,
        "Email" : email,
        "PasswordHash" : password,
        "PhoneNo" : mobile,
        // "Gender" : "Male",
        // "About" : "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        // "FaxNumber" : "20",
        // "IsActive": "true",
        //"DateOfBirth" : dobFieldController.text.trim()
      };*/

      //log('data : $data');

      //var stream = http.ByteStream(file!.openRead());
      //stream.cast();

      //var length = await file!.length();

      var request = http.MultipartRequest('POST', Uri.parse(url));

      //request.files.add(await http.MultipartFile.fromPath("file", file!.path));

      // request.fields['FirstName'] = "Testing120";
      // request.fields['LastName'] = "Testing";
      // request.fields['State'] = "Testing";
      // request.fields['City'] = "Testing";
      // request.fields['Email'] = "Testing122@gmail.com";
      // request.fields['PasswordHash'] = "Admin@123";
      // request.fields['PhoneNo'] = "7896541320";
      // request.fields['Gender'] = "Male";
      // request.fields['About'] = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
      // request.fields['LastVisit'] = "2001-12-01";
      // request.fields['FaxNumber'] = "20";
      // request.fields['DateOfBirth'] = "2001-12-01";
      //request.fields['CategoryId'] = "1";
      request.fields['UserName'] = userNameFieldController.text.trim();
      request.fields['FullName'] = fullNameFieldController.text.trim();
      request.fields['Email'] = emailFieldController.text.trim();
      request.fields['PhoneNo'] = mobileFieldController.text.trim();
      request.fields['PasswordHash'] = passwordFieldController.text.trim();
      request.fields['IsActive'] = "true";
      request.fields['VendorPortal'] = "true";
      request.fields['BusinessId'] = businessIdFieldController.text.trim();
      request.fields['TermsConditions'] = termsAndConditionCheckBox.toString();
      request.fields['IsServiceSlots'] = serviceCheckBox.toString();
      request.fields['IsPriceDisplay'] = priceCheckBox.toString();
      request.fields['Country'] = countryData!.code.toString();
      request.fields['BusinessName'] = businessNameFieldController.text.trim();

      log('request.fields: ${request.fields}');
      log('request.files: ${request.files}');

      // var multiPart = http.MultipartFile(
      //   'file',
      //   stream,
      //   length,
      // );

      //request.files.add(multiPart);

      var response = await request.send();
      log('response: ${response.request}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) {
        VendorSignUpModel response1 =
            VendorSignUpModel.fromJson(json.decode(value));
        log('response1 ::::::${response1.statusCode}');
        isStatus = response1.statusCode.obs;
        log('status : $isStatus');
        log('success : ${response1.data.email}');
        log('password : ${response1.data.passwordHash}');

        if (isStatus.value == 200) {
          //UserDetails().vendorId = response1.data.id;
          //log("Vendor Id: ${UserDetails().vendorId}");
          Fluttertoast.showToast(
              msg: "${response1.message}. Please confirm your email.");
          clearSignUpFieldsFunction();
          Get.off(() => SignInScreen(), transition: Transition.zoom);
        } else {
          Fluttertoast.showToast(msg: response1.message);
          log('False False');
        }
      });

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

    } catch (e) {
      log('SignUp Error : $e');
    } finally {
      isLoading(false);
    }
  }

  clearSignUpFieldsFunction() {
    userNameFieldController.clear();
    lastNameFieldController.clear();
    emailFieldController.clear();
    mobileFieldController.clear();
    businessAddress1FieldController.clear();
    businessAddress2FieldController.clear();
    stateFieldController.clear();
    countryFieldController.clear();
    passwordFieldController.clear();
    cPasswordFieldController.clear();
    streetFieldController.clear();
    subUrbFieldController.clear();
    postCodeFieldController.clear();
    businessNameFieldController.clear();
    businessIdFieldController.clear();
    termsAndConditionCheckBox(false);
    priceCheckBox(false);
    serviceCheckBox(false);
  }
}
