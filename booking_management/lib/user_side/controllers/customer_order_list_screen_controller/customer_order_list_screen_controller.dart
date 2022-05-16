import 'package:get/get.dart';

class CustomerOrderListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List allOrderList = [];
}