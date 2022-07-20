import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../controllers/vendor_checkout_screen_controller/vendor_checkout_screen_controller.dart';



class VendorSelectPaymentMethod extends StatelessWidget {
   VendorSelectPaymentMethod({Key? key}) : super(key: key);

   VendorCheckoutScreenController screenController = Get.find<VendorCheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Payment Method", style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 10),

        Obx(()=>
            Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Credit/Debit Card',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),

                    Transform.scale(
                      scale: 0.85,
                      child: Radio<String>(
                        value: 'Credit/Debit Card',
                        activeColor: AppColors.colorLightGrey,
                        groupValue: screenController.vendorPayment.value,
                        onChanged: (value) {
                          screenController.vendorPayment.value = value!;
                        },
                      ),
                    )
                  ],
                ),
              ),

            ),
        ),
        const SizedBox(height: 10),
        Obx(()=>
            Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'UPI',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),

                    Transform.scale(
                      scale: 0.85,
                      child: Radio<String>(
                        value: 'UPI',
                        activeColor: AppColors.colorLightGrey,
                        groupValue: screenController.vendorPayment.value,
                        onChanged: (value) {
                          screenController.vendorPayment.value = value!;
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),

        const SizedBox(height: 10),
        Obx(()=>
            Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Paypal',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),

                    Transform.scale(
                      scale: 0.85,
                      child: Radio<String>(
                        value: 'Paypal',
                        activeColor: AppColors.colorLightGrey,
                        groupValue: screenController.vendorPayment.value,
                        onChanged: (value) {
                          //setState(() {
                          screenController.vendorPayment.value = value!;
                          // });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),

      ],
    );
  }
}

class PayNowButtonModule extends StatelessWidget {
  PayNowButtonModule({Key? key}) : super(key: key);

  VendorCheckoutScreenController screenController = Get.find<VendorCheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        //await screenController.makePayment();
        //await screenController.checkOutSubmitFunction();
        //Get.back();
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
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Text(
            'Pay Now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
