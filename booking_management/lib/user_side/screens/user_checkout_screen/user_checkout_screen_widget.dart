import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';




/// Booking Summary
class BookingSummaryModule extends StatelessWidget {
  BookingSummaryModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserCheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 35,
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(ApiUrl.apiMainPath + screenController.vendorImg,),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 65,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      screenController.vendorName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),

                  RatingBar.builder(
                    initialRating: screenController.vendorRating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    ignoreGestures: true,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const SizedBox(height: 5),

                  Text(
                    screenController.vendorAddress,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Personal Info Form
class PersonalInformationFormModule extends StatelessWidget {
  PersonalInformationFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserCheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.checkOutFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: screenController.fNameFieldController,
            keyboardType: TextInputType.text,
            validator: (value) => FieldValidator().validateFirstName(value!),
            decoration: checkoutFormFieldDecoration(hintText: 'First Name'),
          ),

          const SizedBox(height: 5),
          TextFormField(
            controller: screenController.emailFieldController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => FieldValidator().validateEmail(value!),
            decoration: checkoutFormFieldDecoration(hintText: 'Email'),
          ),

          const SizedBox(height: 5),
          TextFormField(
            controller: screenController.phoneFieldController,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            validator: (value) => FieldValidator().validateMobile(value!),
            decoration: checkoutFormFieldDecoration(hintText: 'Mobile No'),
          ),

          const SizedBox(height: 5),
          TextFormField(
            controller: screenController.notesFieldController,
            keyboardType: TextInputType.text,
            // validator: (value) => FieldValidator().validateNotes(value!),
            decoration: checkoutFormFieldDecoration(hintText: 'Notes'),
          ),

          // const SizedBox(height: 10),


        ]
      ),
    );
  }



}



/// Confirm And Pay Button
class ConfirmAndPayButtonModule extends StatelessWidget {
  ConfirmAndPayButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserCheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(screenController.checkOutFormKey.currentState!.validate()) {
            await screenController.checkOutSubmitFunction();
        }
      },
      child: Container(
        alignment: Alignment.center,
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
              'Confirm And Pay',
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




// class SelectPaymentMethod extends StatelessWidget {
//   const SelectPaymentMethod({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Select Payment Method", style: TextStyle(
//             color: Colors.black, fontWeight: FontWeight.bold
//         ),),
//         const SizedBox(height: 10,),
//
//         Obx(()=>
//             Container(
//               //height: 55,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
//               ),
//               child: ListTile(
//                 trailing: Radio<String>(
//                   value: 'Credit/Debit Card',
//                   activeColor: AppColors.colorLightGrey,
//                   groupValue: screenController.payment.value,
//                   onChanged: (value) {
//                     //setState(() {
//                     screenController.payment.value = value!;
//                     // });
//                   },
//                 ),
//                 title: const Text('Credit/Debit Card', style: TextStyle(color: Colors.black, fontSize: 15),),
//               ),
//             ),
//         ),
//         const SizedBox(height: 10,),
//         Obx(()=>
//             Container(
//               //height: 55,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
//               ),
//               child: ListTile(
//                 trailing: Radio<String>(
//                   value: 'UPI',
//                   activeColor: AppColors.colorLightGrey,
//                   groupValue: screenController.payment.value,
//                   onChanged: (value) {
//                     //setState(() {
//                     screenController.payment.value = value!;
//                     // });
//                   },
//                 ),
//                 title: const Text('UPI', style: TextStyle(color: Colors.black, fontSize: 15),),
//               ),
//             ),
//         ),
//
//         const SizedBox(height: 10,),
//         Obx(()=>
//             Container(
//               //height: 55,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
//               ),
//               child: ListTile(
//                 trailing: Radio<String>(
//                   value: 'Paypal',
//                   activeColor: AppColors.colorLightGrey,
//                   groupValue: screenController.payment.value,
//                   onChanged: (value) {
//                     //setState(() {
//                     screenController.payment.value = value!;
//                     // });
//                   },
//                 ),
//                 title: const Text('Paypal', style: TextStyle(color: Colors.black, fontSize: 15),),
//               ),
//             ),
//         ),
//
//         // const SizedBox(height: 10,),
//         // Obx(()=>
//         //     Container(
//         //       //height: 55,
//         //       decoration: BoxDecoration(
//         //           borderRadius: BorderRadius.circular(15),
//         //           border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
//         //       ),
//         //       child: ListTile(
//         //         trailing: Radio<String>(
//         //           value: 'Cash',
//         //           activeColor: AppColors.colorLightGrey,
//         //           groupValue: screenController.payment.value,
//         //           onChanged: (value) {
//         //             //setState(() {
//         //             screenController.payment.value = value!;
//         //             // });
//         //           },
//         //         ),
//         //         title: const Text('Cash', style: TextStyle(color: Colors.black, fontSize: 15),),
//         //       ),
//         //     ),
//         // )
//       ],
//     );
//   }
// }