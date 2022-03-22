import 'package:booking_management/controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/field_decorations.dart';
import '../../common/field_validation.dart';
import '../user_sign_up_screen/user_sign_up_screen.dart';

SignInScreenController screenController = Get.find<SignInScreenController>();

class EmailFieldModule extends StatelessWidget {
  const EmailFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.emailFieldController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: signInFormFieldDecoration(hintText: 'Email', controller: screenController),
    );
  }
}

class PasswordFieldModule extends StatelessWidget {
  const PasswordFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> TextFormField(
        controller: screenController.passwordFieldController,
        keyboardType: TextInputType.text,
        obscureText: screenController.isPasswordVisible.value,
        validator: (value) => FieldValidator().validatePassword(value!),
        decoration: signInFormFieldDecoration(hintText: 'Password', index: 1, controller: screenController),
      ),
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  const SignInButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.signInFormKey.currentState!.validate()){}
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
    return Container(
      alignment: Alignment.centerRight,
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 13,
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
            Get.off(()=> UserSignUpScreen());
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
