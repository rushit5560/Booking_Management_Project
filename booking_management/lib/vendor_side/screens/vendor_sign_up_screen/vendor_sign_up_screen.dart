import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/vendor_side/screens/vendor_wallet_screen/vendor_wallet_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../controllers/vendor_sign_up_screen_controller/vendor_sign_up_screen_controller.dart';
import 'vendor_sign_up_screen_widgets.dart';

class VendorSignUpScreen extends StatelessWidget {
  VendorSignUpScreen({Key? key}) : super(key: key);
  final vendorSignUpScreenController = Get.put(VendorSignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: vendorSignUpScreenController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.accentColor,
                  ),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: vendorSignUpScreenController.vendorSignUpFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // From Common Widgets
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [HeaderLogoModule()],
                        ),
                        const SizedBox(height: 20),
                        // From Common Widgets
                        const HeaderTextModule(name: "Sign Up"),
                        const SizedBox(height: 20),

                        //AddPhotosModule(),
                        //SizedBox(height: 12),
                        //PhotoTextModule(),
                        //SizedBox(height: 30),
                        // BusinessTypeModule(),
                        // SizedBox(height: 5),
                        UserNameModule(),
                        const SizedBox(height: 5),
                        FullNameModule(),
                        const SizedBox(height: 5),
                        EmailFieldModule(),
                        const SizedBox(height: 5),
                        MobileFieldModule(),

                        BusinessIdFieldModule(),
                        //SizedBox(height: 5),
                        BusinessNameFieldModule(),

                        // SizedBox(height: 5),
                        // MobileFieldModule(),
                        // SizedBox(height: 5),
                        // BusinessAddress1FieldModule(),
                        // SizedBox(height: 5),
                        // BusinessAddress2FieldModule(),
                        // SizedBox(height: 5),
                        // StreetFieldModule(),
                        // SizedBox(height: 5),
                        // StateFieldModule(),
                        // SizedBox(height: 5),
                        // CountryFieldModule(),
                        // SizedBox(height: 5),
                        // PostCodeFieldModule(),
                        // SizedBox(height: 5),
                        // SuburbFieldModule(),
                        // SizedBox(height: 5),

                        const SizedBox(height: 5),
                        PasswordFieldModule(),
                        const SizedBox(height: 5),
                        ConfirmPasswordFieldModule(),
                        const SizedBox(height: 20),
                        CountrySelectModule(),
                        const SizedBox(height: 20),
                        //VendorPortalCheckboxModule(),
                        TermsAndConditionCheckboxModule(),
                        vendorSignUpScreenController
                                    .selectedCountryCode.value ==
                                "IN"
                            ? Container()
                            : PriceCheckboxModule(),
                        AnyServiceCheckboxModule(),
                        const SizedBox(height: 20),
                        const TermsAndConditionText(),
                        const SizedBox(height: 25),
                        VendorSignUpButtonModule(),
                        const SizedBox(height: 25),
                        const SkipButton(),
                        const SizedBox(height: 25),
                        const CustomerSignUpTextModule(),
                        const SizedBox(height: 15),
                        const VendorSignInTextModule(),
                        const SizedBox(height: 5),
                      ],
                    ).commonAllSidePadding(20),
                  ),
                ),
        ),
      ),
    );
  }
}
