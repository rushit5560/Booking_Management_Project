import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/custom_drawer/vendor_drawer/vendor_drawer_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_ui/common_controller/custom_drawer_controller/custom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_images.dart';

class VendorDrawer extends StatelessWidget {
  VendorDrawer({Key? key}) : super(key: key);
  final customDrawerController = Get.put(CustomDrawerController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              VendorDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'My Customer',
                vendorDrawerOption: VendorDrawerOption.myCustomer,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Invoices',
                vendorDrawerOption: VendorDrawerOption.invoices,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'Business Info',
                vendorDrawerOption: VendorDrawerOption.profile,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Business Timing',
                vendorDrawerOption: VendorDrawerOption.availableTime,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Add Resource',
                vendorDrawerOption: VendorDrawerOption.resources,
              ),
              const SizedBox(height: 20),

              UserDetails.isServiceSlot
                  ? VendorDrawerSingleItemModule(
                      img: AppImages.resourcesImg,
                      name: 'Add Services',
                      vendorDrawerOption: VendorDrawerOption.services,
                    )
                  : VendorDrawerSingleItemModule(
                      img: AppImages.resourcesImg,
                      name: 'Additional Slot',
                      vendorDrawerOption: VendorDrawerOption.additionalSlot,
                    ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Manage Resource',
                vendorDrawerOption: VendorDrawerOption.scheduleTime,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Schedule Management',
                vendorDrawerOption: VendorDrawerOption.scheduleManagement,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Reviews',
                vendorDrawerOption: VendorDrawerOption.review,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Business Document',
                vendorDrawerOption: VendorDrawerOption.businessDocument,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.subscriptionsImg,
                name: 'Subscriptions',
                vendorDrawerOption: VendorDrawerOption.subscription,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.changePasswordImg,
                name: 'Change Password',
                vendorDrawerOption: VendorDrawerOption.changePassword,
              ),
              const SizedBox(height: 20),

              /// Appointment report
              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Appointment Report',
                vendorDrawerOption: VendorDrawerOption.appointmentReport,
              ),
              const SizedBox(height: 20),

              /// Customer report
              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Customer Report',
                vendorDrawerOption: VendorDrawerOption.customerReport,
              ),
              const SizedBox(height: 20),

              /// Invoice report
              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Invoice Report',
                vendorDrawerOption: VendorDrawerOption.invoiceReport,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Subscription Report',
                vendorDrawerOption: VendorDrawerOption.subscriptionReport,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Terms & Condition',
                vendorDrawerOption: VendorDrawerOption.termsAndCondition,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Privacy Policy',
                vendorDrawerOption: VendorDrawerOption.privacyPolicy,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.logoutImg,
                name: 'Logout',
                vendorDrawerOption: VendorDrawerOption.logout,
              ),
            ],
          ).commonAllSidePadding(15),
        ),
      ),
    );
  }
}
