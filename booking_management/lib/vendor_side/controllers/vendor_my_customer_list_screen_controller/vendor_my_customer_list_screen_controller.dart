import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/vendor_side/model/vendor_my_customer_model/vendor_my_customer_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorMyCustomerScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<CustomerDatum> allCustomerList = [];

  ApiHeader apiHeader = ApiHeader();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyCustomerList();
  }

  getMyCustomerList() async {
    isLoading(true);
    String url = ApiUrl.vendorMyCustomerApi + "?vendorid=${UserDetails.uniqueId}";
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);

      log('All Customer Response : ${response.body}');

      GetMyCustomerModel getMyCustomerModel = GetMyCustomerModel.fromJson(json.decode(response.body));
      isStatus = getMyCustomerModel.success.obs;
      log("status : $isStatus");

      if(isStatus.value){
        allCustomerList = getMyCustomerModel.data;
        log('allCustomerList : $allCustomerList');
      } else {
        log('Get All Customer Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }
}