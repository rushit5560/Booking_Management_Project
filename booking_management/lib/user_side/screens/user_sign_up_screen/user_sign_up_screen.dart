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
              children: const [
                // From Common Widgets
                HeaderLogoModule(),
                SizedBox(height: 20),
                // From Common Widgets
                HeaderTextModule(name: "SignUp"),
                SizedBox(height: 20),

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
                SizedBox(height: 20),
                UserNameFieldModule(),
                // const SizedBox(height: 5),
                // const LastNameFieldModule(),
                // const SizedBox(height: 5),
                // const GenderFieldModule(),
                SizedBox(height: 5),
                EmailFieldModule(),
                // const SizedBox(height: 5),
                // const MobileFieldModule(),
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
                SizedBox(height: 5),
                PasswordFieldModule(),
                SizedBox(height: 5),
                CPasswordFieldModule(),
                SizedBox(height: 30),
                SignUpButtonModule(),
                SizedBox(height: 25),
                // From Common Widgets
                OrTextModule(),
                SizedBox(height: 15),
                // From Common Widgets
                SocialMediaLoginModule(),
                SizedBox(height: 40),
                VendorSignUpTextModule(),
                SizedBox(height: 15),
                SignInTextModule(),
                SizedBox(height: 5),
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
