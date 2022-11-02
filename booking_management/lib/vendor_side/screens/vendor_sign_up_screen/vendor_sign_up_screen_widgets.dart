import 'dart:developer';

import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/user_side/model/vendor_details_screen_models/country_model.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:booking_management/vendor_side/screens/terms_and_condition_screen/terms_and_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../common_modules/container_decorations.dart';
import '../../../common_modules/field_decorations.dart';
import '../../../common_modules/field_validation.dart';
import '../../../common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import '../../../user_side/screens/user_sign_up_screen/user_sign_up_screen.dart';
import '../../controllers/vendor_sign_up_screen_controller/vendor_sign_up_screen_controller.dart';

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
  BusinessTypeModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
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
              icon: Image.asset(
                AppImages.dropDownArrowImg,
                scale: 2,
                color: Colors.black,
              ),
              isExpanded: true,
              focusColor: Colors.white,
              value: screenController.businessType.value,
              //elevation: 5,
              style: TextStyle(color: AppColors.colorLightGrey),
              iconEnabledColor: Colors.black,
              items: <String>['Business', 'Business1', 'Business2']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              }).toList(),
              hint: const Text(
                "Business Type",
                style: TextStyle(color: Colors.grey),
              ),
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
  UserNameModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.userNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateUserName(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'User Name', controller: screenController),
    );
  }
}

class FullNameModule extends StatelessWidget {
  FullNameModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.fullNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Full Name', controller: screenController),
    );
  }
}

class LastNameModule extends StatelessWidget {
  LastNameModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.lastNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateLastName(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Last Name', controller: screenController),
    );
  }
}

class BusinessNameFieldModule extends StatelessWidget {
  BusinessNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessNameFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateBusinessName(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Business Name', controller: screenController),
    );
  }
}

class EmailFieldModule extends StatelessWidget {
  EmailFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.emailFieldController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Email', controller: screenController),
    );
  }
}

class MobileFieldModule extends StatelessWidget {
  MobileFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.mobileFieldController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        LengthLimitingTextInputFormatter(12),
      ],
      validator: (value) => FieldValidator().validateMobile(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Mobile', controller: screenController),
    );
  }
}

class BusinessAddress1FieldModule extends StatelessWidget {
  BusinessAddress1FieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessAddress1FieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateAddress1(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Address1', controller: screenController),
    );
  }
}

class BusinessAddress2FieldModule extends StatelessWidget {
  BusinessAddress2FieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessAddress2FieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateAddress2(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Address2', controller: screenController),
    );
  }
}

class StreetFieldModule extends StatelessWidget {
  StreetFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.streetFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateStreet(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Street', controller: screenController),
    );
  }
}

class StateFieldModule extends StatelessWidget {
  StateFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.stateFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateState(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'State', controller: screenController),
    );
  }
}

class CountryFieldModule extends StatelessWidget {
  CountryFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.countryFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateCountryName(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Country', controller: screenController),
    );
  }
}

class PostCodeFieldModule extends StatelessWidget {
  PostCodeFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.postCodeFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validatePostCode(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Post Code', controller: screenController),
    );
  }
}

class SuburbFieldModule extends StatelessWidget {
  SuburbFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.subUrbFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateSuburb(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Sub urb', controller: screenController),
    );
  }
}

class BusinessIdFieldModule extends StatelessWidget {
  BusinessIdFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.businessIdFieldController,
      keyboardType: TextInputType.text,
      validator: (value) => FieldValidator().validateBusinessId(value!),
      decoration: vendorSignUpFormFieldDecoration(
          hintText: 'Business ID', controller: screenController),
    );
  }
}

class PasswordFieldModule extends StatelessWidget {
  PasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
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

class CountrySelectModule extends StatelessWidget {
  CountrySelectModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(
        //   "Country :",
        //   style: TextStyle(
        //     fontSize: 16,
        //     color: AppColors.colorGreyIconDark,
        //   ),
        // ),
        // const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CountryData>(
                // Initial Value
                value: screenController.countryData,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                style: const TextStyle(color: Colors.black),
                isExpanded: true,
                // Array list of items
                items: screenController.countriesList.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.country!),
                  );
                }).toList(),

                // screenController.countriesList.map((String items) {
                //   return DropdownMenuItem(
                //     value: items,
                //     child: Text(items),
                //   );
                // }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (newValue) {
                  screenController.isLoading(true);
                  screenController.countryData = newValue!;
                  // log("countryData : ${screenController.countryData!.code}");
                  screenController.selectedCountryCode.value =
                      "${screenController.countryData!.code}";

                  if (screenController.countryData!.code == "IN") {
                    screenController.priceCheckBox.value = false;
                  }
                  screenController.isLoading(false);
                },
              ),
            ).commonSymmetricPadding(horizontal: 10),
          ),
        ),
      ],
    );

    // Obx(
    //   () => TextFormField(
    //     controller: screenController.passwordFieldController,
    //     keyboardType: TextInputType.text,
    //     obscureText: screenController.isPasswordVisible.value,
    //     validator: (value) => FieldValidator().validatePassword(value!),
    //     decoration: vendorSignUpFormFieldDecoration(
    //       hintText: 'Password',
    //       controller: screenController,
    //       index: 1,
    //     ),
    //   ),
    // );
  }
}

class ConfirmPasswordFieldModule extends StatelessWidget {
  ConfirmPasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: screenController.cPasswordFieldController,
        keyboardType: TextInputType.text,
        obscureText: screenController.isCPasswordVisible.value,
        validator: (value) {
          if (value!.isEmpty) {
            return "Confirm Password is Required";
          } else if (value.length < 6) {
            return "Password must be at least 6 characters";
          } else if (!value.contains(RegExp(r'[A-Z]'))) {
            return "Password must be at least one upper case letter";
          } else if (!value.contains(RegExp(r"[a-z]"))) {
            return "Password must be at least one lower case letter";
          } else if (!value.contains(RegExp(r"[0-9]"))) {
            return "Password must be at least one alphabetical letter";
          } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            return "Password must be at least one Special Character";
          } else if (screenController.passwordFieldController.text !=
              screenController.cPasswordFieldController.text) {
            return "Password and Confirm Password Should be Same";
          } else {
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

class VendorPortalCheckboxModule extends StatelessWidget {
  VendorPortalCheckboxModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
              value: screenController.vendorPortal.value,
              activeColor: AppColors.colorGreyIconDark,
              onChanged: (bool? newValue) {
                //setState(() {
                screenController.vendorPortal.value = newValue!;
                //});
                const Text(
                  'Vendor Portal',
                  style: TextStyle(color: Colors.black),
                );
              }),
        ),
        const Text("Are You registering for Vendor portal?")
      ],
    );
  }
}

class TermsAndConditionCheckboxModule extends StatelessWidget {
  TermsAndConditionCheckboxModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
              value: screenController.termsAndConditionCheckBox.value,
              activeColor: AppColors.colorGreyIconDark,
              onChanged: (bool? newValue) {
                //setState(() {
                screenController.termsAndConditionCheckBox.value = newValue!;
                //});
                const Text(
                  'Resources',
                  style: TextStyle(color: Colors.black),
                );
              }),
        ),
        const Text("I agree to the sites terms and conditions")
      ],
    );
  }
}

class PriceCheckboxModule extends StatelessWidget {
  PriceCheckboxModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
              value: screenController.priceCheckBox.value,
              activeColor: AppColors.colorGreyIconDark,
              onChanged: (bool? newValue) {
                //setState(() {
                screenController.priceCheckBox.value = newValue!;
                //});
                const Text(
                  'Resources',
                  style: TextStyle(color: Colors.black),
                );
              }),
        ),
        const Text("Require payment integration ?")
      ],
    );
  }
}

class AnyServiceCheckboxModule extends StatelessWidget {
  AnyServiceCheckboxModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Checkbox(
              value: screenController.serviceCheckBox.value,
              activeColor: AppColors.colorGreyIconDark,
              onChanged: (bool? newValue) {
                //setState(() {
                screenController.serviceCheckBox.value = newValue!;
                //});
                const Text(
                  'Service',
                  style: TextStyle(color: Colors.black),
                );
              }),
        ),
        const Expanded(child: Text("Require additional sub-service management")),
        const SizedBox(width: 10),
        const Tooltip(
          message: "i.e: Hair cut under Salon, Kitchen under Cleaning",
          child: Icon(
            Icons.info,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class TermsAndConditionText extends StatelessWidget {
  const TermsAndConditionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(() => TermsAndConditionScreen());
        },
        child: const Text("Read our terms and conditions here",
            style: TextStyle(color: Colors.blue)));
  }
}

class VendorSignUpButtonModule extends StatelessWidget {
  VendorSignUpButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<VendorSignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    log(screenController.selectedCountryCode.value);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            if (screenController.vendorSignUpFormKey.currentState!.validate()) {
              if (screenController.selectedCountryCode.value == "SC") {
                Get.snackbar(
                  "Country Required",
                  "Please select your country region.",
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.only(bottom: 8, left: 5, right: 5),
                );
              } else if (screenController.termsAndConditionCheckBox.value ==
                  false) {
                Get.snackbar(
                  "Required Field",
                  "Please accept terms and conditions",
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.only(bottom: 8, left: 5, right: 5),
                );
              } else {
                await screenController.vendorSignUpFunction();
              }

              // else if (screenController.serviceCheckBox.value == false) {
              //   Get.snackbar(
              //     "Required Field",
              //     "Please accept additional sub-service field",
              //   );
              // }

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
                ]),
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
        ),
      ],
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

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
            Get.off(() => SignInScreen());
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
