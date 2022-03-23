import 'package:get/get.dart';

import '../../screens/user_side_screens/home_screen/home_screen.dart';
import '../../screens/user_side_screens/vendor_list_screen/vendor_list_screen.dart';


class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxInt currentSelectedIndex = 0.obs;
  final tabs = [HomeScreen(), VendorListScreen(), HomeScreen(), HomeScreen()];
  RxInt menuIndex = 0.obs;
}