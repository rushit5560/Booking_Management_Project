import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/vendor_side/controllers/choose_court_screen_controller/choose_court_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ChooseCourtScreenController screenController = Get.find<ChooseCourtScreenController>();

class CourtDetails extends StatelessWidget {
  const CourtDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: dateDropDownModule(context)),
            SizedBox(width: 15,),
            Expanded(child: timeDropDownModule(context))
          ],
        ),
        SizedBox(height: 15,),
        availableSlotDropDownModule(context),

      ],
    );
  }

  Widget dateDropDownModule(context){
    return Obx(()=>
        Container(
          //width: Get.width/2.5,
          padding: const EdgeInsets.only(right: 10),
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorLightGrey.withOpacity(0.5),
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
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2, color: Colors.black,),
                isExpanded: true,
                focusColor: Colors.white,
                value: screenController.date.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorLightGrey),
                iconEnabledColor: Colors.black,
                items: <String>[
                  '23 Mar 2022',
                  '24 Mar 2022',
                  '25 Mar 2022',
                  '26 Mar 2022',
                  '27 Mar 2022'
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
                hint: Text("Daily Checkup", style: TextStyle(color: Colors.black),),
                onChanged: (newValue) {
                  screenController.date.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget timeDropDownModule(context){
    return Obx(()=>
        Container(
          //width: Get.width/2.5,
          padding: const EdgeInsets.only(right: 10),
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorLightGrey.withOpacity(0.5),
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
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2, color: Colors.black,),
                isExpanded: true,
                focusColor: Colors.white,
                value: screenController.time.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorLightGrey),
                iconEnabledColor: Colors.black,
                items: <String>[
                  '06:00',
                  '07:00',
                  '08:00',
                  '09:00',
                  '10:00'
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
                hint: Text("Time", style: TextStyle(color: Colors.black),),
                onChanged: (newValue) {
                  screenController.time.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget availableSlotDropDownModule(context){
    return Obx(()=>
        Container(
          //width: Get.width/2.5,
          padding: const EdgeInsets.only(right: 10),
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorLightGrey.withOpacity(0.5),
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
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2, color: Colors.black,),
                isExpanded: true,
                focusColor: Colors.white,
                value: screenController.availableTime.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorLightGrey),
                iconEnabledColor: Colors.black,
                items: <String>[
                  'For 1 hour',
                  'For 2 hour',
                  'For 3 hour',
                  'For 4 hour',
                  'For 5 hour'
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
                hint: Text("Time", style: TextStyle(color: Colors.black),),
                onChanged: (newValue) {
                  screenController.availableTime.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }
}

class UpdateButtonModule extends StatelessWidget {
  const UpdateButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
      child: const Center(
        child: Text(
          'Update',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17
          ),
        ),
      ),
    );
  }
}

class CourtListModule extends StatelessWidget {
  const CourtListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.only(bottom: 20),
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
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Court 3", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                const SizedBox(height: 10),
                const Text("Non cushioned hardcourt", style: TextStyle(color: Colors.grey),),
                const SizedBox(height: 15),
                const Text("\$32.00", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                const SizedBox(height: 10),
                const Divider(height: 2, color: Colors.grey),
                const SizedBox(height: 15),
                const Text("06:00 - 07:00", style: TextStyle(color: Colors.black),),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: Get.width/3,
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
                  child: const Center(
                    child: Text(
                      'Book',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5)
              ],
            ),
          ),
        );
      },

    );
  }
}


