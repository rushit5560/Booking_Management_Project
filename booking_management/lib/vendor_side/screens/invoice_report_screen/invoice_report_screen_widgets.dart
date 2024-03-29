import 'dart:developer';

import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_invoice_list_screen/vendor_order_details_screen/vendor_invoice_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../controllers/invoice_report_screen_controller/invoice_report_screen_controller.dart';
import '../../model/invoice_report_screen_model/invoice_report_model.dart';

/// Start Date Select Module
class StartDateSelectModule extends StatelessWidget {
  StartDateSelectModule({Key? key}) : super(key: key);
  final screenController = Get.find<InvoiceReportScreenController>();

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

              screenController.isEndDateCalenderShow.value = false;

              log("screenController.isStartDateCalenderShow.value : ${screenController.isStartDateCalenderShow.value}");
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 10),
    ).commonSymmetricPadding(horizontal: 10);
  }
}

class SelectStartDateCalender extends StatelessWidget {
  SelectStartDateCalender({Key? key}) : super(key: key);
  final screenController = Get.find<InvoiceReportScreenController>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime(2020),
              lastDay: DateTime(2050),
              calendarFormat: format,
              rangeStartDay: DateTime.now(),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                selectedDay = selectDay;
                focusedDay = focusDay;

                screenController.selectedStartDate = selectedDay;

                screenController.startDate.value =
                    "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
                screenController.isStartDateCalenderShow.value =
                    !screenController.isStartDateCalenderShow.value;

                screenController.isEndDateCalenderShow.value = false;

                screenController.loadUI();
              },

              // Day Changed
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              // Style the Calender
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                outsideDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                defaultTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                weekendTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                selectedTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                todayTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                defaultDecoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.white),
                weekendDecoration: const BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.white),
                todayDecoration: const BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.transparent),
                selectedDecoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: AppColors.colorLightGrey1),
              ),
              // Week Style
              daysOfWeekStyle: const DaysOfWeekStyle(
                // dowTextFormatter: (dowTextFormat, dynamic) {
                //   return DateFormat.E(locale).format(dowTextFormat)[0];
                // },
                decoration: BoxDecoration(color: Colors.transparent),
                weekdayStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),

                weekendStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              // Month Style
              headerStyle: HeaderStyle(
                headerPadding: const EdgeInsets.only(top: 10, bottom: 10),
                formatButtonVisible: false,
                titleCentered: true,
                decoration: const BoxDecoration(color: Colors.white),
                formatButtonDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                leftChevronIcon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.black),
                rightChevronIcon: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// End Date Select Module
class EndDateSelectModule extends StatelessWidget {
  EndDateSelectModule({Key? key}) : super(key: key);
  final screenController = Get.find<InvoiceReportScreenController>();

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
            screenController.endDate.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          /// Calender Image Button
          GestureDetector(
            onTap: () {
              screenController.isEndDateCalenderShow.value =
                  !screenController.isEndDateCalenderShow.value;

              screenController.isStartDateCalenderShow.value = false;

              log("screenController.isEndDateCalenderShow.value : ${screenController.isEndDateCalenderShow.value}");
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ).commonSymmetricPadding(vertical: 12, horizontal: 10),
    ).commonSymmetricPadding(horizontal: 10);
  }
}

class SelectEndDateCalender extends StatelessWidget {
  SelectEndDateCalender({Key? key}) : super(key: key);
  final screenController = Get.find<InvoiceReportScreenController>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Select Date",
        //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // ),
        const SizedBox(height: 10),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: screenController.selectedStartDate,
              lastDay: DateTime(2050),
              calendarFormat: format,
              rangeStartDay: DateTime.now(),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                selectedDay = selectDay;
                focusedDay = focusDay;

                screenController.endDate.value =
                    "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";
                screenController.isEndDateCalenderShow.value =
                    !screenController.isEndDateCalenderShow.value;

                screenController.isStartDateCalenderShow.value = false;

                screenController.loadUI();
              },

              // Day Changed
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              // Style the Calender
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                outsideDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                defaultTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                weekendTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                selectedTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                todayTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                defaultDecoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.white),
                weekendDecoration: const BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.white),
                todayDecoration: const BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.transparent),
                selectedDecoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: AppColors.colorLightGrey1),
              ),
              // Week Style
              daysOfWeekStyle: const DaysOfWeekStyle(
                // dowTextFormatter: (dowTextFormat, dynamic) {
                //   return DateFormat.E(locale).format(dowTextFormat)[0];
                // },
                decoration: BoxDecoration(color: Colors.transparent),
                weekdayStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),

                weekendStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              // Month Style
              headerStyle: HeaderStyle(
                headerPadding: const EdgeInsets.only(top: 10, bottom: 10),
                formatButtonVisible: false,
                titleCentered: true,
                decoration: const BoxDecoration(color: Colors.white),
                formatButtonDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                leftChevronIcon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.black),
                rightChevronIcon: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Submit Button
class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);
  final screenController = Get.find<InvoiceReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.startDate.value == "Select Start Date") {
          Fluttertoast.showToast(msg: "Please select start date", toastLength: Toast.LENGTH_SHORT);
        } else if (screenController.endDate.value == "Select End Date") {
          Fluttertoast.showToast(msg: "Please select end date", toastLength: Toast.LENGTH_SHORT);
        } else {
          // await screenController.getFilterInvoiceReportFunction();
        }
      },
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

/// Invoice Report List
class AppointmentReportListModule extends StatelessWidget {
  AppointmentReportListModule({Key? key}) : super(key: key);
  final screenController = Get.find<InvoiceReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.invoiceReportList.isEmpty
        ? const Center(child: Text("No data available!"))
        : ListView.builder(
            itemCount: screenController.invoiceReportList.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) {
              InvoiceReportData singleItem =
                  screenController.invoiceReportList[i];
              return _appointmentListTile(singleItem);
            },
          ).commonAllSidePadding(10);
  }

  Widget _appointmentListTile(InvoiceReportData singleItem) {

    return GestureDetector(
      onTap: () {
        Get.to(
          () => VendorInvoiceDetailsScreen(),
          arguments: singleItem.id.toString(),
        );
      },
      child: Container(
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
            /// Booking id
            _bookingIdModule(singleItem),
            const SizedBox(height: 5),

            // Customer
            _customerModule(singleItem),
            const SizedBox(height: 5),

            // Email
            _emailModule(singleItem),
            const SizedBox(height: 5),

            // Mobile
            _mobileModule(singleItem),
            const SizedBox(height: 5),

            /// Transaction Date
            _dateModule(singleItem),
            const SizedBox(height: 5),

            // Price
            _priceModule(singleItem),
            const SizedBox(height: 5),

            // Transaction For
            _transactionForModule(singleItem),
            const SizedBox(height: 5),


          ],
        ).commonAllSidePadding(10),
      ),
    );
  }

  Widget _bookingIdModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Booking Id : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            "${singleItem.invoiceId}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _customerModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Customer : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.fullName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _emailModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Email : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.email,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _mobileModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Mobile No : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.mobile,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _dateModule(InvoiceReportData singleItem) {
    // final transactionDate = singleItem.transactionDate.split("T")[0];
    // final transactionTime = singleItem.transactionDate.split("T")[1].split(".")[0];

    DateTime date = DateTime.parse(singleItem.transactionDate);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Date : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date - ${date.day}/${date.month}/${date.year}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                // style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Time - ${date.hour}:${date.minute}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                // style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _priceModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Price : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.order.price.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _transactionForModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Transaction For : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.transactionFor,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }




}

class AppointmentReportSearchListModule extends StatelessWidget {
  AppointmentReportSearchListModule({Key? key}) : super(key: key);
  final screenController = Get.find<InvoiceReportScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.searchInvoiceReportList.isEmpty
        ? const Center(child: Text("No data available!"))
        : ListView.builder(
      itemCount: screenController.searchInvoiceReportList.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        InvoiceReportData singleItem =
        screenController.searchInvoiceReportList[i];
        return _appointmentListTile(singleItem);
      },
    ).commonAllSidePadding(10);
  }

  Widget _appointmentListTile(InvoiceReportData singleItem) {

    return GestureDetector(
      onTap: () {
        Get.to(
              () => VendorInvoiceDetailsScreen(),
          arguments: singleItem.id.toString(),
        );
      },
      child: Container(
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
            /// Booking id
            _bookingIdModule(singleItem),
            const SizedBox(height: 5),

            // Customer
            _customerModule(singleItem),
            const SizedBox(height: 5),

            // Email
            _emailModule(singleItem),
            const SizedBox(height: 5),

            // Mobile
            _mobileModule(singleItem),
            const SizedBox(height: 5),

            /// Transaction Date
            _dateModule(singleItem),
            const SizedBox(height: 5),

            // Price
            _priceModule(singleItem),
            const SizedBox(height: 5),

            // Transaction For
            _transactionForModule(singleItem),
            const SizedBox(height: 5),


          ],
        ).commonAllSidePadding(10),
      ),
    );
  }

  Widget _bookingIdModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Booking Id : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            "${singleItem.invoiceId}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _customerModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Customer : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.fullName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _emailModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Email : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.email,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _mobileModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Mobile No : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.mobile,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _dateModule(InvoiceReportData singleItem) {
    // final transactionDate = singleItem.transactionDate.split("T")[0];
    // final transactionTime = singleItem.transactionDate.split("T")[1].split(".")[0];

    DateTime date = DateTime.parse(singleItem.transactionDate);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Date : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date - ${date.day}/${date.month}/${date.year}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                // style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Time - ${date.hour}:${date.minute}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                // style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _priceModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Price : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.order.price.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _transactionForModule(InvoiceReportData singleItem) {
    return Row(
      children: [
        const Expanded(
          flex: 4,
          child: Text(
            "Transaction For : ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            singleItem.transactionFor,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }




}
