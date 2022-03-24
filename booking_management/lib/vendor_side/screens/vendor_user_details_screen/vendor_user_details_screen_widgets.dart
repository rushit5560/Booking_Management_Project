import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_images.dart';
import '../../../common_modules/container_decorations.dart';

class UserImageModule extends StatelessWidget {
  const UserImageModule({Key? key}) : super(key: key);

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
  const UserDetailsModule({Key? key}) : super(key: key);

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


class ConfirmAppointmentButtonModule extends StatelessWidget {
  const ConfirmAppointmentButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadowDecoration(),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        child: Text(
          'Confirm Appointment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}

class BackButtonModule extends StatelessWidget {
  const BackButtonModule({Key? key}) : super(key: key);

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
