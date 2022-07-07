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


class VendorInvoiceListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<OrdersDatum> allInvoiceList = [];
  //OrderDetailsData? orderDetailsData;

  String customerUserName = "";

  /// Get All Order List
  getAllOrderListFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllOrdersApi + "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Order API URL : $url");

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Response Body : ${response.body}");

      GetAllInvoiceModel getAllInvoiceModel = GetAllInvoiceModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllInvoiceModel.success.obs;

      if(isSuccessStatus.value) {
        allInvoiceList.clear();

        allInvoiceList = getAllInvoiceModel.data;
        log("getAllOrdersModel : ${allInvoiceList.length}");

      } else {
        log("getAllOrderListFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }

    } catch(e) {
      log("getAllOrderListFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Order Details By Id
  getOrderDetailsByIdFunction({required int id}) async {
    isLoading(true);
    String url = ApiUrl.vendorOrderDetailsApi + "?id=$id";
    log("Order Details API URL : $url");
    log('apiHeader.headers: ${apiHeader.headers}');

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Order Details Response Body : ${response.body}");

      GetInvoiceDetailsModel getInvoiceDetailsModel = GetInvoiceDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getInvoiceDetailsModel.success.obs;
      log('isSuccessStatus: $isSuccessStatus');
      if(isSuccessStatus.value) {
        // orderDetailsData = getInvoiceDetailsModel.workerList;
        // log("orderDetailsData : $orderDetailsData");

        // Customer
        customerUserName = getInvoiceDetailsModel.workerList.customer.userName;
        log('customerUserName: $customerUserName');

      } else {
        log("getOrderDetailsByIdFunction Else Else");
      }

    } catch(e) {
      log("getOrderDetailsByIdFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAllOrderListFunction();
    super.onInit();
  }

}