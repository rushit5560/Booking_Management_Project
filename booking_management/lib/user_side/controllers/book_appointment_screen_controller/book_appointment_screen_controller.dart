import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentScreenController extends GetxController{

  var selectDatePageController = PageController(initialPage: 0, viewportFraction: 0.16);
  RxInt selectedPageIndex = 0.obs;
  RxString payment = 'Credit'.obs;
  RxInt selectedTimeIndex = 0.obs;
  RxInt selectedDateIndex = 0.obs;
  //List<String> serviceLists = ['2.5 Km', '2.5 Km', '2.5 Km', '2.5 Km'];
  List<String> dateList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
    '21', '22', '23', '24' , '25', '26', '27', '28', '29', '30', '31'];
  List<String> timeList = [
    '10:00 AM',
    '11:00 AM',
    '11:15 AM',
    '11:35 AM',
    '12:00 AM',
    '12:05 AM',
    '01:20 AM',
    '01:40 AM',
  ];


  selectDatePreviousClick({required PageController pageController}) {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  selectDateNextClick({required PageController pageController}) {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   tappedIndex = 0.obs;
  // }
}