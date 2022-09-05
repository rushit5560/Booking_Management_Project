import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/field_validation.dart';
import 'package:booking_management/vendor_side/controllers/vendor_profile_screen_controller/vendor_profile_screen_controller.dart';
import 'package:booking_management/vendor_side/model/vendor_profile_screen_model/timeslot_duration_model.dart';
import 'package:booking_management/vendor_side/screens/vendor_business_document_screen/vendor_business_document_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:booking_management/vendor_side/model/get_business_type_model/get_business_type_model.dart';
import '../../../common_modules/common_functions.dart';
import '../../../common_modules/constants/enums.dart';

class VendorProfileAppBarModule extends StatelessWidget {
  final String title;
  final AppBarOption? appBarOption;

  //Function? onTap;

  VendorProfileAppBarModule({Key? key, required this.title, this.appBarOption})
      : super(key: key);

  final screenController = Get.find<VendorProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        color: AppColors.accentColor,
        //color: Colors.grey
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftSideButton(),
            appBarOption == AppBarOption.userConversationScreen
                ? Row(
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.vendorImg),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  )
                : Text(
                    title,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
            rightSideButton(),
          ],
        ),
      ),
    );
  }

  Widget leftSideButton() {
    return GestureDetector(
      onTap: () {
        screenController.isLoading(true);
        screenController.nameTextFieldController.clear();
        screenController.mobileTextFieldController.clear();
        screenController.emailTextFieldController.clear();
        screenController.businessNameTextFieldController.clear();
        screenController.addressTextFieldController.clear();
        screenController.streetTextFieldController.clear();
        screenController.stateTextFieldController.clear();
        screenController.countryTextFieldController.clear();
        screenController.subUrbTextFieldController.clear();
        screenController.postCodeTextFieldController.clear();
        log("Dispose Method Call");
        screenController.isLoading(false);
        Get.back();
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: appBarOption == AppBarOption.singleBackButtonOption
            ? Image.asset(AppImages.backArrowImg)
            : appBarOption == AppBarOption.userConversationScreen
                ? Image.asset(AppImages.backArrowImg)
                : appBarOption == AppBarOption.none
                    ? null
                    : Container(),
      ),
    );
  }

  Widget rightSideButton() {
    return GestureDetector(
      onTap: () {
        hideKeyboard();

        Future.delayed(
          const Duration(milliseconds: 400),
          () {
            screenController.isMapShow.value =
                !screenController.isMapShow.value;
          },
        );
      },
      child: const SizedBox(
        height: 50,
        width: 50,
        child: Icon(Icons.map),
      ),
    );
  }
}

class VendorProfileDetailsModule extends StatefulWidget {
  VendorProfileDetailsModule({Key? key}) : super(key: key);

  @override
  State<VendorProfileDetailsModule> createState() =>
      _VendorProfileDetailsModuleState();
}

class _VendorProfileDetailsModuleState
    extends State<VendorProfileDetailsModule> {
  final ImagePicker imagePicker = ImagePicker();
  final screenController = Get.find<VendorProfileScreenController>();

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
          searchAddressListModule(),
          // const SizedBox(height: 15),
          // cityTextField(),
          // const SizedBox(height: 15),
          // stateTextField(),
          // const SizedBox(height: 15),
          // countryTextField(),
          // const SizedBox(height: 15),
          // subUrbTextField(),
          // const SizedBox(height: 15),
          // postCodeTextField(),
          const SizedBox(height: 15),
          slotDurationTextField(context),
          // const SizedBox(height: 15),
          // startTimeTextField(context),
          // const SizedBox(height: 15),
          // endTimeTextField(context),
          const SizedBox(height: 15),
          businessTypeDropDown(),
          const SizedBox(height: 15),
          businessIdTextField(),
          const SizedBox(height: 40),
          saveButtonModule(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              uploadVerifyDocButtonModule(),
            ],
          ),
          /*Row(
            children: [
              Expanded(
                child: saveButtonModule(),
              ),
              Expanded(
                child: uploadVerifyDocButtonModule(),
              ),
            ],
          ),*/
        ],
      ).commonAllSidePadding(20),
    );
  }

  /*Future<void> _selectDate(BuildContext context) async {
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
  }*/

  Widget profile() {
    return Stack(
      alignment: Alignment.bottomCenter,
      //clipBehavior: Clip.none,
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
                : screenController.vendorProfile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          ApiUrl.apiImagePath + screenController.vendorProfile,
                          // height: 100,
                          // width: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, obj, st) {
                            return Image.asset(
                              AppImages.logoImg,
                              // height: 100,
                              // width: 100,
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          AppImages.logoImg,
                          // height: 100,
                          // width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
          ),
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
            child: const Icon(Icons.edit),
          ),
        ),
        // screenController.file != null
        //     ? ClipRRect(
        //         borderRadius: BorderRadius.circular(10),
        //         child: Image.file(screenController.file!,
        //             height: 100, width: 100, fit: BoxFit.fill))
        //     : screenController.vendorProfile == ""
        //         ? ClipRRect(
        //             borderRadius: BorderRadius.circular(10),
        //             child: Image.asset(AppImages.profileImg,
        //                 height: 100, width: 100, fit: BoxFit.fill))
        //         : ClipRRect(
        //             borderRadius: BorderRadius.circular(10),
        //             child: Image.network(
        //                 ApiUrl.apiImagePath + screenController.vendorProfile,
        //                 height: 100,
        //                 width: 100,
        //                 fit: BoxFit.fill)),
        // GestureDetector(
        //   onTap: () {
        //     openGallery();
        //   },
        //   child: Container(
        //     height: 35,
        //     width: 35,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(5), color: Colors.white),
        //     child: const Icon(Icons.edit),
        //   ),
        // ),
      ],
    );
  }

  Future<void> showPhotoChoiceDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Choose option",
            style: const TextStyle(color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const Divider(
                  height: 1,
                  color: Colors.black,
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: () {
                    _openGallery(context);
                  },
                  title: const Text("Gallery"),
                  leading: const Icon(
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
                  title: const Text("Camera"),
                  leading: const Icon(
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

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.file = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.file}');
      log('Camera Image Path : ${screenController.file!.path}');
      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}

    screenController.file = File(pickedFile!.path);
    setState(() {});

    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      //setState(() {
      screenController.file = File(pickedFile.path);
      screenController.loadUI();
      log('Camera File Path : ${screenController.file}');
      log('Camera Image Path : ${screenController.file!.path}');

      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();
      //});
    } else {}

    screenController.file = File(pickedFile!.path);
    setState(() {});

    Navigator.pop(context);
  }

  // void openGallery() async {
  //   final image = await imagePicker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     //setState(() {
  //     screenController.file = File(image.path);
  //     screenController.loadUI();
  //     log('Camera File Path : ${screenController.file}');
  //     log('Camera Image Path : ${image.path}');
  //     //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
  //     //renameImage();
  //     //});
  //   } else {
  //
  //
  //
  //   }
  // }

  Widget userNameTextField() {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Full Name:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
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
            ))
      ],
    );
  }

  Widget emailTextField() {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Email:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
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
                  validator: (value) => FieldValidator().validateEmail(value!),
                ),
              ],
            ))
      ],
    );
  }

  Widget businessNameTextField() {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Business Name:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
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
                  errorMaxLines: 2,
                  hintStyle: TextStyle(color: Colors.black),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  border: InputBorder.none,
                ),
                validator: (value) =>
                    FieldValidator().validateBusinessName(value!),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget addressTextField() {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Address:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              Container(
                // height: 100,
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
                child: TextFormField(
                  controller: screenController.addressTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: "Address",
                    hintStyle: TextStyle(color: Colors.black),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    border: InputBorder.none,
                  ),
                  validator: (value) =>
                      FieldValidator().validateAddress(value!),
                  onChanged: (value) {
                    if (screenController.debounce?.isActive ?? false)
                      screenController.debounce!.cancel();
                    screenController.debounce =
                        Timer(const Duration(milliseconds: 800), () {
                      if (value.isNotEmpty) {
                        screenController.autoCompleteSearch(value);
                      } else {
                        screenController.predictions.clear();
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget searchAddressListModule() {
    return screenController.predictions.isEmpty
        ? Container()
        : ListView.builder(
            itemCount: screenController.predictions.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () async {
                  final placeId = screenController.predictions[i].placeId;
                  final details =
                      await screenController.googlePlace.details.get(placeId!);
                  if (details != null && details.result != null) {
                    log(details.result!.addressComponents![0].longName!);
                    screenController.addressTextFieldController.text =
                        details.result!.formattedAddress!.toString();
                    screenController.selectedLatitude.value =
                        details.result!.geometry!.location!.lat.toString();
                    screenController.selectedLongitude.value =
                        details.result!.geometry!.location!.lng.toString();
                    screenController.isLoading(true);
                    log("formattedAddress : ${details.result!.formattedAddress}");
                    screenController.predictions.clear();
                    screenController.kGooglePlex = CameraPosition(
                      target: LatLng(
                          double.parse(screenController.selectedLatitude.value),
                          double.parse(
                              screenController.selectedLongitude.value)),
                      zoom: 16,
                    );
                    screenController.isLoading(false);
                  } else {}
                },
                leading: const CircleAvatar(
                  child: Icon(Icons.pin_drop_rounded),
                ),
                title: Text(
                    screenController.predictions[i].description.toString()),
              );
            },
          );
    // : Row(
    //   children: [
    //     // Expanded(
    //     //   flex: 2,
    //     //   child: Container(),
    //     // ),
    //     Expanded(
    //       // flex: 4,
    //       child: ListView.builder(
    //         itemCount: screenController.predictions.length,
    //         shrinkWrap: true,
    //         itemBuilder: (context, i) {
    //           return ListTile(
    //             leading: const CircleAvatar(
    //               child: Icon(Icons.pin_drop_rounded),
    //             ),
    //             title: Text(screenController.predictions[i].description.toString()),
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget mobileTextField() {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Mobile:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
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
                  maxLength: 10,
                  decoration: const InputDecoration(
                    hintText: "Mobile",
                    counterText: "",
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

  /*Widget cityTextField(){
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
  }*/

  /*Widget stateTextField(){
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
  }*/

  /* Widget countryTextField(){
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
  }*/

  /*Widget subUrbTextField(){
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
  }*/

  /*Widget postCodeTextField(){
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
  }*/

  Widget slotDurationTextField(context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Timing Slot Duration:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
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
                Obx(
                  () => screenController.isLoading.value
    ? Container()
                  : Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: Get.width,
                    //gives the width of the dropdown button
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
                        child: DropdownButton<TimeSlotDurationModel>(
                          value: screenController.timeSlotDurationModel,
                          items: screenController.timeSlotDurationList.map<DropdownMenuItem<TimeSlotDurationModel>>((TimeSlotDurationModel value) {
                            return DropdownMenuItem<TimeSlotDurationModel>(
                              value: value,
                              child: Text(
                                value.name,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            screenController.isLoading(true);
                            screenController.timeSlotDurationModel = value!;
                            screenController.slotDurationValue.value = screenController.timeSlotDurationModel!.value;
                            screenController.isLoading(false);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget startTimeTextField(context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Start Time:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        Expanded(
          flex: 4,
          child: Container(
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
                  Text(
                      "${screenController.selectedStartTime.hour}:${screenController.selectedStartTime.minute}"),
                  GestureDetector(
                      onTap: () {
                        _selectStartTime(context);
                      },
                      child: const Icon(Icons.access_time))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget endTimeTextField(context) {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "End Time:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        Expanded(
          flex: 4,
          child: Container(
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
                  Text(
                      "${screenController.selectedEndTime.hour}:${screenController.selectedEndTime.minute}"),
                  GestureDetector(
                      onTap: () {
                        _selectEndTime(context);
                      },
                      child: const Icon(Icons.access_time)),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget businessTypeDropDown() {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Business Type:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
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
                Obx(
                  () => Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: Get.width,
                    //gives the width of the dropdown button
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
                        child: DropdownButton<Datum>(
                          value: screenController.businessDropDownValue,
                          items: screenController.businessTypeLists
                              .map<DropdownMenuItem<Datum>>((Datum value) {
                            return DropdownMenuItem<Datum>(
                              value: value,
                              child: Text(
                                value.name!,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            screenController.businessDropDownValue = value!;
                            //log("businessDropDownValue : ${screenController.businessDropDownValue}");
                            screenController.loadUI();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  Widget businessIdTextField() {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Business Id:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
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
                  controller: screenController.businessIdTextFieldController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  readOnly: false,
                  decoration: const InputDecoration(
                    hintText: "Business Id",
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
                  validator: (value) =>
                      FieldValidator().validateBusinessId(value!),
                ),
              ],
            ))
      ],
    );
  }

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: screenController.selectedStartTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != screenController.selectedStartTime) {
      setState(() {
        screenController.selectedStartTime = timeOfDay;
      });
    }
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: screenController.selectedEndTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != screenController.selectedEndTime) {
      setState(() {
        screenController.selectedEndTime = timeOfDay;
      });
    }
  }

  Widget slotSelectionRadioButton() {
    return Row(
      children: [
        const Expanded(
            flex: 2,
            child: Text(
              "Slot Selection:",
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Obx(
                () => Container(
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
                    title: const Text(
                      'Single',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => Container(
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
                    title: const Text(
                      'Multiple',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget saveButtonModule() {
    return GestureDetector(
      onTap: () async {
        if (screenController.vendorProfileFormKey.currentState!.validate()) {
          //screenController.vendorEditProfileFunction();
          log('old: ${screenController.slotDurationValue.value}');
          log('new: ${screenController.currentSlotDuration}');

          // ignore: unrelated_type_equality_checks
          if (screenController.slotDurationValue.value ==
              screenController.currentSlotDuration.value) {
            await screenController.vendorEditProfileFunction();
          } else {
            deleteTimingSlotDurationAlertDialog();
          }
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

  Widget uploadVerifyDocButtonModule() {
    return GestureDetector(
      onTap: () {
        Get.to(() => VendorBusinessDocumentScreen(),
            transition: Transition.zoom);
      },
      child: const Text(
        'Upload verification documents',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          decoration: TextDecoration.underline,
        ),
      ),
      /*child: Container(
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
            'Upload verification documents',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),*/
    );
  }

  deleteTimingSlotDurationAlertDialog() {
// set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No, cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes, delete it"),
      onPressed: () async {
        await screenController.vendorEditProfileFunction();
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Are You Sure?"),
      content: const Text(
          "If you change timing slot duration your all schedule slot should been deleted you won't be able to recover this again!"),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class DateScheduleModule extends StatelessWidget {
  DateScheduleModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Set your Schedule",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: AppColors.colorLightGrey.withOpacity(0.3), width: 2)),
          child: Padding(
            padding: const EdgeInsets.only(left: 7, right: 7),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      screenController.selectDatePreviousClick(
                          pageController:
                              screenController.selectDatePageController);
                    },
                    child: leftArrowButtonModule()),
                const SizedBox(
                  width: 10,
                ),
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
                        return Obx(
                          () => GestureDetector(
                            onTap: () {
                              screenController.selectedDateIndex.value = index;
                            },
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Mar",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: screenController
                                                  .selectedDateIndex.value ==
                                              index
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  screenController.dateList[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: screenController
                                                  .selectedDateIndex.value ==
                                              index
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Fri",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: screenController
                                                  .selectedDateIndex.value ==
                                              index
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      screenController.selectDateNextClick(
                          pageController:
                              screenController.selectDatePageController);
                    },
                    child: rightArrowButtonModule()),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget leftArrowButtonModule() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Image.asset(AppImages.backArrowImg));
  }

  Widget rightArrowButtonModule() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Image.asset(AppImages.rightArrowImg));
  }
}

class TimeSlots extends StatelessWidget {
  TimeSlots({Key? key}) : super(key: key);
  final screenController = Get.find<VendorProfileScreenController>();

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
                          border: Border.all(
                              color: AppColors.colorLightGrey.withOpacity(0.3),
                              width: 2)
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
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.colorLightGrey.withOpacity(0.3),
                              width: 2)
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
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.colorLightGrey.withOpacity(0.3),
                              width: 2)
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
            const SizedBox(
              width: 10,
            ),
            const Text("To"),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.colorLightGrey.withOpacity(0.3),
                              width: 2)
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
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.colorLightGrey.withOpacity(0.3),
                              width: 2)
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
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.colorLightGrey.withOpacity(0.3),
                              width: 2)
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
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Time Slots",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppColors.colorLightGrey.withOpacity(0.3),
                      width: 2)
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
            const SizedBox(width: 15),
            Obx(
              () => Container(
                width: Get.width / 2.5,
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
                        alignedDropdown:
                            true, //If false (the default), then the dropdown's menu will be wider than its button.
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: Image.asset(
                        AppImages.dropDownArrowImg,
                        scale: 2,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      focusColor: Colors.white,
                      value: screenController.timeSlots.value,
                      //elevation: 5,
                      style: const TextStyle(color: Colors.black),
                      iconEnabledColor: Colors.black,
                      items: <String>['Hour', 'Minute']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: const Text(
                        "Minute",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
        const SizedBox(
          height: 20,
        ),
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
          ),
        )
      ],
    );
  }
}

class MapShowModule extends StatelessWidget {
  MapShowModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.50,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: screenController.kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                screenController.mapController.complete(controller);
              },
              myLocationEnabled: true,
              compassEnabled: true,
              markers: screenController.markers,
              myLocationButtonEnabled: true,
              onTap: (latLong) {
                log("latLong : $latLong");
                screenController.selectedLatitude.value =
                    latLong.latitude.toString();
                screenController.selectedLongitude.value =
                    latLong.longitude.toString();

                screenController.markers.clear();
                screenController.markers.add(
                  Marker(
                    markerId: const MarkerId("selectedLocation"),
                    position: LatLng(
                      double.parse(screenController.selectedLatitude.value),
                      double.parse(screenController.selectedLongitude.value),
                    ),
                  ),
                );

                screenController.loadUI();
              },
            ),
          ),
        ).commonAllSidePadding(10),
        const SizedBox(height: 15),
        Row(
          children: [
            const Expanded(
              flex: 4,
              child: Text(
                "Latitude :",
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 6,
              child: Text(screenController.selectedLatitude.value),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Expanded(
              flex: 4,
              child: Text(
                "Longitude :",
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 6,
              child: Text(screenController.selectedLongitude.value),
            ),
          ],
        ),
        const SizedBox(height: 15),
        MapSaveButtonModule(),
      ],
    );
  }
}

class MapSaveButtonModule extends StatelessWidget {
  MapSaveButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.saveVendorLatLongFunction();
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
            'Save Location',
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
