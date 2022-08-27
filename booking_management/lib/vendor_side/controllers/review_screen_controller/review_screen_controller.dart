import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/user_details.dart';
import '../../model/review_screen_model/get_all_reviews_model.dart';

class ReviewScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<VendorReviewObject> reviewList = [];

  getAllReviewsFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllReviewApi +
        "?VendorId=${UserDetails.tableWiseId}"; // /*${UserDetails.tableWiseId}*/
    log("Get All Review List API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Review Response Body : ${response.body}");

      VendorAllReviewModel vendorAllReviewModel =
          VendorAllReviewModel.fromJson(json.decode(response.body));

      isSuccessStatus = vendorAllReviewModel.success.obs;

      if (isSuccessStatus.value) {
        reviewList.clear();
        reviewList = vendorAllReviewModel.workerList;

        log("reviewList : ${reviewList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getAllReviewsFunction Else Else");
      }

      /*var request = http.MultipartRequest('GET', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);
      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        log("value ::: $value");
        VendorAllReviewModel vendorAllReviewModel = VendorAllReviewModel.fromJson(json.decode(value));
        isSuccessStatus = vendorAllReviewModel.success.obs;

        if(isSuccessStatus.value) {
          reviewList.clear();
          reviewList = vendorAllReviewModel.workerList;

          log("reviewList : ${reviewList.length}");
        } else {
          Fluttertoast.showToast(msg: "Something went wrong!");
          log("getAllReviewsFunction Else Else");
        }

      });*/

    } catch (e) {
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
