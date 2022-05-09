import 'dart:developer';
import 'dart:io';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/vendor_side/controllers/vendor_profile_screen_controller/vendor_profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

final screenController = Get.find<VendorProfileScreenController>();

class VendorProfileDetailsModule extends StatefulWidget {
  VendorProfileDetailsModule({Key? key}) : super(key: key);

  @override
  State<VendorProfileDetailsModule> createState() => _VendorProfileDetailsModuleState();
}

class _VendorProfileDetailsModuleState extends State<VendorProfileDetailsModule> {
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.vendorProfileFormKey,
      child: Column(
        children: [
          profile(),
          const SizedBox(height: 30),
          userNameTextField(),
          const SizedBox(height: 15),
          emailTextField(),
          const SizedBox(height: 15),
          businessNameTextField(),
          const SizedBox(height: 15),
          mobileTextField(),
          const SizedBox(height: 15),
          addressTextField(),
          const SizedBox(height: 15),
          cityTextField(),
          const SizedBox(height: 15),
          stateTextField(),
          const SizedBox(height: 15),
          countryTextField(),
          const SizedBox(height: 15),
          subUrbTextField(),
          const SizedBox(height: 15),
          postCodeTextField(),
          const SizedBox(height: 15),
          slotDurationTextField(context),
          const SizedBox(height: 15),
          startTimeTextField(context),
          const SizedBox(height: 15),
          endTimeTextField(context),
          const SizedBox(height: 40),
          saveButtonModule(),
        ],
      ).commonAllSidePadding(20),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      //setState(() {
      screenController.selectedDate.value = DateFormat.yMMMMd("en_US").format(d);
      //});
    }
  }

  Widget profile(){
    return Stack(
      alignment: Alignment.bottomCenter,
      //clipBehavior: Clip.none,
      children: [
        screenController.file != null ?
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(screenController.file!, height: 100, width: 100, fit: BoxFit.fill)) :
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AppImages.profileImg, height: 100, width: 100, fit: BoxFit.fill)),

           GestureDetector(
            onTap: (){
              openGallery();
            },
            child: Positioned(
              //bottom: 15,
              //top: 15,
              child: Container(
                height: 35, width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                ),
                child: const Icon(Icons.edit),
              ),
            ),
          ),
      ],
    );
  }

  void openGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      //setState(() {
        screenController.file = File(image.path);
        screenController.loadUI();
        log('Camera File Path : ${screenController.file}');
        log('Camera Image Path : ${image.path}');
        //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
        //renameImage();
      //});
    } else {}
  }

  Widget userNameTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("UserName:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
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

  Widget emailTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Email:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
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
                  validator: (value) => FieldValidator().validateEmail(value!),
                ),
              ],
            )
        )
      ],
    );
  }

  Widget businessNameTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Business Name:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.businessNameTextFieldController,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Business Name",
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

  Widget addressTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Address:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
  }

  Widget mobileTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Mobile:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
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

  Widget cityTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Street:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.streetTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Street",
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
  }

  Widget stateTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("State:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
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
  }

  Widget countryTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Country:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
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
  }

  Widget subUrbTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Suburb:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.subUrbTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Suburb",
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
  }

  Widget postCodeTextField(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Post Code:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                TextFormField(
                  controller: screenController.postCodeTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Post Code",
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
  }

  Widget slotDurationTextField(context){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Timing Slot Duration:", style: TextStyle(fontWeight: FontWeight.w500),)
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
                        color: AppColors.colorLightGrey,
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                ),

                Obx(() =>
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        width: Get.width, //gives the width of the dropdown button
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //color: Colors.grey.shade200,
                        ),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Colors.grey.shade100,
                            buttonTheme: ButtonTheme.of(context).copyWith(
                              alignedDropdown: true,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(

                              value: screenController.slotDurationValue.value,

                              items: <String>[
                                '15',
                                '30',
                                '45',
                                '1',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),

                              onChanged: (value){
                                screenController.isLoading(true);
                                screenController.slotDurationValue.value = value!;
                                screenController.isLoading(false);
                              },
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            )
        )
      ],
    );
  }



  Widget startTimeTextField(context){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Start Time:", style: TextStyle(fontWeight: FontWeight.w500),)
        ),
        Expanded(
            flex: 4,
            child:Container(
                  height: 45,
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    //border: Border.all(color: AppColors.colorLightGrey),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.colorLightGrey,
                        blurRadius: 5,
                        //spreadRadius: 5,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("${screenController.selectedStartTime.hour}:${screenController.selectedStartTime.minute}"),
                    GestureDetector(
                      onTap: (){
                        _selectStartTime(context);
                      },
                        child: Icon(Icons.access_time))
                  ],
                ),
              ),
                ),

            )
      ],
    );
  }

  Widget endTimeTextField(context){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("End Time:", style: TextStyle(fontWeight: FontWeight.w500),)
        ),
        Expanded(
          flex: 4,
          child:Container(
            height: 45,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              //border: Border.all(color: AppColors.colorLightGrey),
              boxShadow: [
                BoxShadow(
                  color: AppColors.colorLightGrey,
                  blurRadius: 5,
                  //spreadRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${screenController.selectedEndTime.hour}:${screenController.selectedEndTime.minute}"),
                  GestureDetector(
                      onTap: (){
                        _selectEndTime(context);
                      },
                      child: Icon(Icons.access_time))
                ],
              ),
            ),
          ),

        )
      ],
    );
  }

  _selectStartTime(BuildContext context) async {

    final TimeOfDay ? timeOfDay = await showTimePicker(
      context: context,
      initialTime: screenController.selectedStartTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != screenController.selectedStartTime)
    {
      setState(() {
        screenController.selectedStartTime = timeOfDay;
      });
    }
  }

  _selectEndTime(BuildContext context) async {

    final TimeOfDay ? timeOfDay = await showTimePicker(
      context: context,
      initialTime: screenController.selectedEndTime,
      initialEntryMode: TimePickerEntryMode.dial,

    );
    if(timeOfDay != null && timeOfDay != screenController.selectedEndTime)
    {
      setState(() {
        screenController.selectedEndTime = timeOfDay;
      });
    }
  }

  Widget slotSelectionRadioButton(){
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text("Slot Selection:", style: TextStyle(fontWeight: FontWeight.w500),)
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Obx(()=>
                  Container(
                    //height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.colorLightGrey,
                          blurRadius: 5,
                          //spreadRadius: 5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                        //border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
                    ),
                    child: ListTile(
                      trailing: Radio<String>(
                        value: 'Single',
                        activeColor: Colors.black,
                        groupValue: screenController.slot.value,
                        onChanged: (value) {
                          //setState(() {
                          screenController.slot.value = value!;
                          // });
                        },
                      ),
                      title: const Text('Single', style: TextStyle(color: Colors.black, fontSize: 15),),
                    ),
                  ),
              ),
              const SizedBox(height: 15,),
              Obx(()=>
                  Container(
                    //height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.colorLightGrey,
                          blurRadius: 5,
                          //spreadRadius: 5,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                        //border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.7), width: 2)
                    ),
                    child: ListTile(
                      trailing: Radio<String>(
                        value: 'Multiple',
                        activeColor: Colors.black,
                        groupValue: screenController.slot.value,
                        onChanged: (value) {
                          //setState(() {
                          screenController.slot.value = value!;
                          // });
                        },
                      ),
                      title: const Text('Multiple', style: TextStyle(color: Colors.black, fontSize: 15),),
                    ),
                  ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget saveButtonModule(){
    return GestureDetector(
      onTap: () {
        if(screenController.vendorProfileFormKey.currentState!.validate()){
          screenController.vendorEditProfileFunction();
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

class DateScheduleModule extends StatelessWidget {
  const DateScheduleModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Set your Schedule", style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
        ),),

        const SizedBox(height: 20,),

        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {screenController.selectDatePreviousClick(pageController: screenController.selectDatePageController);},
                    child: leftArrowButtonModule()),
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
                                  Text(screenController.dateList[index], style: TextStyle(fontSize: 14, fontWeight: screenController.selectedDateIndex.value == index ? FontWeight.bold : FontWeight.normal),),
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
                    child: rightArrowButtonModule()),
              ],
            ),
          ),
        )

      ],
    );
  }

  Widget leftArrowButtonModule(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Image.asset(AppImages.backArrowImg)
    );
  }

  Widget rightArrowButtonModule(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Image.asset(AppImages.rightArrowImg)
    );
  }
}

class TimeSlots extends StatelessWidget {
  const TimeSlots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: AppColors.colorLightGrey,
                        //     blurRadius: 5,
                        //     blurStyle: BlurStyle.outer
                        //   )
                        // ]
                      ),
                      child: const Center(
                        child: Text("10"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: AppColors.colorLightGrey,
                          //       blurRadius: 5,
                          //       blurStyle: BlurStyle.outer
                          //   )
                          // ]
                      ),
                      child: const Center(
                        child: Text("45"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: AppColors.colorLightGrey,
                          //       blurRadius: 5,
                          //       blurStyle: BlurStyle.outer
                          //   )
                          // ]
                      ),
                      child: const Center(
                        child: Text("AM"),
                      ),
                    ),
                  )

                ],
              ),
            ),
            const SizedBox(width: 10,),

            const Text("To"),

            const SizedBox(width: 10,),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: AppColors.colorLightGrey,
                          //       blurRadius: 5,
                          //       blurStyle: BlurStyle.outer
                          //   )
                          // ]
                      ),
                      child: const Center(
                        child: Text("11"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: AppColors.colorLightGrey,
                          //       blurRadius: 5,
                          //       blurStyle: BlurStyle.outer
                          //   )
                          // ]
                      ),
                      child: const Center(
                        child: Text("00"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)
                          // boxShadow: [
                          //   BoxShadow(
                          //       color: AppColors.colorLightGrey,
                          //       blurRadius: 5,
                          //       blurStyle: BlurStyle.outer
                          //   )
                          // ]
                      ),
                      child: const Center(
                        child: Text("AM"),
                      ),
                    ),
                  )

                ],
              ),
            )
          ],
        ),

        const SizedBox(height: 20,),

        const Text("Time Slots", style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17
        ),),
        SizedBox(height: 20,),
        Row(
          children: [
            Container(
              height: 50, width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)
                // boxShadow: [
                //   BoxShadow(
                //     color: AppColors.colorLightGrey,
                //     blurRadius: 5,
                //     blurStyle: BlurStyle.outer
                //   )
                // ]
              ),
              child: const Center(
                child: Text("15"),
              ),
            ),
            SizedBox(width: 15),
            Obx(()=>
                Container(
                  width: Get.width/2.5,
                  padding: const EdgeInsets.only(right: 10),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                        value: screenController.timeSlots.value,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'Hour',
                          'Minute'
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
                        hint: Text("Minute", style: TextStyle(fontWeight: FontWeight.bold),),
                        onChanged: (newValue) {
                          screenController.timeSlots.value = newValue!;
                        },
                      ),
                    ),
                  ),
                ),
            )
          ],
        ),

        SizedBox(height: 20,),

        GestureDetector(
          onTap: () {
            // if(screenController.vendorProfileFormKey.currentState!.validate()){
            //
            // }
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
          ),
        )
      ],
    );
  }
}

