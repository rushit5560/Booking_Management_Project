import 'dart:io';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common_modules/common_functions.dart';
import '../../../common_modules/common_widgets.dart';
import '../../controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';
import 'user_sign_up_screen_widgets.dart';

class UserSignUpScreen extends StatelessWidget {
  UserSignUpScreen({Key? key}) : super(key: key);

  final userSignUpScreenController = Get.put(UserSignUpScreenController());
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(),
      child: Scaffold(
        body: Obx(
          () => userSignUpScreenController.isLoading.value
              ? const CustomCircularLoaderModule()
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: userSignUpScreenController.userSignUpFormKey,
                      child: Column(
                        children: [
                          /// From Common Widgets
                          const HeaderLogoModule(),
                          const SizedBox(height: 20),
                          /// From Common Widgets
                          const HeaderTextModule(name: "SignUp"),
                          const SizedBox(height: 20),

                          /*Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        userSignUpScreenController.file != null ?
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80.0),
                          child: Image.file(userSignUpScreenController.file!, height: 100 ,width: 100, fit: BoxFit.fill ),
                        )
                            :
                        ClipRRect(
                          borderRadius: BorderRadius.circular(80.0),
                          child: Container(

                            height: 100 ,width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                            ),
                            //child: FlutterLogo(),
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            gallery();
                          },
                          child: Container(
                            height: 25, width: 25,
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.colorLightGrey1
                            ),
                            child: Icon(Icons.camera_alt, color: Colors.white,size: 15,),
                          ),
                        ),
                      ],

                    ),*/
                          const SizedBox(height: 20),
                          UserNameFieldModule(),
                          // const SizedBox(height: 5),
                          // const LastNameFieldModule(),
                          // const SizedBox(height: 5),
                          // const GenderFieldModule(),
                          const SizedBox(height: 5),
                          EmailFieldModule(),
                          const SizedBox(height: 5),
                          MobileFieldModule(),
                          // const SizedBox(height: 5),
                          // const AddressFieldModule(),
                          // const SizedBox(height: 5),
                          // DOB & Country Module
                          // const DOBFieldModule(),
                          // Row(
                          //   children: const  [
                          //     Expanded(
                          //       child: DOBFieldModule(),
                          //     ),
                          //     SizedBox(width: 20),
                          //     Expanded(
                          //       child: CountryFieldModule(),
                          //     ),
                          //   ],
                          // ),
                          //const SizedBox(height: 5),
                          // State & City Module
                          // Row(
                          //   children: const  [
                          //     Expanded(
                          //       child: StateFieldModule(),
                          //     ),
                          //     SizedBox(width: 20),
                          //     Expanded(
                          //       child: CityFieldModule(),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 5),
                          PasswordFieldModule(),
                          const SizedBox(height: 5),
                          CPasswordFieldModule(),
                          const SizedBox(height: 30),
                          SignUpButtonModule(),
                          const SizedBox(height: 25),
                          /// From Common Widgets
                          const OrTextModule(),
                          const SizedBox(height: 15),
                          /// From Common Widgets
                          const SocialMediaLoginModule(),
                          const SizedBox(height: 40),
                          const VendorSignUpTextModule(),
                          const SizedBox(height: 15),
                          const SignInTextModule(),
                          const SizedBox(height: 5),
                        ],
                      ).commonAllSidePadding(20),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userSignUpScreenController.file = File(image.path);
    } else {}
  }
}
