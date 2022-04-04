import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
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

class BusinessTypeModule extends StatelessWidget {
  const BusinessTypeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(

          width: Get.width,
          //padding: const EdgeInsets.only(right: 10),
          height: 45,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          //   boxShadow: [
          //     BoxShadow(
          //       color: AppColors.colorLightGrey.withOpacity(0.5),
          //       blurRadius: 5,
          //       //spreadRadius: 5,
          //       blurStyle: BlurStyle.outer,
          //     ),
          //   ],
          // ),
          child: InputDecorator(
            decoration: const InputDecoration(
                //labelStyle: textStyle,
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                hintText: 'Please select business',
                //border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2, color: Colors.black,),
                isExpanded: true,
                focusColor: Colors.white,
                value: screenController.businessType.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorLightGrey),
                iconEnabledColor: Colors.black,
                items: <String>[
                  'Business',
                  'Business1',
                  'Business2'
                ].
                map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }).toList(),
                hint: Text("Business Type", style: TextStyle(color: Colors.grey),),
                onChanged: (newValue) {
                  screenController.businessType.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }
}

class UserNameModule extends StatelessWidget {
  const UserNameModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.firstNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateUserName(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'User Name', controller: screenController),
    );
  }
}

class LastNameModule extends StatelessWidget {
  const LastNameModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.lastNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateLastName(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Last Name', controller: screenController),
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
      validator: (value) => FieldValidator().validateBusinessName(value!),
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

class BusinessAddress1FieldModule extends StatelessWidget {
  const BusinessAddress1FieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessAddress1FieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateAddress1(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Address1', controller: screenController),
    );
  }
}

class BusinessAddress2FieldModule extends StatelessWidget {
  const BusinessAddress2FieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessAddress2FieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateAddress2(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Address2', controller: screenController),
    );
  }
}

class StreetFieldModule extends StatelessWidget {
  const StreetFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.streetFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateStreet(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Street', controller: screenController),
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
      decoration: vendorSignUpFormFieldDecoration(hintText: 'State', controller: screenController),
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
      validator: (value) => FieldValidator().validateCountryName(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Country', controller: screenController),
    );
  }
}

class PostCodeFieldModule extends StatelessWidget {
  const PostCodeFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.postCodeFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validatePostCode(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Post Code', controller: screenController),
    );
  }
}

class SuburbFieldModule extends StatelessWidget {
  const SuburbFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.subUrbFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateSuburb(value!),
      decoration: vendorSignUpFormFieldDecoration(hintText: 'Sub urb', controller: screenController),
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
            hintText: 'Create Password',
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
        decoration: vendorSignUpFormFieldDecoration(
            hintText: 'Re-enter Password',
            controller: screenController,
          index: 3,
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
      onTap: () async{
        if(screenController.vendorSignUpFormKey.currentState!.validate()){
          await screenController.vendorSignUpFunction();
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
