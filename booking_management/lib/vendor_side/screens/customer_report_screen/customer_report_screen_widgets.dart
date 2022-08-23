import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/model/customer_report_screen_model/customer_report_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/customer_report_screen_controller/customer_report_screen_controller.dart';

/// Status DD Module
class StatusDropDownModule extends StatelessWidget {
  StatusDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<CustomerReportScreenController>();

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
            value: screenController.selectedStatusValue.value,
            //elevation: 5,
            // style: TextStyle(color: AppColors.colorLightGrey),
            iconEnabledColor: Colors.black,
            items: screenController.statusList
                .map<DropdownMenuItem<String>>((String value) {
              String finalValue =
                  value == "AllCustomer" ? "All Customer" : value;
              return DropdownMenuItem<String>(
                value: value,
                child: Text(finalValue),
              );
            }).toList(),
            onChanged: (newValue) async {
              // screenController.isLoading(true);
              screenController.selectedStatusValue.value = newValue!;
              // screenController.isLoading(false);

              if (screenController.selectedStatusValue.value == "AllCustomer") {
                await screenController.getCustomerReportFunction();
              } else {
                await screenController.getFilterCustomerReportFunction(
                    status: screenController.selectedStatusValue.value);
              }
            },
          ),
        ),
      ),
    ).commonAllSidePadding(10);
  }
}

/// Customer Report List
class CustomerReportListModule extends StatelessWidget {
  CustomerReportListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CustomerReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.customerReportList.isEmpty
        ? const Center(child: Text("No data available!"))
        : ListView.builder(
            itemCount: screenController.customerReportList.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              CustomerReportData singleItem =
                  screenController.customerReportList[i];

              print(singleItem.email);
              print(singleItem.firstName);
              print(singleItem.phoneNo);
              // print(singleItem.customer.userName);
              // print(singleItem.customer.phoneNo);
              return _appointmentListTile(singleItem);
            },
          ).commonAllSidePadding(10);
  }

  Widget _appointmentListTile(CustomerReportData singleItem) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  "Customer :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 7,
                child: Text(
                  singleItem.firstName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  "Email :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 7,
                child: Text(
                  singleItem.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  "Phone No :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 7,
                child: Text(
                  singleItem.phoneNo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ).commonAllSidePadding(10),
    );
  }
}
