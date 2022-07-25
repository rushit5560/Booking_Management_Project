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
  String customerEmail = "";
  String customerPhoneNumber = "";

  String vendorUserName = "";
  String vendorEmail = "";
  String vendorPhoneNumber = "";

  int orderId = 0;
  List<String> descriptionList = [];
  WorkerList orderList = WorkerList();

  /// Get All Order List
  getAllOrderListFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorGetAllOrdersApi + "?VendorId=${UserDetails.tableWiseId}";
    log("Get All Order API URL : $url");
    log('header: ${apiHeader.headers}');

    try {
      http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("Response Body : ${response.body}");

      GetAllInvoiceModel getAllInvoiceModel = GetAllInvoiceModel.fromJson(json.decode(response.body));
      isSuccessStatus = getAllInvoiceModel.success.obs;

      if(isSuccessStatus.value) {
        allInvoiceList.clear();

        allInvoiceList = getAllInvoiceModel.data;
        for(int i=0; i < allInvoiceList.length; i++){

        }
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
        descriptionList = getInvoiceDetailsModel.list;
        orderList= getInvoiceDetailsModel.workerList;


        // Customer
        customerUserName = getInvoiceDetailsModel.workerList.customer!.userName;
        customerEmail = getInvoiceDetailsModel.workerList.customer!.email;
        customerPhoneNumber = getInvoiceDetailsModel.workerList.customer!.phoneNo;
        log('customerUserName: $customerUserName');

        // Vendor
        vendorUserName = getInvoiceDetailsModel.workerList.vendor!.userName;
        vendorEmail = getInvoiceDetailsModel.workerList.vendor!.email;
        vendorPhoneNumber = getInvoiceDetailsModel.workerList.vendor!.phoneNo;

        orderId = getInvoiceDetailsModel.workerList.id!;

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