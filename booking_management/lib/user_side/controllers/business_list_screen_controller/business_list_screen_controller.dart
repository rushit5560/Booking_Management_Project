import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/user_side/model/user_business_list_model/user_business_list_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BusinessListScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  List<Datum> businessList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBusinessList();
  }

  getBusinessList()async{
    isLoading(true);
    String url = ApiUrl.userBusinessListApi;
    log('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      BusinessListModel businessListModel = BusinessListModel.fromJson(json.decode(response.body));
      isStatus = businessListModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        businessList = businessListModel.data;
        log('allBusinessList : $businessList');
      } else {
        log('Get All Business Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
       isLoading(false);
    }
  }
}