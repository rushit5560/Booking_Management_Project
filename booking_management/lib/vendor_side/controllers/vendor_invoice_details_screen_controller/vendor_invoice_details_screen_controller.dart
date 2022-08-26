import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/vendor_side/model/vendor_invoice_list_screen_models/get_invoice_details_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:get/get.dart';

import '../../model/vendor_invoice_list_screen_models/get_all_invoice_model.dart';

class VendorInvoiceDetailsScreenController extends GetxController {
  String bookingId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<OrdersDatum> allInvoiceList = [];
  //OrderDetailsData? orderDetailsData;

  String customerUserName = "";
  String customerEmail = "";
  String customerPhoneNumber = "";

  String vendorUserName = "";
  String vendorEmail = "";
  String vendorPhoneNumber = "";

  String bookedDate = "";
  List<String> descriptionList = [];
  WorkerList orderList = WorkerList();

  /// Order Details By Id
  getOrderDetailsByIdFunction() async {
    log("bookingidd is : $bookingId");
    isLoading(true);
    String url = ApiUrl.vendorOrderDetailsApi + "?id=$bookingId";
    log("Order Details API URL : $url");
    log('apiHeader.headers: ${apiHeader.headers}');

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Order Details Response Body : ${response.body}");

      GetInvoiceDetailsModel getInvoiceDetailsModel =
          GetInvoiceDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getInvoiceDetailsModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');
      if (isSuccessStatus.value) {
        // orderDetailsData = getInvoiceDetailsModel.workerList;
        // log("orderDetailsData : $orderDetailsData");
        descriptionList = getInvoiceDetailsModel.list;
        orderList = getInvoiceDetailsModel.workerList;

        // Customer
        customerUserName = getInvoiceDetailsModel.workerList.firstName!;
        customerEmail = getInvoiceDetailsModel.workerList.email!;
        customerPhoneNumber = getInvoiceDetailsModel.workerList.phoneNo!;
        log('customerUserName: $customerUserName');

        // Vendor
        vendorUserName = getInvoiceDetailsModel.workerList.vendor!.businessName;
        vendorEmail = getInvoiceDetailsModel.workerList.vendor!.email;
        vendorPhoneNumber = getInvoiceDetailsModel.workerList.vendor!.phoneNo;

        bookedDate = getInvoiceDetailsModel.workerList.startDateTime!;
      } else {
        log("getOrderDetailsByIdFunction Else Else");
      }
    } catch (e) {
      log("getOrderDetailsByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getOrderDetailsByIdFunction();
    super.onInit();
  }
}
