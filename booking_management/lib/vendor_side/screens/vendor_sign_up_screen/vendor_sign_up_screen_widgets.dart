import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/container_decorations.dart';
import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';
import '../../../common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import '../../../user_side/screens/user_sign_up_screen/user_sign_up_screen.dart';
import '../../controllers/vendor_sign_up_screen_controller/vendor_sign_up_screen_controller.dart';


VendorSignUpScreenController screenController = Get.find<VendorSignUpScreenController>();


class AddPhotosModule extends StatelessWidget {
  const AddPhotosModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: shadowDecoration(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Text(
                'Add Photo Identification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: Container(
            decoration: shadowDecoration(),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Text(
                'Add Proof Of Address',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PhotoTextModule extends StatelessWidget {
  const PhotoTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Text(
            'Under ? Photo ID issued by Govt entity',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 9,
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Under ? Utility Bills on business address',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 9,
            ),
          ),
        ),
      ],
    );
  }
}

class BusinessNameFieldModule extends StatelessWidget {
  const BusinessNameFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Business Name', controller: screenController),
    );
  }
}

class EmailFieldModule extends StatelessWidget {
  const EmailFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.emailFieldController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Email', controller: screenController),
    );
  }
}

class MobileFieldModule extends StatelessWidget {
  const MobileFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.mobileFieldController,
      keyboardType: TextInputType.phone,
      validator: (value) => FieldValidator().validateMobile(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Mobile', controller: screenController),
    );
  }
}

class BusinessAddressFieldModule extends StatelessWidget {
  const BusinessAddressFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessAddressFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Business Address', controller: screenController),
    );
  }
}

class BusinessIdFieldModule extends StatelessWidget {
  const BusinessIdFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessIdFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Business ID', controller: screenController),
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
        decoration: vendorSignUpFormFieldDecoration(
            hintText: 'Password',
            controller: screenController,
          index: 1,
        ),
      ),
    );
  }
}

class ConfirmPasswordFieldModule extends StatelessWidget {
  const ConfirmPasswordFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> TextFormField(
        controller: screenController.cPasswordFieldController,
        keyboardType: TextInputType.text,
        obscureText: screenController.isCPasswordVisible.value,
        validator: (value) => FieldValidator().validateConfirmPassword(value!, screenController.passwordFieldController.text),
        decoration: vendorSignUpFormFieldDecoration(
            hintText: 'Confirm Password',
            controller: screenController,
          index: 1,
        ),
      ),
    );
  }
}

class VendorSignUpButtonModule extends StatelessWidget {
  const VendorSignUpButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.vendorSignUpFormKey.currentState!.validate()){}
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
            'SIGN UP',
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

class CustomerSignUpTextModule extends StatelessWidget {
  const CustomerSignUpTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Register as customer? "),
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

class VendorSignInTextModule extends StatelessWidget {
  const VendorSignInTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? '),
        GestureDetector(
          onTap: () {
            Get.off(()=> SignInScreen());
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
