import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../model/review_screen_model/get_all_reviews_model.dart';

class ReviewScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<ReviewWorkerList> reviewList = [];

  getAllReviewsFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllReviewApi + "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Review List API URL : $url");

    try {
      var request = http.MultipartRequest('GET', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);
      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value ::: $value");
        GetAllReviewModel getAllReviewModel = GetAllReviewModel.fromJson(json.decode(value));
        isSuccessStatus = getAllReviewModel.success.obs;

        if(isSuccessStatus.value) {
          reviewList.clear();
          reviewList = getAllReviewModel.workerList;

          log("reviewList : ${reviewList.length}");
        } else {
          Fluttertoast.showToast(msg: "Something went wrong!");
          log("getAllReviewsFunction Else Else");
        }

      });
    } catch(e) {
      log("getAllReviewsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getAllReviewsFunction();
    super.onInit();
  }
}