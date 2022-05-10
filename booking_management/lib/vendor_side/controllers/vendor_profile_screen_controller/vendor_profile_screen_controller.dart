import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/vendor_side/model/vendor_update_profile_model/vendor_update_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
  var selectDatePageController = PageController(initialPage: 0, viewportFraction: 0.16);

  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;

  RxInt selectedPageIndex = 0.obs;
  //RxInt selectedTimeIndex = 0.obs;
  RxInt selectedDateIndex = 0.obs;
  RxString timeSlots = 'Hour'.obs;
  List<String> dateList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24' , '25', '26', '27', '28', '29', '30', '31'];

  File? file;
  RxString slotDurationValue = '15'.obs;
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  selectDatePreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  selectDateNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  vendorEditProfileFunction() async{
    isLoading(true);
    log('UserDetails.userId : ${UserDetails.userId}');
    print('selectedStartTime : $selectedStartTime');
    //String date= (DateTime.parse(selectedStartTime.hour.toString()).toString()) + ":" + (DateTime.parse(selectedStartTime.minute.toString()).toString());
    //String date1= (selectedStartTime.hour.toString()) + ":" + (selectedStartTime.minute.toString());
    //log('date: $date');
    String url = ApiUrl.vendorEditProfileApi;
    log('Url : $url');

    try{
      if(file != null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(file!.openRead());
        stream.cast();

        var length = await file!.length();

        request.files.add(
            await http.MultipartFile.fromPath("file", file!.path));

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

        var multiPart = http.MultipartFile('file', stream, length);
        request.files.add(multiPart);
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
      } else if(file == null){
        var request = http.MultipartRequest('POST', Uri.parse(url));

        //var stream = http.ByteStream(file!.openRead());
        //stream.cast();

        //var length = await file!.length();

        // request.files.add(
        //     await http.MultipartFile.fromPath("file", file!.path));

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
      }


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
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameTextFieldController.text = UserDetails.userName;
    mobileTextFieldController.text = UserDetails.phoneNo;
    emailTextFieldController.text = UserDetails.email;
    businessNameTextFieldController.text = UserDetails.businessName;
    addressTextFieldController.text = UserDetails.address;
    streetTextFieldController.text = UserDetails.street;
    stateTextFieldController.text = UserDetails.state;
    countryTextFieldController.text = UserDetails.country;
    subUrbTextFieldController.text = UserDetails.subUrb;
    postCodeTextFieldController.text = UserDetails.postCode;
    //file = File(UserDetails.vendorProfile);
  }
}