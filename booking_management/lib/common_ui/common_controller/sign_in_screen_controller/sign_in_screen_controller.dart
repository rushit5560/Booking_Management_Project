import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/model/sign_in_screen_model/sign_in_screen_model.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isPasswordVisible = true.obs;
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController unameFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  signInFunction() async {
    isLoading(true);

    String url = ApiUrl.signInApi +
        "?UserName=${unameFieldController.text.trim()}&Password=${passwordFieldController.text.trim()}";
    log('Url : $url');

    try {
      http.Response response = await http.post(Uri.parse(url));
      log('Response : $response');

      SignInModel signInModel =
          SignInModel.fromJson(json.decode(response.body));
      isStatus = signInModel.statusCode.obs;

      log("status: $isStatus");

      if (isStatus.value == 200) {
        if (signInModel.message.toString().contains("not Verified")) {
          Get.snackbar(signInModel.message, '');
        } else if (signInModel.message.contains("Invalid login attempt")) {
          Get.snackbar(signInModel.message, '');
        } else if (signInModel.role.name == "Customer") {
          log('customer side');
          Get.snackbar(signInModel.message, '');
          sharedPreferenceData.setUserLoginDetailsInPrefs(
            apiToken: signInModel.data.apiToken,
            uniqueId: signInModel.data.id,
            tableWiseId: signInModel.customer.id,
            userName: signInModel.data.userName,
            email: signInModel.data.email,
            phoneNo: signInModel.data.phoneNumber,
            dob: signInModel.customer.dateOfBirth,
            roleName: signInModel.role.name,
            gender: signInModel.customer.gender,
            businessName: "",
            address: "",
            street: "",
            state: "",
            country: "",
            subUrb: "",
            postCode: "",
          );
          Get.offAll(() => IndexScreen());

          //Get.snackbar(signInModel.message, '');
        } else if (signInModel.role.name == "Vendor") {
          log('Vendor side');
          Get.snackbar(signInModel.message, '');
          sharedPreferenceData.setUserLoginDetailsInPrefs(
            apiToken: signInModel.data.apiToken,
            uniqueId: signInModel.data.id,
            tableWiseId: signInModel.vendor.id,
            userName: signInModel.data.userName,
            email: signInModel.data.email,
            phoneNo: signInModel.data.phoneNumber,
            dob: "",
            roleName: signInModel.role.name,
            gender: "",
            businessName: signInModel.vendor.businessName,
            address: signInModel.vendor.address,
            street: signInModel.vendor.street,
            state: signInModel.vendor.state,
            country: signInModel.vendor.country,
            subUrb: signInModel.vendor.suburb,
            postCode: signInModel.vendor.postcode,
          );
          Get.offAll(() => VendorIndexScreen());
          //Get.snackbar('LoggedIn Successfully.', '');
        }
      } else {
        log('SignIn False False');
        Get.snackbar(signInModel.message, '');
      }
    } catch (e) {
      log('SignIn Error : $e');
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      isLoading(false);
    }
  }
}
