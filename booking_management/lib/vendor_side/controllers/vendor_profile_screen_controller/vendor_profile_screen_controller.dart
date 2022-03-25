import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorProfileScreenController extends GetxController{
  RxString selectedDate = 'DOB'.obs;
  RxString slot = 'Single'.obs;
  GlobalKey<FormState> vendorProfileFormKey = GlobalKey<FormState>();
  final nameTextFieldController = TextEditingController(text: "abc");
  final emailTextFieldController = TextEditingController(text: "abc@gmail.com");
  final addressTextFieldController = TextEditingController(text: "1156, Lorem Soc.");
  final mobileTextFieldController = TextEditingController(text: "+1234567890");
  final cityTextFieldController = TextEditingController(text: "surat");
  final stateTextFieldController = TextEditingController(text: "Gujarat");
  final countryTextFieldController = TextEditingController(text: "India");
  var selectDatePageController = PageController(initialPage: 0, viewportFraction: 0.16);
  RxInt selectedPageIndex = 0.obs;
  //RxInt selectedTimeIndex = 0.obs;
  RxInt selectedDateIndex = 0.obs;
  RxString timeSlots = 'Hour'.obs;
  List<String> dateList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24' , '25', '26', '27', '28', '29', '30', '31'];

  selectDatePreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  selectDateNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }
}