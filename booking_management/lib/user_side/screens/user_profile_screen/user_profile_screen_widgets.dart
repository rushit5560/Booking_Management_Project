import 'dart:developer';
import 'dart:io';
import 'package:booking_management/common_modules/common_widgets.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/user_side/controllers/user_profile_screen_controller/user_profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common_modules/constants/api_url.dart';

class ProfileDetailsModule extends StatefulWidget {
  ProfileDetailsModule({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsModule> createState() => _ProfileDetailsModuleState();
}

class _ProfileDetailsModuleState extends State<ProfileDetailsModule> {
  final screenController = Get.find<UserProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => screenController.isLoading.value
            ? const CustomCircularLoaderModule()
            : Form(
                key: screenController.profileFormKey,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    profile(),
                    const SizedBox(height: 30),
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
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime dateTime) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (d != null) {
      screenController.isLoading(true);
      screenController.selectedDate = d;
      screenController.isLoading(false);

      //setState(() {
      // screenController.selectedDate = DateFormat.yMd("en_US").format(d);
      // log(screenController.selectedDate.value);
      //});
    }
  }

  /// Profile
  Widget profile() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 120,
          width: 120,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: screenController.file != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        screenController.file!,
                        // height: 100,
                        // width: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        screenController.userImage == null
                            ? ""
                            : ApiUrl.apiImagePath + screenController.userImage!,
                        // height: 100,
                        // width: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, obj, st) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AppImages.logoImg,
                              // height: 100,
                              // width: 100,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      ),
                    )),
        ),
        GestureDetector(
          onTap: () {
            showPhotoChoiceDialog(Get.context!);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Icon(Icons.edit),
          ),
        ),
      ],
    );
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    screenController.file = File(pickedFile!.path);
    setState(() {});

    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    screenController.file = File(pickedFile!.path);
    setState(() {});

    Navigator.pop(context);
  }

  Future<void> showPhotoChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Choose option",
            style: TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Divider(
                  height: 1,
                  color: Colors.black,
                ),
                SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    _openGallery(context);
                  },
                  title: Text("Gallery"),
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.black,
                  ),
                ),
                // Divider(
                //   height: 1,
                //   color: Colors.black,
                // ),
                ListTile(
                  onTap: () {
                    _openCamera(context);
                  },
                  title: Text("Camera"),
                  leading: Icon(
                    Icons.camera,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Name Field
  Widget nameTextField() {
    return Row(
      children: [
        const Expanded(flex: 2, child: Text("Name:")),
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
                  //validator: (value) => FieldValidator().validateName(value!),
                ),
              ],
            ))
      ],
    );
  }

  /// Email Field
  Widget emailTextField() {
    return Row(
      children: [
        const Expanded(flex: 2, child: Text("Email:")),
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
            ))
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
  Widget mobileTextField() {
    return Row(
      children: [
        const Expanded(flex: 2, child: Text("Mobile:")),
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
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
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
            ))
      ],
    );
  }

  /// DOB Field
  Widget dateOfBirthTextField(context) {
    return Row(
      children: [
        const Expanded(flex: 2, child: Text("Date Of Birth:")),
        Expanded(
          flex: 4,
          child: Container(
            height: 45,
            margin: const EdgeInsets.only(left: 5),
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
                  Expanded(
                    child: Text(
                        "${screenController.selectedDate.day}-${screenController.selectedDate.month}-${screenController.selectedDate.year}",
                        // textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.black)),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
                    tooltip: 'DOB',
                    onPressed: () {
                      // var dateFormat = DateFormat('yyyy-MM-dd');
                      DateTime selectedDate = screenController.selectedDate;

                      // String year = selectedDate.substring(0, selectedDate.length - 6);
                      // String month = selectedDate.substring(5, selectedDate.length - 3);
                      // String day = selectedDate.substring(8);

                      // DateTime dateTime = dateFormat.parse("$year-$month-${day}T00:00:00.000000");
                      // log("dateTime : $dateTime");
                      // log("Date Format : ${DateTime.now()}");
                      _selectDate(context, selectedDate);
                      // SelectDateModule();
                    },
                  ),
                ],
              ),
            ),
          ),
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
    return Obx(
      () => Row(
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
              title: const Text(
                'Male',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
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
              title: const Text(
                'Female',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Save Button
  Widget saveButtonModule() {
    return GestureDetector(
      onTap: () async {
        if (screenController.profileFormKey.currentState!.validate()) {
          await screenController.updateUserProfileFunction();
        }
      },
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 5,
            color: Colors.grey.shade300,
            blurStyle: BlurStyle.outer,
          ),
        ]),
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

class SelectDateModule extends StatelessWidget {
  SelectDateModule({Key? key}) : super(key: key);

  // final screenController = Get.find<BookAppointmentScreenController>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Select Date",
        //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        // ),
        const SizedBox(height: 10),
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime(2020),
              lastDay: DateTime(2050),
              calendarFormat: format,
              rangeStartDay: DateTime.now(),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                selectedDay = selectDay;
                focusedDay = focusDay;

                String hour = "${selectedDay.hour}";
                String minute = "${selectedDay.minute}";

                /// For Hour Format
                for (int i = 0; i < 10; i++) {
                  if (selectedDay.hour.toString() == i.toString()) {
                    if (selectedDay.hour.toString().length == 1) {
                      hour = "0${selectedDay.hour}";
                    }
                  }
                }

                /// For Minute
                for (int i = 0; i < 10; i++) {
                  if (selectedDay.minute.toString() == i.toString()) {
                    if (selectedDay.minute.toString().length == 1) {
                      minute = "0${selectedDay.minute}";
                    }
                  }
                }

                // screenController.selectedTime.value = "$hour:$minute:00";

                // screenController.selectedDate.value = "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}";

                // log("screenController.selectedTime.value : ${screenController.selectedTime.value}");
                // screenController.selectedTime.value = "${selectedDay.hour}:${selectedDay.minute}:${selectedDay.second}";

                // screenController.isServiceCalenderShow.value = !screenController.isServiceCalenderShow.value;
                // screenController.loadUI();
              },

              // Day Changed
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              // Style the Calender
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                outsideDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                defaultTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                weekendTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                selectedTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                todayTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                defaultDecoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.white),
                weekendDecoration: const BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.white),
                todayDecoration: const BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: Colors.transparent),
                selectedDecoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.circle,
                    color: AppColors.colorLightGrey1),
              ),
              // Week Style
              daysOfWeekStyle: const DaysOfWeekStyle(
                // dowTextFormatter: (dowTextFormat, dynamic) {
                //   return DateFormat.E(locale).format(dowTextFormat)[0];
                // },
                decoration: BoxDecoration(color: Colors.transparent),
                weekdayStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),

                weekendStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              // Month Style
              headerStyle: HeaderStyle(
                headerPadding: const EdgeInsets.only(top: 10, bottom: 10),
                formatButtonVisible: false,
                titleCentered: true,
                decoration: const BoxDecoration(color: Colors.white),
                formatButtonDecoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                leftChevronIcon: const Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.black),
                rightChevronIcon: const Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
