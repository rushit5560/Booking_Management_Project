import 'package:booking_management/user_side/screens/business_list_screen/business_list_screen.dart';
import 'package:get/get.dart';

import '../../screens/home_screen/home_screen.dart';


class IndexScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxInt currentSelectedIndex = 0.obs;
  final tabs = [HomeScreen(), BusinessListScreen(), HomeScreen(), HomeScreen()];
  RxInt menuIndex = 0.obs;
}