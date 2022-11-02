import 'package:booking_management/common_ui/common_screens/forgot_password_screen/forgot_password_screen.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      validator: (value) => FieldValidator().validateUserName(value!),
      decoration: signInFormFieldDecoration(
          hintText: 'User Name', controller: screenController),
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
          boxShadow: [
            BoxShadow(
              spreadRadius: 3,
              blurRadius: 5,
              color: Colors.grey.shade300,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Text(
            'SIGN IN',
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
