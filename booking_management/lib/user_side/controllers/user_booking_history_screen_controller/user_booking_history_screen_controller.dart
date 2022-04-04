import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/model/user_booking_history_model/user_booking_history_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserBookingHistoryScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  List<Datum> historyList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userBookingHistory();
  }

  userBookingHistory()async{
    isLoading(true);
    String url = ApiUrl.userBookingHistoryApi + "?CustomerId=${UserDetails.customerId}";
    log('customer Id: ${UserDetails.customerId}');
    log('Url : $url');
    try{
      http.Response response = await http.get(Uri.parse(url));

      log('Response : ${response.body}');

      UserBookingHistoryModel bookingHistoryModel = UserBookingHistoryModel.fromJson(json.decode(response.body));
      isStatus = bookingHistoryModel.statusCode.obs;
      log("status : $isStatus");

      if(isStatus.value == 200){
        historyList = bookingHistoryModel.data;
        log('allHistoryList : $historyList');
      } else {
        log('Get All History Else Else');
      }
    } catch(e) {
      log('Error : $e');
    } finally {
      isLoading(false);
    }
  }
}