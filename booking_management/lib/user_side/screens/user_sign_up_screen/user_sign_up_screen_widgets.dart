import 'package:booking_management/vendor_side/screens/vendor_sign_up_screen/vendor_sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';
import '../../../common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import '../../controllers/user_sign_up_screen_controller/user_sign_up_screen_controller.dart';

UserSignUpScreenController screenController = Get.find<UserSignUpScreenController>();

class UserNameFieldModule extends StatelessWidget {
  const UserNameFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.userNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateUserName(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'User Name',
        context: context,
      ),
    );
  }
}

class LastNameFieldModule extends StatelessWidget {
  const LastNameFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.lastNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateLastName(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Last Name',
        context: context,
      ),
    );
  }
}

class GenderFieldModule extends StatelessWidget {
  const GenderFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.genderFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateGender(value!),
      decoration: signUpFormFieldDecoration(
        controller: screenController,
        hintText: 'Gender',
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
      //controller: screenController.addressFieldController,
      keyboardType: TextInputType.text,
      //validator: (value) => FieldValidator().validateAddress(value!),
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
    /*return TextFormField(
        controller: screenController.passwordFieldController,
        keyboardType: TextInputType.text,
        validator: (value) => FieldValidator().validatePassword(value!),
        decoration: signUpFormFieldDecoration(
          controller: screenController,
          hintText: 'Create Password',
          index: 1,
          context: context,
        ),
    );*/
    return Obx(
          ()=> TextFormField(
        controller: screenController.passwordFieldController,
        keyboardType: TextInputType.text,
        obscureText: screenController.isPasswordVisible.value,
        validator: (value) => FieldValidator().validatePassword(value!),
        decoration: signUpFormFieldDecoration(hintText: 'Password', index: 1, controller: screenController, context: context),
      ),
    );
  }
}

class CPasswordFieldModule extends StatelessWidget {
  const CPasswordFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        TextFormField(
        controller: screenController.cPasswordFieldController,
        keyboardType: TextInputType.text,
          obscureText: screenController.isRePasswordVisible.value,
        validator: (value) {
          if (value!.isEmpty) {
            return "Confirm Password is Required";
          } else if(value.length < 6){
            return "Password must be at least 6 characters";
          } else if(!value.contains(RegExp(r'[A-Z]'))){
            return "Password must be at least one upper case letter";
          } else if(!value.contains(RegExp(r"[a-z]"))){
            return "Password must be at least one lower case letter";
          } else if(!value.contains(RegExp(r"[0-9]"))){
            return "Password must be at least one alphabetical letter";
          } else if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
            return "Password must be at least one Special Character";
          } else if(screenController.passwordFieldController.text != screenController.cPasswordFieldController.text){
            return "Password and Confirm Password Should be Same";
          }
          else {
            return null;
          }
        },
        decoration: signUpFormFieldDecoration(
          controller: screenController,
          hintText: 'Re-enter Password',
          index: 3,
          context: context,
        ),
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
      //controller: screenController.countryFieldController,
      keyboardType: TextInputType.text,
      //validator: (value) => FieldValidator().validateFullName(value!),
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
      validator: (value) => FieldValidator().validateState(value!),
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
      validator: (value) => FieldValidator().validateCity(value!),
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
      onTap: () async {
        if(screenController.signUpFormKey.currentState!.validate()){
          await screenController.userSignUpFunction(
              /*firstName: screenController.nameFieldController.text.trim(),
              lastName: screenController.lastNameFieldController.text.trim(),
              state: screenController.stateFieldController.text.trim(),
              city: screenController.cityFieldController.text.trim(),
            email: screenController.emailFieldController.text.trim(),
            password: screenController.passwordFieldController.text.trim(),
            mobile: screenController.mobileFieldController.text.trim()*/
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
          onTap: () {
            Get.to(() => VendorSignUpScreen());
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
