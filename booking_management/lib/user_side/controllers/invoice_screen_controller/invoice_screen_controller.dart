import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:get/get.dart';

import '../../model/invoice_details_screen_model/invoice_details_model.dart';

class InvoiceScreenController extends GetxController {
  /// From Booking Success Screen
  String orderId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  // ApiHeader apiHeader = ApiHeader();

  bool isService = false;

  // int transactionId = 0;
  InvoiceDetailsData invoiceDetailsData = InvoiceDetailsData();
  String cstName = "";
  String cstEmail = "";
  String cstPhoneNo = "";

  List<String> descriptionList = [];

  getInvoiceDetailsFunction() async {
    isLoading(true);
    String url = ApiUrl.invoiceDetailsApi + "?id=$orderId";
    log("Invoice Details API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Invoice Details API Response : ${response.body}");

      InvoiceDetailsModel invoiceDetailsModel =
          InvoiceDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = invoiceDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        invoiceDetailsData = invoiceDetailsModel.workerList;
        descriptionList = invoiceDetailsModel.list;

        cstName = "${invoiceDetailsModel.workerList.firstName}";
        cstEmail = "${invoiceDetailsModel.workerList.email}";
        cstPhoneNo = "${invoiceDetailsModel.workerList.phoneNo}";
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getInvoiceDetailsFunction Else Else");
      }
    } catch (e) {
      log("getInvoiceDetailsFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getInvoiceDetailsFunction();
    super.onInit();
  }
}
