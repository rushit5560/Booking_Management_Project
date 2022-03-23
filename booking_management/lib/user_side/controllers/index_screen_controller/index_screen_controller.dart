import 'package:get/get.dart';


class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxInt currentSelectedIndex = 0.obs;
  RxInt menuIndex = 0.obs;
}