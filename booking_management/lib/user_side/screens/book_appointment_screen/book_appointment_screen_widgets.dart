import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/book_appointment_screen_controller/book_appointment_screen_controller.dart';

final screenController = Get.find<BookAppointmentScreenController>();

class BookAppointmentScreenAppBarWidget extends StatelessWidget {
  const BookAppointmentScreenAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
          color: AppColors.colorLightGrey
        //color: Colors.grey
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Get.back();
              },
                child: Image.asset(AppImages.backArrowImg)),

            const Text("Book Appointment", style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20
            ),),

            Container()
          ],
        ),
      ),
    );
  }
}

class SelectDateModule extends StatelessWidget {
  const SelectDateModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Date", style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {screenController.selectDatePreviousClick(pageController: screenController.selectDatePageController);},
                    child:  const LeftArrowButtonModule()),
                const SizedBox(width: 10,),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: PageView.builder(
                      padEnds: false,
                      controller: screenController.selectDatePageController,
                      onPageChanged: screenController.selectedPageIndex,
                      itemCount: screenController.dateList.length,
                      itemBuilder: (context, index) {
                        //int i =1;
                        return Obx(()=>
                          GestureDetector(
                            onTap: (){
                              screenController.selectedDateIndex.value = index;
                            },
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Mar", style: TextStyle(fontSize: 14, fontWeight: screenController.selectedDateIndex.value == index ? FontWeight.bold : FontWeight.normal),),
                                const SizedBox(height: 3,),
                                Text(index.toString(), style: TextStyle(fontSize: 14, fontWeight: screenController.selectedDateIndex.value == index ? FontWeight.bold : FontWeight.normal),),
                                const SizedBox(height: 3,),
                                Text("Fri", style: TextStyle(fontSize: 14, fontWeight: screenController.selectedDateIndex.value == index ? FontWeight.bold : FontWeight.normal),)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                GestureDetector(
                    onTap: () {screenController.selectDateNextClick(pageController: screenController.selectDatePageController);},
                    child:  const RightArrowButtonModule()),
              ],
            ),
          ),
        )
      ],
    );
  }

}

class LeftArrowButtonModule extends StatelessWidget {
  const LeftArrowButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Image.asset(AppImages.backArrowImg)
    );
  }
}

class RightArrowButtonModule extends StatelessWidget {
  const RightArrowButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Image.asset(AppImages.rightArrowImg)
    );
  }
}


class SelectTimeModule extends StatelessWidget {
  const SelectTimeModule({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Time", style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold
        ),),
        const SizedBox(height: 10,),
        GridView.builder(
          itemCount: screenController.timeList.length,
          shrinkWrap: true,
          physics:  const AlwaysScrollableScrollPhysics(),
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.9,
          ),
          itemBuilder: (context, i) {
            return Obx(()=>
              GestureDetector(
                  onTap: (){
                    screenController.selectedTimeIndex.value = i;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:screenController.selectedTimeIndex.value == i  ? AppColors.colorLightGrey : Colors.white,
                        border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
                    ),
                    child: Center(
                      child: Text(screenController.timeList[i]),
                    ),
                  ),
              ),
            );
          },
        )
      ],
    );
  }
}

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
                  value: 'Cash',
                  activeColor: AppColors.colorLightGrey,
                  groupValue: screenController.payment.value,
                  onChanged: (value) {
                    //setState(() {
                    screenController.payment.value = value!;
                    // });
                  },
                ),
                title: const Text('Cash', style: TextStyle(color: Colors.black, fontSize: 15),),
              ),
            ),
        )
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
