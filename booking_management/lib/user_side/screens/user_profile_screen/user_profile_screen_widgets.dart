import 'dart:developer';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/user_side/controllers/user_profile_screen_controller/user_profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


final screenController = Get.find<UserProfileScreenController>();

class ProfileDetailsModule extends StatelessWidget {
  const ProfileDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: screenController.profileFormKey,
        child: Column(
          children: [
            // profile(),
            // SizedBox(height: 30,),
            nameTextField(),
            // const SizedBox(height: 15),
            emailTextField(),
            const SizedBox(height: 15),
            // addressTextField(),
            // const SizedBox(height: 15,),
            mobileTextField(),
            const SizedBox(height: 15),
            dateOfBirthTextField(context),
            const SizedBox(height: 15),
            _radioButton(),
            const SizedBox(height: 15),
            // cityTextField(),
            const SizedBox(height: 15),
            // stateTextField(),
            const SizedBox(height: 15),
            // countryTextField(),
            const SizedBox(height: 15),
            saveButtonModule(),
          ],
        ).commonAllSidePadding(20),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1995),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      //setState(() {
      screenController.selectedDate.value = DateFormat.yMd("en_US").format(d);
      log(screenController.selectedDate.value);
      //});
    }
  }

  /// Profile
  Widget profile(){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
        child: Image.asset(AppImages.vendorImg, scale: 8,)),

        Container(
          height: 35, width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white
          ),
          child: Icon(Icons.edit),
        )
      ],
    );
  }

  /// ame Field
  Widget nameTextField(){
    return Row(
      children: [
        const Expanded(
          flex: 2,
            child: Text("Name:")
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //border: Border.all(color: AppColors.colorLightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey.withOpacity(0.3),
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.nameTextFieldController,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    //isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    //filled: true,
                    //fillColor: Colors.white,
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  validator: (value) => FieldValidator().validateName(value!),
                ),
              ],
            )
        )
      ],
    );
  }

  /// Email Field
  Widget emailTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Email:")
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //border: Border.all(color: AppColors.colorLightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey.withOpacity(0.3),
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.emailTextFieldController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  readOnly: true,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black),
                    //isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    //filled: true,
                    //fillColor: Colors.white,
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  // validator: (value) => FieldValidator().validateEmail(value!),
                ),
              ],
            )
        )
      ],
    );
  }

  /// Address Field
  /*Widget addressTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Address:")
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //border: Border.all(color: AppColors.colorLightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey.withOpacity(0.3),
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.addressTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: "Address",
                    hintStyle: TextStyle(color: Colors.black),
                    //isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    //filled: true,
                    //fillColor: Colors.white,
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  validator: (value) => FieldValidator().validateAddress(value!),
                ),
              ],
            )
        )
      ],
    );
  }*/

  /// Mobile Number
  Widget mobileTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Mobile:")
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //border: Border.all(color: AppColors.colorLightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey.withOpacity(0.3),
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.mobileTextFieldController,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Mobile",
                    hintStyle: TextStyle(color: Colors.black),
                    //isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    //filled: true,
                    //fillColor: Colors.white,
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  validator: (value) => FieldValidator().validateMobile(value!),
                ),
              ],
            )
        )
      ],
    );
  }

  /// DOB Field
  Widget dateOfBirthTextField(context){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Date Of Birth:")
        ),
        Expanded(
            flex: 4,
            child: Obx(()=>
                Container(
                  height: 45,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: Text(
                              screenController.selectedDate.value,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black)
                          ),
                          onTap: (){
                            _selectDate(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today_outlined, color: Colors.black, size: 20,),
                          tooltip: 'DOB',
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            )
        )
      ],
    );
  }

  /// City
  /*Widget cityTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("City:")
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //border: Border.all(color: AppColors.colorLightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey.withOpacity(0.3),
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.cityTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "City",
                    hintStyle: TextStyle(color: Colors.black),
                    //isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    //filled: true,
                    //fillColor: Colors.white,
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  validator: (value) => FieldValidator().validateCityName(value!),
                ),
              ],
            )
        )
      ],
    );
  }*/

  /// State
  /*Widget stateTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("State:")
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //border: Border.all(color: AppColors.colorLightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey.withOpacity(0.3),
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.stateTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "State",
                    hintStyle: TextStyle(color: Colors.black),
                    //isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    //filled: true,
                    //fillColor: Colors.white,
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  validator: (value) => FieldValidator().validateStateName(value!),
                ),
              ],
            )
        )
      ],
    );
  }*/

  /// Country
  /*Widget countryTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Country:")
        ),
        Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //border: Border.all(color: AppColors.colorLightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey.withOpacity(0.3),
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.countryTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Country",
                    hintStyle: TextStyle(color: Colors.black),
                    //isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    //filled: true,
                    //fillColor: Colors.white,
                    border: InputBorder.none,
                    // suffix: IconButton(
                    //   onPressed: () {},
                    //   iconSize: 15,
                    //   icon: Icon(Icons.visibility_off_rounded),
                    // ),
                    // suffix: Container(
                    //   child: index == 0
                    //       ? null
                    //       : GestureDetector(
                    //     onTap: () {
                    //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
                    //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
                    //     },
                    //     child: Obx(
                    //       ()=> Icon(signInScreenController.isPassVisible.value
                    //           ? Icons.visibility_rounded
                    //           : Icons.visibility_off_rounded),
                    //     ),
                    //   ),
                    // ),
                  ),
                  validator: (value) => FieldValidator().validateCountryName(value!),
                ),
              ],
            )
        )
      ],
    );
  }*/

  /// Radio Button
  Widget _radioButton() {
    return Obx(()=>
        Row(
          children: [
            Expanded(
              child: ListTile(
                leading: Radio<String>(
                  value: 'Male',
                  activeColor: Colors.black,
                  groupValue: screenController.gender.value,
                  onChanged: (value) {
                    screenController.gender.value = value!;
                    log(value);
                  },
                ),
                title: const Text('Male', style: TextStyle(color: Colors.black, fontSize: 15),),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Radio<String>(
                  value: 'Female',
                  activeColor: Colors.black,
                  groupValue: screenController.gender.value,
                  onChanged: (value) {
                    screenController.gender.value = value!;
                    log(value);
                  },
                ),
                title: const Text('Female', style: TextStyle(color: Colors.black, fontSize: 15),),
              ),
            ),
          ],
        ),
    );
  }

  /// Save Button
  Widget saveButtonModule(){
    return GestureDetector(
      onTap: () async {
        if(screenController.profileFormKey.currentState!.validate()){
          await screenController.updateUserProfileFunction();
        }
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
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'SAVE',
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
