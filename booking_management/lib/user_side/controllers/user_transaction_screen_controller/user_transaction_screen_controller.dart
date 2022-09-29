import 'dart:convert';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/user_transaction_screen_model/user_transaction_screen_model.dart';

class UserTransactionScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<WorkerList> transactionList = [];
  String orderDate = "";
  String orderDate1 = "";

  getUserTransactionFunction() async {
    isLoading(true);
    String url = ApiUrl.getTransactionListApi + "?id=${UserDetails.uniqueId}";
    log("Transaction Get API URL : $url");
    log('API token: ${apiHeader.headers}');

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Get User Transaction Response: ${response.body}');

      GetUserTransactionModel getUserTransactionModel =
          GetUserTransactionModel.fromJson(json.decode(response.body));
      isSuccessStatus = getUserTransactionModel.success.obs;

      if (isSuccessStatus.value) {
        transactionList = getUserTransactionModel.workerList;
        for (int i = 0; i < transactionList.length; i++) {
          orderDate = transactionList[i].orderDate;
          String bDate1 = orderDate.substring(0, orderDate.length - 17);
          orderDate1 = bDate1;
        }
        log("transactionList : ${transactionList.length}");
      } else {
        log("getTransactionListFunction Else Else");
      }
    } catch (e) {
      log("getTransactionListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getUserTransactionFunction();
  }
}
