import 'dart:developer';

import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/appointment_report_screen_controller/appointment_report_screen_controller.dart';
import '../../model/appointment_report_screen_model/appointment_report_model.dart';



// final screenController = Get.find<AppointmentReportScreenController>();

class StatusDropDownModule extends StatelessWidget {
  StatusDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 3),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorLightGrey.withOpacity(0.5),
            blurRadius: 5,
            //spreadRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.grey.shade100,
            // background color for the dropdown items
            buttonTheme: ButtonTheme.of(context).copyWith(
              alignedDropdown:
              true, //If false (the default), then the dropdown's menu will be wider than its button.
            )),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            icon: Image.asset(AppImages.dropDownArrowImg, scale: 3),
            isExpanded: true,
            focusColor: Colors.white,
            value: screenController.selectedDDValue.value,
            //elevation: 5,
            // style: TextStyle(color: AppColors.colorLightGrey),
            iconEnabledColor: Colors.black,
            items: screenController.statusList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  // style: TextStyle(color: AppColors.colorLightGrey),
                ),
              );
            }).toList(),
            // hint: const Text(
            //   "Ratting",
            //   style: TextStyle(color: Colors.black, fontSize: 11),
            // ),
            onChanged: (newValue) {
              screenController.isLoading(true);
              screenController.selectedDDValue.value = newValue!;
              screenController.isLoading(false);
              // if (screenController.searchType == SearchType.categoryWise) {
              //   await screenController.getSearchCategoryWithRatingWiseFunction();
              // } else if (screenController.searchType == SearchType.none) {
              //   await screenController.getAllSearchVendorListRatingWiseFunction(searchText: screenController.categoryFieldController.text);
              // }
            },
          ),
        ),
      ),
    ).commonAllSidePadding(10);
  }
}

class StartDateSelectModule extends StatelessWidget {
  StartDateSelectModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorLightGrey,
            blurRadius: 5,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// Show Date as Text
          Text(
            screenController.startDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          /// Calender Image Button
          GestureDetector(
            onTap: () {
              screenController.isStartDateCalenderShow.value =
              !screenController.isStartDateCalenderShow.value;

              log("screenController.isCalenderShow.value : ${screenController.isStartDateCalenderShow.value}");
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 10),
    ).commonSymmetricPadding(horizontal: 10);
  }
}



class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  // spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ]),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Submit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ).commonSymmetricPadding(horizontal: 15),
    );
  }
}



/// Appointment Report List
class AppointmentReportListModule extends StatelessWidget {
  AppointmentReportListModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.appointmentReportList.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        AppointmentItem singleItem = screenController.appointmentReportList[i];
        return _appointmentListTile(singleItem);
      },
    ).commonAllSidePadding(10);
  }

  Widget _appointmentListTile(AppointmentItem singleItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17, left: 5, right: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                "Booking Id : ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  singleItem.bookingId,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                            "Vendor :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            singleItem.vendor.businessName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "Customer :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            singleItem.customer.userName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "Start Time :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            singleItem.startDateTime,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          "End Time :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            singleItem.endDateTime,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${singleItem.bookingItems.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${singleItem.bookingItems.quantity}",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    singleItem.status,
                    style: const TextStyle(
                       fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(width: 5),
          // _viewButton(),
        ],
      ).commonAllSidePadding(10),
    );
  }

}


