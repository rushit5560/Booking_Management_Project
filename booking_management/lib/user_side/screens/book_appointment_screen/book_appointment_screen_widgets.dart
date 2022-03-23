import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/app_images.dart';
import '../../controllers/book_appointment_screen_controller/book_appointment_screen_controller.dart';

final screenController = Get.find<BookAppointmentScreenController>();

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

class SelectSlot extends StatelessWidget {
  const SelectSlot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Your Slot", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        SizedBox(height: 15,),

        Row(
          children: [
            Expanded(child: dateSlotDropDownModule(context)),
            const SizedBox(width: 15,),
            Expanded(child: timeSlotDropDownModule(context))
          ],
        )
      ],
    );
  }

  Widget dateSlotDropDownModule(BuildContext context){
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorLightGrey,
                blurRadius: 5,
                //spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade100,
                // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2,),
                isExpanded: true,
                focusColor: Colors.white,
                value: screenController.date.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorLightGrey),
                iconEnabledColor: Colors.black,
                items: <String>[
                  '23-Mar-2022',
                  '24-Mar-2022',
                  '25-Mar-2022',
                  '26-Mar-2022',
                  '27-Mar-2022'
                ].
                map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: Text("Date", style: const TextStyle(color: Colors.black),),
                onChanged: (newValue) {
                  screenController.date.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget timeSlotDropDownModule(BuildContext context){
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorLightGrey,
                blurRadius: 5,
                //spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade100,
                // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2,),
                isExpanded: true,
                focusColor: Colors.white,
                value: screenController.time.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorLightGrey),
                iconEnabledColor: Colors.black,
                items: <String>[
                  '6:35 PM',
                  '7:00 PM',
                  '8:00 PM',
                  '9:00 PM',
                  '10:00 PM'
                ].
                map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: Text("Time", style: const TextStyle(color: Colors.black),),
                onChanged: (newValue) {
                  screenController.time.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }
}

class CheckAvaibilityButtonModule extends StatelessWidget {
  const CheckAvaibilityButtonModule({Key? key}) : super(key: key);

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
              'Check Avaibility',
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

class ResourcesList extends StatelessWidget {
  const ResourcesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Resources -", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),),
        SizedBox(height: 20,),

        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(bottom: 15, left: 3, right: 3, top: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.colorLightGrey,
                            blurStyle: BlurStyle.outer,
                            blurRadius: 5
                        )
                      ]
                  ),
                  //color: AppColors.colorLightGrey1
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex:3,
                          child: Row(
                            children: [
                              Expanded(
                                flex:1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(AppImages.vendorImg),
                                ),
                              ),
                              SizedBox(width: 15,),

                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Lorem Ipsum", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    SizedBox(height: 7,),
                                    Text("Lorem Ipsum is simply dummy text of the following", maxLines: 1, style: TextStyle(fontSize: 11,),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        //SizedBox(height: 10,),

                        Expanded(
                            flex:1,
                            child: GestureDetector(
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
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Book',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }),
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
