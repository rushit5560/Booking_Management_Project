import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_appointment_details_screen_controller/user_appointment_details_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserVendorDetailsModule extends StatelessWidget {
  UserVendorDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserAppointmentDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Vendor Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            const Expanded(
              child: Text(
                "Business Name :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointDetailsData!.vendor.businessName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        Row(
          children: [
            const Expanded(
              child: Text(
                "Address :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointDetailsData!.vendor.address,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        Row(
          children: [
            const Expanded(
              child: Text(
                "Mobile Number :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointDetailsData!.vendor.phoneNo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ],
    ).commonAllSidePadding(10);
  }
}

class UserBookingDetailsModule extends StatelessWidget {
  UserBookingDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserAppointmentDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Booking Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),

        Row(
          children: [
            const Expanded(
              child: Text(
                "Resource Name :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                screenController.resourceName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const Expanded(
        //       child: Text(
        //         "Service Name :",
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     Expanded(
        //       child: ListView.builder(
        //         itemCount: screenController.serviceList.length,
        //         shrinkWrap: true,
        //         physics: const NeverScrollableScrollPhysics(),
        //         itemBuilder: (context, i) {
        //           return Text(
        //             screenController.serviceList[i],
        //             style: const TextStyle(fontWeight: FontWeight.w400),
        //           );
        //         },
        //
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 5),

        Row(
          children: [
            const Expanded(
              child: Text(
                "Date Time :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointDetailsData!.startDateTime,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        Row(
          children: [
            const Expanded(
              child: Text(
                "Booking Status :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointDetailsData!.status,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

      ],
    ).commonAllSidePadding(10);
  }
}