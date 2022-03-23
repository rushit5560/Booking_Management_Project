import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileModule extends StatelessWidget {
  const ProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Image.asset(AppImages.vendorImg, scale: 2.5,)
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
    return const Text("Lorem Ipsum", style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),);
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
            SizedBox(width: 5,),
            Text("22-03-2022")
          ],
        ),
        SizedBox(width: 20,),
        Row(
          children: [
            Image.asset(AppImages.clockImg),
            SizedBox(width: 5,),
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
    return const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
      style: TextStyle(fontSize: 13, color: Colors.black),);
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
                child: Text("Service -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
            Expanded(
                flex: 3,
                child: Text("Lorem Ipsum has been the industry", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: const [
            Expanded(
                flex: 2,
                child: Text("Payment -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
            Expanded(
                flex: 3,
                child: Text("\$20",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: const [
            Expanded(
                flex: 2,
                child: Text("Payment Mode -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
            Expanded(
                flex: 3,
                child: Text("Credit Card",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
          ],
        ),
        const SizedBox(height: 15,),
        Row(
          children: const [
            Expanded(
                flex: 2,
                child: Text("Status -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
            Expanded(
                flex: 3,
                child: Text("Done",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
          ],
        ),
      ],
    );
  }
}
