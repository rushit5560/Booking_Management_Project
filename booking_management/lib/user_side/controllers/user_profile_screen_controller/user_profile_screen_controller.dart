import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:http_parser/http_parser.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/api_header.dart';
import '../../model/user_profile_screen_model/update_user_profile_model.dart';
import '../../model/user_profile_screen_model/user_profile_details_model.dart';

class UserProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt isStatus = 0.obs;
  File? file;

  String? userImage;

  // RxString selectedDate = UserDetails.dob.obs;
  DateTime selectedDate = DateTime.now();
  RxString gender = 'Male'.obs;

  ApiHeader apiHeader = ApiHeader();

  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final nameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final addressTextFieldController = TextEditingController();
  final mobileTextFieldController = TextEditingController();
  final cityTextFieldController = TextEditingController();
  final stateTextFieldController = TextEditingController();
  final countryTextFieldController = TextEditingController();
  String selectDOB = "";

  updateUserProfileFunction() async {
    isLoading(true);

    String url = ApiUrl.userProfileApi;
    log("Update User Profile url: $url");

    log('UserDetails.userid: ${UserDetails.uniqueId}');

    try {
      if (file != null) {
        print("uploading with a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        var stream = http.ByteStream(file!.openRead());
        stream.cast();

        var length = await file!.length();

        request.files
            .add(await http.MultipartFile.fromPath("image", file!.path));
        request.headers.addAll(apiHeader.headers);

        request.fields['Id'] = UserDetails.tableWiseId.toString();
        request.fields['PhoneNo'] = mobileTextFieldController.text.trim();
        request.fields['DateOfBirth'] = "$selectedDate";
        request.fields['Gender'] = gender.value;
        request.fields['ModifiedBy'] = UserDetails.uniqueId;

        var multiPart = http.MultipartFile(
          'image',
          stream,
          length,

          //filename: "",
        );

        // var multiFile = await http.MultipartFile.fromPath(
        //  "image",
        //   file!.path,
        // );

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
            .listen((value) async {
          UpdateUserProfileModel updateUserProfileModel =
              UpdateUserProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updateUserProfileModel.statusCode}');
          isSuccessStatus = updateUserProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: "User update successfully.");
            log(updateUserProfileModel.dataVendor.userName);
            log(updateUserProfileModel.dataVendor.email);
            log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      } else {
        print("uploading without a photo");
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // var stream = http.ByteStream(file!.openRead());
        // stream.cast();
        //
        // var length = await file!.length();

        request.headers.addAll(apiHeader.headers);

        request.fields['Id'] = UserDetails.tableWiseId.toString();
        request.fields['PhoneNo'] = mobileTextFieldController.text.trim();
        request.fields['DateOfBirth'] = "$selectedDate";
        request.fields['Gender'] = gender.value;
        request.fields['ModifiedBy'] = UserDetails.uniqueId;

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
            .listen((value) async {
          UpdateUserProfileModel updateUserProfileModel =
              UpdateUserProfileModel.fromJson(json.decode(value));
          log('response1 :::::: ${updateUserProfileModel.statusCode}');
          isSuccessStatus = updateUserProfileModel.success.obs;

          if (isSuccessStatus.value) {
            Fluttertoast.showToast(msg: "User update successfully.");
            log(updateUserProfileModel.dataVendor.userName);
            log(updateUserProfileModel.dataVendor.email);
            log(updateUserProfileModel.dataVendor.phoneNo);
            Get.back();
          } else {
            log('False False');
          }
        });
      }
    } catch (e) {
      log("updateUserProfileFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Get User Details By Id
  getUserDetailsById() async {
    isLoading(true);
    String url = ApiUrl.getUserDetailsByIdApi + "?id=${UserDetails.uniqueId}";
    log('Url : $url');
    log('header: ${apiHeader.headers}');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('Get All User Details Response : ${response.body}');

      UserProfileDetailsModel userProfileDetailsModel =
          UserProfileDetailsModel.fromJson(json.decode(response.body));
      isStatus = userProfileDetailsModel.statusCode!.obs;
      log('getUserDetailsByIdModel: ${userProfileDetailsModel.success}');
      log('getUserDetailsByIdModelStatus : $isStatus');

      if (isStatus.value == 200) {
        nameTextFieldController.text =
            userProfileDetailsModel.data!.userName ?? "";
        emailTextFieldController.text = userProfileDetailsModel.data!.email!;
        mobileTextFieldController.text =
            userProfileDetailsModel.data!.phoneNo ?? "";
        userImage = userProfileDetailsModel.data!.image ?? "";

        gender.value = userProfileDetailsModel.data!.gender ?? "";
        selectedDate = DateTime.parse(
            userProfileDetailsModel.data!.dateOfBirth ??
                DateTime.now().toIso8601String());

        // if(userProfileDetailsModel.data.dateOfBirth.length > 10) {
        //   String dob = userProfileDetailsModel.data.dateOfBirth;
        //   String finalDob = dob.substring(0, dob.length - 9);
        //   selectedDate.value = finalDob;
        // } else {
        //   selectedDate.value = userProfileDetailsModel.data.dateOfBirth;
        // }
      } else {
        log('Get All User Details Else Else');
      }
    } catch (e) {
      log('Get All User Details Error ::: $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getUserDetailsById();
    // nameTextFieldController.text = UserDetails.userName;
    // mobileTextFieldController.text = UserDetails.phoneNo;
    // selectedDate.value = UserDetails.dob;
    // emailTextFieldController.text = UserDetails.email;
    // gender.value = UserDetails.gender;
    super.onInit();
  }
}
