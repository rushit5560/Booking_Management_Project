import 'package:booking_management/common/constants/app_images.dart';
import 'package:booking_management/common/field_validation.dart';
import 'package:booking_management/controllers/vendor_details_screen_controller/vendor_details_screen_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

VendorDetailsScreenController screenController = Get.find<VendorDetailsScreenController>();

class ProfileModule extends StatelessWidget {
  const ProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
          margin: EdgeInsets.only(top: 15, left: 20),
          child: Image.asset(AppImages.backArrowImg)),
    );
  }
}


class VendorName extends StatelessWidget {
  const VendorName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Lorem Ipsum", style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.bold),);
  }
}

class Ratting extends StatelessWidget {
  const Ratting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("4.5", style: TextStyle(fontSize: 17),),
        const SizedBox(width: 4,),
        RatingBar.builder(
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 28,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            if (kDebugMode) {
              print(rating);
            }
          },
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

class PriceAndLocation extends StatelessWidget {
  const PriceAndLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              flex: 1,
                child: Text("Price -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
            Expanded(
                flex: 3,
                child: Text("\$20 - \$30/Day", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: const [
            Expanded(
                flex: 1,
                child: Text("Location -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),)),
            Expanded(
                flex: 3,
                child: Text("1156, Lorem Soc. simply dummy text of the printing scram printer",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)))
          ],
        ),
      ],
    );
  }
}

class ViewMapButtonModule extends StatelessWidget {
  const ViewMapButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 5,
                color: Colors.grey.shade300,
                blurStyle: BlurStyle.outer,
              ),
            ]
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            'View Map',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewTextFieldAndButtonModule extends StatelessWidget {
  const ReviewTextFieldAndButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.reviewFormKey,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child:  TextFormField(
                controller: screenController.reviewFieldController,
                keyboardType: TextInputType.text,
                validator: (value) => FieldValidator().validateReview(value!),
                decoration: const InputDecoration(
                    hintText: "Add Review",
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    errorBorder:
                    UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder:
                    UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                ),
              ),
          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if(screenController.reviewFormKey.currentState!.validate()){}
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 5,
                        color: Colors.grey.shade300,
                        blurStyle: BlurStyle.outer,
                      ),
                    ]
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'SEND',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BookAppointmentButtonModule extends StatelessWidget {
  const BookAppointmentButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.shade300,
                  blurStyle: BlurStyle.outer,
                ),
              ]
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'BOOK APPOINTMENT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
