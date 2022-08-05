import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/booking_details_screen_controller/booking_details_screen_controller.dart';
import 'package:booking_management/user_side/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileModule extends StatelessWidget {
  const ProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Image.asset(
          AppImages.vendorImg,
          scale: 2.5,
        ));
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
          margin: const EdgeInsets.only(top: 15, left: 20),
          child: Image.asset(AppImages.backArrowImg)),
    );
  }
}

class VendorName extends StatelessWidget {
  const VendorName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Lorem Ipsum",
      style: TextStyle(
          color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),
    );
  }
}

class BookingDateAndTime extends StatelessWidget {
  const BookingDateAndTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(AppImages.calenderImg),
            SizedBox(
              width: 5,
            ),
            Text("22-03-2022")
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Image.asset(AppImages.clockImg),
            SizedBox(
              width: 5,
            ),
            Text("2:00 PM")
          ],
        )
      ],
    );
  }
}

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
      style: TextStyle(fontSize: 13, color: Colors.black),
    );
  }
}

class BookingDetails extends StatelessWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
                flex: 2,
                child: Text(
                  "Service -",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Expanded(
                flex: 3,
                child: Text("Lorem Ipsum has been the industry",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: const [
            Expanded(
                flex: 2,
                child: Text(
                  "Payment -",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Expanded(
                flex: 3,
                child: Text("\$20",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: const [
            Expanded(
                flex: 2,
                child: Text(
                  "Payment Mode -",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Expanded(
                flex: 3,
                child: Text("Credit Card",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: const [
            Expanded(
                flex: 2,
                child: Text(
                  "Status -",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Expanded(
                flex: 3,
                child: Text("Done",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15)))
          ],
        ),
      ],
    );
  }
}

class VendorDetailsModule extends StatelessWidget {
  VendorDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookingDetailsScreenController>();

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
                screenController.appointDetailsData!.vendor.userName.toString(),
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

class BookingDetailsModule extends StatelessWidget {
  BookingDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<BookingDetailsScreenController>();

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
                screenController.appointDetailsData!.bookingFor,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                "Service Name :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: screenController.serviceList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Text(
                    screenController.serviceList[i],
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
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
