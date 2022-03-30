import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/user_side/controllers/user_checkout_screen_controller/user_checkout_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final screenController = Get.find<UserCheckoutScreenController>();

class SelectPaymentMethod extends StatelessWidget {
  const SelectPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Payment Method", style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 10,),

        Obx(()=>
            Container(
              //height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
              ),
              child: ListTile(
                trailing: Radio<String>(
                  value: 'Credit/Debit Card',
                  activeColor: AppColors.colorLightGrey,
                  groupValue: screenController.payment.value,
                  onChanged: (value) {
                    //setState(() {
                    screenController.payment.value = value!;
                    // });
                  },
                ),
                title: const Text('Credit/Debit Card', style: TextStyle(color: Colors.black, fontSize: 15),),
              ),
            ),
        ),
        const SizedBox(height: 10,),
        Obx(()=>
            Container(
              //height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
              ),
              child: ListTile(
                trailing: Radio<String>(
                  value: 'UPI',
                  activeColor: AppColors.colorLightGrey,
                  groupValue: screenController.payment.value,
                  onChanged: (value) {
                    //setState(() {
                    screenController.payment.value = value!;
                    // });
                  },
                ),
                title: const Text('UPI', style: TextStyle(color: Colors.black, fontSize: 15),),
              ),
            ),
        ),

        const SizedBox(height: 10,),
        Obx(()=>
            Container(
              //height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
              ),
              child: ListTile(
                trailing: Radio<String>(
                  value: 'Paypal',
                  activeColor: AppColors.colorLightGrey,
                  groupValue: screenController.payment.value,
                  onChanged: (value) {
                    //setState(() {
                    screenController.payment.value = value!;
                    // });
                  },
                ),
                title: const Text('Paypal', style: TextStyle(color: Colors.black, fontSize: 15),),
              ),
            ),
        ),

        // const SizedBox(height: 10,),
        // Obx(()=>
        //     Container(
        //       //height: 55,
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(15),
        //           border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
        //       ),
        //       child: ListTile(
        //         trailing: Radio<String>(
        //           value: 'Cash',
        //           activeColor: AppColors.colorLightGrey,
        //           groupValue: screenController.payment.value,
        //           onChanged: (value) {
        //             //setState(() {
        //             screenController.payment.value = value!;
        //             // });
        //           },
        //         ),
        //         title: const Text('Cash', style: TextStyle(color: Colors.black, fontSize: 15),),
        //       ),
        //     ),
        // )
      ],
    );
  }
}

class BookButtonModule extends StatelessWidget {
  const BookButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.to(() => BookAppointMentScreen());
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
              'BOOK NOW',
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