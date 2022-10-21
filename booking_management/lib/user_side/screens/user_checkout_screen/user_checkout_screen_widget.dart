import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:booking_management/user_side/screens/user_card_payment_screen/user_card_payment_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';

/// Booking Summary
class BookingSummaryModule extends StatelessWidget {
  BookingSummaryModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserCheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    String imgUrl = ApiUrl.apiImagePath + screenController.vendorImg;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            // color: Colors.black
            ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 35,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                      // image: DecorationImage(
                      //   image: NetworkImage(imgUrl),
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  child:
                      Image.network(imgUrl, errorBuilder: (context, error, st) {
                    return Image.asset(AppImages.logoImg);
                  }),
                ),
              ),
              const SizedBox(width: 10),
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

                    // Text(
                    //   screenController.vendorAddress,
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 16,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Date",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              Text(screenController.bookingDate),
            ],
          ).commonSymmetricPadding(horizontal: 10),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Start time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              Text(screenController.bookingTime),
            ],
          ).commonSymmetricPadding(horizontal: 10),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "End time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              Text(screenController.endBookingTime),
            ],
          ).commonSymmetricPadding(horizontal: 10),
          screenController.isPriceDisplay
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                            "${screenController.priceCurrencySymbol} ${screenController.bookingPrice.value * screenController.quantityValue.value}"),
                      ],
                    ).commonSymmetricPadding(horizontal: 10)
                  ],
                )
              : Container(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Quantity",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              Text(screenController.quantityValue.value.toString()),
            ],
          ).commonSymmetricPadding(horizontal: 10),
          const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       "Resource",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 16,
          //       ),
          //     ),
          //     const SizedBox(width: 10),
          //     Text(screenController.selectedResource.toString()),
          //   ],
          // ).commonSymmetricPadding(horizontal: 10),

          /*screenController.isPriceDisplay
              ? Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(screenController.bookingTotalAmount.toString()),
                      ],
                    ).commonSymmetricPadding(horizontal: 10)
                  ],
                )
              : Container(),*/
        ],
      ).commonSymmetricPadding(horizontal: 5, vertical: 15),
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
          const SizedBox(height: 10),
          screenController.selectedResourceIsEvent == false
              ? Container()
              : quantityDropDownModule(),
          const SizedBox(height: 10),
          screenController.selectedResourceIsEvent == false
              ? Container()
              : AttendeeDetailsAddModule(),
        ],
      ),
    );
  }

  Widget quantityDropDownModule() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Select Quantity",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.colorGreyIconDark,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                // Initial Value
                value: screenController.quantityValue.value,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                style: const TextStyle(color: Colors.black),
                isExpanded: true,
                // Array list of items
                items: screenController.quantityList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),

                // screenController.countriesList.map((String items) {
                //   return DropdownMenuItem(
                //     value: items,
                //     child: Text(items),
                //   );
                // }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (newValue) {
                  screenController.isLoading(true);
                  screenController.quantityValue.value = newValue!;

                  // log("countryData : ${screenController.countryData!.code}");
                  // screenController.selectedCountryCode.value
                  // = "${screenController.countryData!.code}";

                  screenController.isLoading(false);
                },
              ),
            ).commonSymmetricPadding(horizontal: 10),
          ),
        ),
      ],
    );
  }
}

class AttendeeDetailsAddModule extends StatelessWidget {
  AttendeeDetailsAddModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserCheckoutScreenController>();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: screenController.quantityValue.value,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return AttendeeDetailsForm();
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 10,
          color: AppColors.colorGreyIconLight,
          thickness: 0.8,
        );
      },
    );
  }
}

class AttendeeDetailsForm extends StatelessWidget {
  AttendeeDetailsForm({Key? key}) : super(key: key);
  final screenController = Get.find<UserCheckoutScreenController>();

  final border = OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(12),
    ),
    borderSide: BorderSide(
      color: AppColors.colorGreyIconLight,
      width: 0.8,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.colorGreyIconLight,
          width: 0.8,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              labelText: "Attendee Name*",
              border: border,
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
          // DropdownButton<String>(
          //   focusColor: Colors.white,
          //   value: chosenValue,
          //   //elevation: 5,
          //   style: TextStyle(color: Colors.white),
          //   iconEnabledColor: Colors.black,
          //   items: <String>[
          //     'Android',
          //     'IOS',
          //     'Flutter',
          //     'Node',
          //     'Java',
          //     'Python',
          //     'PHP',
          //   ].map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(
          //         value,
          //         style: TextStyle(color: Colors.black),
          //       ),
          //     );
          //   }).toList(),
          //   hint: Text(
          //     "Age",
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontSize: 14,
          //         fontWeight: FontWeight.w500),
          //   ),
          //   onChanged: (String? value) {
          //     // setState(() {
          //     chosenValue = value;
          //     // });
          //   },
          // ),
        ],
      ),
    );
  }
}

/// Confirm And Pay Button
class ConfirmAndPayButtonModule extends StatelessWidget {
  ConfirmAndPayButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<UserCheckoutScreenController>();
  // final bookAppointmentScreenController = Get.find<BookAppointmentScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // String uniqueId = bookAppointmentScreenController.vendorUniqueId;
        if (screenController.checkOutFormKey.currentState!.validate()) {
          if (screenController.isPriceDisplay) {
            Get.to(
              () => const UserCardPaymentScreen(),
              arguments: [
                (screenController.bookingPrice.value *
                        screenController.quantityValue.value)
                    .toString()
                    .split(".")[0]
                    .toString(),
                screenController.bookingId,
                screenController.vendorAccountStripeId,
                screenController.priceCurrencySymbol,
                screenController.quantityValue.value.toString(),
                screenController.fNameFieldController.text.toString(),
              ],
            );
          } else {
            await screenController.checkOutSubmitFunction();
          }
          // await screenController.checkOutSubmitFunction();
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
              ]),
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