import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';
import '../../../common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import '../../controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';

UserSignUpScreenController screenController = Get.find<UserSignUpScreenController>();

class NameFieldModule extends StatelessWidget {
  const NameFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.nameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Name',
        context: context,
      ),
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
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Email',
        context: context,
      ),
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
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Mobile',
        context: context,
      ),
    );
  }
}

class AddressFieldModule extends StatelessWidget {
  const AddressFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.addressFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateAddress(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Address',
        context: context,
      ),
    );
  }
}

class PasswordFieldModule extends StatelessWidget {
  const PasswordFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.passwordFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validatePassword(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Password',
        index: 1,
        context: context,
      ),
    );
  }
}

class CPasswordFieldModule extends StatelessWidget {
  const CPasswordFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.cPasswordFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateConfirmPassword(value!, screenController.passwordFieldController.text.trim()),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Confirm Password',
        index: 1,
        context: context,
      ),
    );
  }
}

class DOBFieldModule extends StatelessWidget {
  const DOBFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.dobFieldController,
      keyboardType: TextInputType.text,
      // validator: (value) => FieldValidator().validate(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Dob',
        index: 2,
        context: context,
      ),
    );
  }
}

class CountryFieldModule extends StatelessWidget {
  const CountryFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.countryFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Country',
        context: context,
      ),
    );
  }
}

class StateFieldModule extends StatelessWidget {
  const StateFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.stateFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'State',
        context: context,
      ),
    );
  }
}

class CityFieldModule extends StatelessWidget {
  const CityFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.cityFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'City',
        context: context,
      ),
    );
  }
}

class SignUpButtonModule extends StatelessWidget {
  const SignUpButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.signUpFormKey.currentState!.validate()){}
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

class VendorSignUpTextModule extends StatelessWidget {
  const VendorSignUpTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Register as Vendor? '),
        GestureDetector(
          onTap: () {},
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

class SignInTextModule extends StatelessWidget {
  const SignInTextModule({Key? key}) : super(key: key);

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
