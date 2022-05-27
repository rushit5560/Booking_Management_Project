import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/controllers/vendor_appointment_list_screen_controller/vendor_appointment_list_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/container_decorations.dart';
import '../../controllers/appointment_details_screen_controller/appointment_details_screen_controller.dart';


class UserImageModule extends StatelessWidget {
  UserImageModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        image: DecorationImage(
          image: AssetImage(AppImages.vendorImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class UserDetailsModule extends StatelessWidget {
  UserDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Lorem Ipsum',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            Image.asset(
              AppImages.dateImg,
              height: 15,
              width: 15,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            const Text(
              '23-30-2022',
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(width: 15),

            Image.asset(
              AppImages.timeImg,
              height: 15,
              width: 15,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            const Text(
              '2:00 PM',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Row(
          children: const [
            Expanded(
              flex: 25,
              child: Text(
                'Service -',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            Expanded(
              flex: 75,
              child: Text(
                'Lorem Ipsum has been the industry',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Row(
          children: const [
            Expanded(
              flex: 25,
              child: Text(
                'Payment -',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            Expanded(
              flex: 75,
              child: Text(
                'Done',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        Row(
          children: const [
            Expanded(
              flex: 25,
              child: Text(
                'Status -',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            Expanded(
              flex: 75,
              child: Text(
                'Pending',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

      ],
    ).commonSymmetricPadding(horizontal: 30, vertical: 20);
  }
}

/// Confirm Button
class ConfirmAppointmentButtonModule extends StatelessWidget {
  ConfirmAppointmentButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentDetailsScreenController>();
  final vendorAppointmentListScreenController = Get.find<VendorAppointmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.confirmAppointmentByIdFunction();
        await vendorAppointmentListScreenController.getAppointmentListFunction();
      },
      child: Container(
        decoration: shadowDecoration(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child: Text(
            'Confirm Appointment',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}

/// Cancel Button
class CancelAppointmentButtonModule extends StatelessWidget {
  CancelAppointmentButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentDetailsScreenController>();
  final vendorAppointmentListScreenController = Get.find<VendorAppointmentListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.cancelAppointmentByIdFunction();
        await vendorAppointmentListScreenController.getAppointmentListFunction();
      },
      child: Container(
        decoration: shadowDecoration(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child: Text(
            'Cancel Appointment',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}

/// Back Button
class BackButtonModule extends StatelessWidget {
  BackButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: SizedBox(
        height: 20,
          width: 20,
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Image.asset(AppImages.backArrowImg, fit: BoxFit.fill),
          )),
    );
  }
}

/// Customer Details
class CustomerDetailsModule extends StatelessWidget {
  CustomerDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Customer Details",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            const Expanded(
              child: Text(
                "Customer Name :",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointmentDetailsData.customer!.userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        Row(
          children: [
            const Expanded(
              child: Text(
                  "Email :",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointmentDetailsData.customer!.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointmentDetailsData.customer!.phoneNo,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),

        Row(
          children: [
            const Expanded(
              child: Text(
                  "Gender :",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointmentDetailsData.customer!.gender,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}


class ServiceDetailsModule extends StatelessWidget {
  ServiceDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<AppointmentDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Service Details",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),

        Row(
          children: [
            const Expanded(
              child: Text(
                "Service Name :",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: screenController.appointmentDetailsData.serviceName!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Text(
                    screenController.appointmentDetailsData.serviceName![i],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointmentDetailsData.startDateTime!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                screenController.appointmentDetailsData.status!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}