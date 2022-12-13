import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_ui/common_screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';
import '../../../user_side/screens/user_sign_up_screen/user_sign_up_screen.dart';
import '../../common_controller/sign_in_screen_controller/sign_in_screen_controller.dart';

class EmailFieldModule extends StatelessWidget {
  EmailFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.unameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateLoginField(value!),
      decoration: signInFormFieldDecoration(
          hintText: 'UserName or Email', controller: screenController),
    );
  }
}

class PasswordFieldModule extends StatelessWidget {
  PasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: screenController.passwordFieldController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: screenController.isPasswordVisible.value,
        validator: (value) => FieldValidator().validatePassword(value!),
        decoration: signInFormFieldDecoration(
            hintText: 'Password', index: 1, controller: screenController),
      ),
    );
  }
}

class SignInSkipButton extends StatelessWidget {
  const SignInSkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.offAll(() => IndexScreen());
          },
          child: const Text(
            "Home",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.signInFormKey.currentState!.validate()) {
          // if(screenController.emailFieldController.text == "user@gmail.com"){
          //   Get.offAll(()=> IndexScreen());
          // } else if(screenController.emailFieldController.text == "vendor@gmail.com"){
          //   Get.offAll(()=> VendorIndexScreen());
          // }
          //Get.offAll(()=> IndexScreen());
          await screenController.signInFunction(
              // userName: screenController.unameFieldController.text.trim(),
              // password: screenController.passwordFieldController.text.trim(),
              );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.accentColor,
          boxShadow: [
            BoxShadow(
              // spreadRadius: 3,
              blurRadius: 5,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'SIGN IN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordTextModule extends StatelessWidget {
  const ForgotPasswordTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.to(() => ForgotPasswordScreen());
        //await screenController.forgotPasswordFunction();
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class SignUpTextModule extends StatelessWidget {
  const SignUpTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () {
            Get.off(() => UserSignUpScreen());
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class SignInSocialMediaLoginButtonsModule extends StatelessWidget {
  SignInSocialMediaLoginButtonsModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await screenController.signInWithGoogleFunction();
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.googleLoginImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 60),
        GestureDetector(
          onTap: () async {
            await screenController.signInWithFacebookFunction();
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.fbLoginImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        screenController.isIosPlatform.value
            ? const SizedBox(width: 60)
            : const SizedBox(),
        screenController.isIosPlatform.value
            ? GestureDetector(
                onTap: () async {
                  // await screenController.signInWithAppleFunction();
                  try {
                    final credential =
                        await SignInWithApple.getAppleIDCredential(
                      scopes: [
                        AppleIDAuthorizationScopes.email,
                        AppleIDAuthorizationScopes.fullName,
                      ],
                    );

                    log("apple login email are :: ${credential.email}");
                    log("apple login givenName are :: ${credential.givenName}");
                    // log("apple login userIdentifier are :: ${credential.userIdentifier}");
                    // log("apple login familyName are :: ${credential.familyName}");
                    // log("apple login identityToken are :: ${credential.identityToken}");
                    // log("apple login state are :: ${credential.state}");

                    if (credential.email!.isNotEmpty &&
                        credential.givenName!.isNotEmpty) {
                      await screenController.authenticationFunction(
                        userName:
                            credential.givenName! + credential.familyName!,
                        email: credential.email!,
                        socialProv: "apple",
                      );
                    } else {
                      // CommonWidgets.yesOrNoDialog(
                      //   context: context,
                      //   body:
                      //       "Unfortunately apple sign in not working. try another login method.",
                      //   title: "Apple sign in failed",
                      //   onNoPressed: () {
                      //     Get.back();
                      //   },
                      //   onYesPressed: () {
                      //     Get.back();
                      //   },
                      // );
                    }
                  } catch (e) {
                    log("error occured while apple signin :: $e");
                    rethrow;
                  }
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.appleLoginImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
