import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/model/book_appointment_screen_model/get_booking_resources_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_logos.dart';
import '../../controllers/vendor_home_screen_controller/vendor_home_screen_controller.dart';
import '../../model/vendor_appointment_list_screen_models/appointment_list_model.dart';
import '../appointment_details_screen/appointment_details_screen.dart';

/// Header Module
class VendorHeaderModule extends StatelessWidget {
  VendorHeaderModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.15,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: Get.height * 0.15,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.shapeImg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.07,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(AppLogo.homeLogo),
                scale: 0.9,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Icon(
                Icons.menu_rounded,
                color: Colors.grey.shade600,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchAppointmentField extends StatelessWidget {
  SearchAppointmentField({Key? key}) : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 8,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: TextFormField(
        controller: screenController.searchAppointmentFieldController,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintText: 'Search Appointment',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class PendingListTextModule extends StatelessWidget {
  final String text;
  final double size;
  PendingListTextModule({Key? key, required this.text, required this.size})
      : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class TodayAppointmentListModule extends StatelessWidget {
  TodayAppointmentListModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return screenController.allAppointmentList.isEmpty
        ? const Center(
            child: Padding(
            padding: EdgeInsets.symmetric(vertical: 45),
            child: Text("No Record Found"),
          ))
        : ListView.builder(
            itemCount: screenController.allAppointmentList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              AppointmentListModule singleItem =
                  screenController.allAppointmentList[i];
              return _pendingListTile(singleItem);
            },
          );
  }

  Widget _pendingListTile(AppointmentListModule singleItem) {
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
          _userNameModule(singleItem),
          const SizedBox(height: 8),
          _userEmailModule(singleItem),
          const SizedBox(height: 8),
          _dateAndTimeModule(singleItem),
          const SizedBox(height: 8),
          _statusModule(singleItem),
          const SizedBox(height: 8),
          _userPaidAmountModule(singleItem),
        ],
      ).commonAllSidePadding(10),
    );
  }

  /*Widget _userImageModule(AppointmentListModule singleItem) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      //child: Image.network(ApiUrl.apiMainPath + screenController.pendingList[i].customerBooking.image),
      child: Image.network(singleItem.customer., scale: 15,),
    );
  }*/

  Widget _userNameModule(AppointmentListModule singleItem) {
    return Text(
      singleItem.firstName,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _userEmailModule(AppointmentListModule singleItem) {
    return Text(
      singleItem.email,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _userPaidAmountModule(AppointmentListModule singleItem) {
    return Text(
      singleItem.price,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dateAndTimeModule(AppointmentListModule singleItem) {
    return Row(
      children: [
        Image.asset(
          AppImages.dateImg,
          height: 11,
          width: 11,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          singleItem.startDateTime,
          style: const TextStyle(fontSize: 9),
        ),

        // const SizedBox(width: 10),
        //
        // Image.asset(
        //   AppImages.timeImg,
        //   height: 11,
        //   width: 11,
        //   fit: BoxFit.cover,
        // ),
        // const SizedBox(width: 5),
        // Text(
        //   time,
        //   style: const TextStyle(fontSize: 9),
        // ),
      ],
    );
  }

  Widget _statusModule(AppointmentListModule singleItem) {
    return Text(
      "Status - ${singleItem.status}",
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /*Widget _viewButton(AppointmentListModule singleItem) {
    return GestureDetector(
      onTap: () => Get.to(() => AppointmentDetailsScreen(),
          //arguments: singleItem.bookingId,
          arguments: [
            singleItem.bookingId,
            singleItem.status,
            singleItem.id
          ],

          transition: Transition.zoom),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 2,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'View',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }*/

/*Widget _confirmButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
          'Confirm',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

    );
  }*/

}

class ResourcesModule extends StatelessWidget {
  ResourcesModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorHomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.allResourcesList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        BookingResourceWorkerData singleItem =
            screenController.allResourcesList[i];
        return _resourcesListTile(singleItem);
      },
    );
  }

  Widget _resourcesListTile(BookingResourceWorkerData singleItem) {
    String imgUrl = ApiUrl.apiImagePath + singleItem.image;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                // decoration: BoxDecoration(
                //     // image: DecorationImage(
                //     //   image: NetworkImage(imgUrl),
                //     //   fit: BoxFit.cover,
                //     // ),
                //     ),
                child: Image.network(
                  imgUrl,
                  errorBuilder: (context, st, ob) {
                    return Image.asset(AppImages.logoImg);
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      singleItem.resourceName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Html(
                      data: singleItem.details,
                      shrinkWrap: true,
                    ),
                    // Text(
                    //   singleItem.details,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    const SizedBox(height: 5),
                    Text(
                      "\$${singleItem.price}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // screenController.isPriceDisplay.value
                    //     ? Text(
                    //   "\$${singleItem.price}",
                    //   maxLines: 2,
                    //   overflow: TextOverflow.ellipsis,
                    // )
                    //     : Container(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          singleItem.timingList.isEmpty
              ? Row(
                  children: const [
                    Text("Time slot is not available."),
                  ],
                )
              : GridView.builder(
                  itemCount: singleItem.timingList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 5),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () async {
                        log('booking: ${singleItem.timingList[i].id}');
                        if (singleItem.timingList[i].booking == false) {
                          await screenController.getBookingDetailsFunction(
                            bookingId: singleItem.timingList[i].id.toString(),
                          );
                          _bottomSheetModule(context);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: Colors.grey.shade300,
                                blurStyle: BlurStyle.outer,
                              ),
                            ],
                            color: singleItem.timingList[i].booking == false
                                ? Colors.orangeAccent
                                : null),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              singleItem.timingList[i].startDateTime,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: singleItem.timingList[i].isSelected ==
                                          true
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color:
                                    singleItem.timingList[i].isSelected == true
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ).commonSymmetricPadding(horizontal: 5),
                            Text(
                              singleItem.timingList[i].endDateTime,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color:
                                    singleItem.timingList[i].isSelected == true
                                        ? Colors.white
                                        : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ).commonAllSidePadding(3),
                    );
                  },
                ),
        ],
      ).commonAllSidePadding(8),
    ).commonSymmetricPadding(vertical: 8);
  }

  Future _bottomSheetModule(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Slot Details",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1),
                  _singleItemModule(
                      heading: "Customer Name:",
                      value: screenController.customerName),
                  const SizedBox(height: 5),
                  _singleItemModule(
                      heading: "Vendor Name:",
                      value: screenController.vendorName),
                  const SizedBox(height: 5),
                  _singleItemModule(
                      heading: "Details:", value: screenController.details),
                  const SizedBox(height: 5),
                  const Text(
                    "Service Name:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  ListView.builder(
                    itemCount: screenController.serviceName.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Text(
                        screenController.serviceName[i],
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  _singleItemModule(
                      heading: "Availability:",
                      value: screenController.availability),
                  const SizedBox(height: 5),
                  _singleItemModule(
                      heading: "Paid Amount:",
                      value: screenController.amountPaid),
                ],
              ),
            ),
          );
        });
  }

  Widget _singleItemModule({required String heading, required String value}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        // const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ],
    );
  }
}
