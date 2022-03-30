import 'dart:io';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common_modules/common_widgets.dart';
import '../../controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';
import 'user_sign_up_screen_widgets.dart';

class UserSignUpScreen extends StatefulWidget {
  UserSignUpScreen({Key? key}) : super(key: key);

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final userSignUpScreenController = Get.put(UserSignUpScreenController());
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: userSignUpScreenController.signUpFormKey,
            child: Column(
              children: [
                // From Common Widgets
                const HeaderLogoModule(),
                const SizedBox(height: 20),
                // From Common Widgets
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
                const FirstNameFieldModule(),
                const SizedBox(height: 5),
                const LastNameFieldModule(),
                const SizedBox(height: 5),
                const GenderFieldModule(),
                const SizedBox(height: 5),
                const EmailFieldModule(),
                const SizedBox(height: 5),
                const MobileFieldModule(),
                const SizedBox(height: 5),
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
                Row(
                  children: const  [
                    Expanded(
                      child: StateFieldModule(),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CityFieldModule(),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const PasswordFieldModule(),
                // const SizedBox(height: 5),
                // const CPasswordFieldModule(),
                const SizedBox(height: 30),
                const SignUpButtonModule(),
                const SizedBox(height: 25),
                // From Common Widgets
                const OrTextModule(),
                const SizedBox(height: 15),
                // From Common Widgets
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
    );
  }

  void gallery() async {
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        userSignUpScreenController.file = File(image.path);
      });
    } else{}
  }
}
