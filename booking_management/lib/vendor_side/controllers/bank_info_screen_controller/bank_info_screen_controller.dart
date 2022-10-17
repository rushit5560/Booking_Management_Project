import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/vendor_side/model/bank_info_screen_models/get_bank_info_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankInfoScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController financialInstituteNameController =
      TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();

  // Save Bank Info
  saveBankInfoFunction() async {
    isLoading(true);
    String url = ApiUrl.saveVendorBankInfoApi;
    log("save Bank Info Api Url : $url");

    try {
      Map<String, String> headers = <String, String>{
        'Authorization': UserDetails.apiToken
      };

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(headers);

      request.fields['FinancialInstitutionName'] =
          financialInstituteNameController.text.trim();
      request.fields['AccountName'] = accountNameController.text.trim();
      request.fields['AccountNumber'] = accountNumberController.text.trim();
      request.fields['AccountCode'] = ifscCodeController.text.trim();
      request.fields['ModifiedBy'] = UserDetails.uniqueId;
      request.fields['Id'] = UserDetails.tableWiseId.toString();

      log('request.fields: ${request.fields}');
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.request}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        log("value : $value");
        GetBankInfoModel getBankInfoModel =
            GetBankInfoModel.fromJson(json.decode(value));
        isSuccessStatus = getBankInfoModel.success.obs;

        var body = jsonDecode(value);
        if (isSuccessStatus.value) {
          Fluttertoast.showToast(
              msg: "Bank Account Information update successfully");
          await sharedPreferenceData.setBankInfoInPrefs(
            instituteName: getBankInfoModel.workerList.financialInstitutionName,
            accountName: getBankInfoModel.workerList.accountName,
            accountNumber: getBankInfoModel.workerList.accountNumber,
            ifscCode: getBankInfoModel.workerList.accountCode,
          );
        } else if (body["statusCode"].toString().contains("417")) {
          Fluttertoast.showToast(msg: body["errorMessage"]);
          log("saveBankInfoFunction Else if");
          // Get.snackbar("", message);
        } else {
          log("saveBankInfoFunction Else Else");
        }
      });
    } catch (e) {
      log("saveBankInfoFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }



  @override
  void onInit() {
    financialInstituteNameController.text = UserDetails.institutionName;
    accountNameController.text = UserDetails.accountName;
    accountNumberController.text = UserDetails.accountNumber;
    ifscCodeController.text = UserDetails.ifscCode;
    super.onInit();
  }
}
