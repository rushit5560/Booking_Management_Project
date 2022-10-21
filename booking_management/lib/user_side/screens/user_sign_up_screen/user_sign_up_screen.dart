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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// From Common Widgets
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [HeaderLogoModule()],
                          ),
                          const SizedBox(height: 20),

                          /// From Common Widgets
                          const HeaderTextModule(name: "SignUp"),
                          const SizedBox(height: 20),

                          const SizedBox(height: 20),
                          UserNameFieldModule(),
                          const SizedBox(height: 5),
                          FullNameFieldModule(),
                          const SizedBox(height: 5),
                          EmailFieldModule(),
                          const SizedBox(height: 5),
                          PasswordFieldModule(),
                          const SizedBox(height: 5),
                          CPasswordFieldModule(),
                          const SizedBox(height: 30),
                          //const SizedBox(height: 20),
                          //VendorPortalCheckboxModule(),
                          TermsAndConditionCheckboxModule(),
                          const SizedBox(height: 20),
                          const TermsAndConditionText(),
                          const SizedBox(height: 25),
                          SignUpButtonModule(),
                          const SizedBox(height: 25),

                          /// From Common Widgets
                          const OrTextModule(),
                          const SizedBox(height: 15),

                          /// From Common Widgets
                          SocialMediaLoginModule(
                              userSignUpScreenController:
                                  userSignUpScreenController),
                          const SizedBox(height: 25),
                          SkipButton(),
                          const SizedBox(height: 15),
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
