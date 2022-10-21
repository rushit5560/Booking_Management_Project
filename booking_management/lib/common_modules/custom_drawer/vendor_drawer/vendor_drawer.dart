import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/custom_drawer/vendor_drawer/vendor_drawer_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_ui/common_controller/custom_drawer_controller/custom_drawer_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              // My Business Collapse menu
              Container(
                // height: 40,
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
                child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.profileSvgLogo,
                          height: 20,
                          width: 20,
                          color: AppColors.blackColor,
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: Text(
                            "My Business",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Column(
                    children: [
                      const SizedBox(height: 10),
                      VendorDrawerSingleItemModule(
                        img: AppImages.settingsSvgLogo,
                        name: 'Settings',
                        vendorDrawerOption: VendorDrawerOption.profile,
                      ),
                      const SizedBox(height: 20),
                      VendorDrawerSingleItemModule(
                        img: AppImages.bankDetailsSvgLogo,
                        name: 'Bank Details',
                        vendorDrawerOption: VendorDrawerOption.bankAccountInfo,
                      ),
                      const SizedBox(height: 20),
                      VendorDrawerSingleItemModule(
                        img: AppImages.businessHoursSvgLogo,
                        name: 'Business Hours',
                        vendorDrawerOption: VendorDrawerOption.availableTime,
                      ),
                      const SizedBox(height: 20),
                      VendorDrawerSingleItemModule(
                        img: AppImages.businessDocSvgLogo,
                        name: 'Business Document',
                        vendorDrawerOption: VendorDrawerOption.businessDocument,
                      ),
                      const SizedBox(height: 20),
                      VendorDrawerSingleItemModule(
                        img: AppImages.businessReviewSvgLogo,
                        name: 'Reviews',
                        vendorDrawerOption: VendorDrawerOption.review,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ).commonAllSidePadding(5),
                ),
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.addResourceSvgLogo,
                name: 'Add Resources',
                vendorDrawerOption: VendorDrawerOption.resources,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourceScheduleSvgLogo,
                name: 'Resource Schedule',
                vendorDrawerOption: VendorDrawerOption.scheduleTime,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.scheduleManageSvgLogo,
                name: 'Schedule Management',
                vendorDrawerOption: VendorDrawerOption.scheduleManagement,
              ),
              const SizedBox(height: 20),

              UserDetails.isServiceSlot
                  ? VendorDrawerSingleItemModule(
                      img: AppImages.manageServicesSvgLogo,
                      name: 'Manage Services',
                      vendorDrawerOption: VendorDrawerOption.services,
                    )
                  : VendorDrawerSingleItemModule(
                      img: AppImages.additionalSlotSvgLogo,
                      name: 'Manage Additional Slot',
                      vendorDrawerOption: VendorDrawerOption.additionalSlot,
                    ),
              const SizedBox(height: 20),

              /// Appointment report
              VendorDrawerSingleItemModule(
                img: AppImages.appointReportSvgLogo,
                name: 'Appointment Report',
                vendorDrawerOption: VendorDrawerOption.appointmentReport,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.profileSvgLogo,
                name: 'My Customer',
                vendorDrawerOption: VendorDrawerOption.customerReport,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.invoiceSvgLogo,
                name: 'Invoices',
                vendorDrawerOption: VendorDrawerOption.invoiceReport,
              ),
              const SizedBox(height: 20),

              Container(
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
                child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.subscriptionsSvgLogo,
                          height: 20,
                          width: 20,
                          color: AppColors.blackColor,
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: Text(
                            "Subscriptions",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  collapsed: Container(),
                  expanded: Column(
                    children: [
                      const SizedBox(height: 10),
                      VendorDrawerSingleItemModule(
                        img: AppImages.scheduleManageSvgLogo,
                        name: 'Manage',
                        vendorDrawerOption: VendorDrawerOption.subscription,
                      ),
                      const SizedBox(height: 20),
                      VendorDrawerSingleItemModule(
                        img: AppImages.appointReportSvgLogo,
                        name: 'Subscription Report',
                        vendorDrawerOption:
                            VendorDrawerOption.subscriptionReport,
                      ),
                      // const SizedBox(height: 20),
                      const SizedBox(height: 10),
                    ],
                  ).commonAllSidePadding(5),
                ),
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.changePassSvgLogo,
                name: 'Change Password',
                vendorDrawerOption: VendorDrawerOption.changePassword,
              ),
              const SizedBox(height: 20),

              /// OLD

              /// Customer report
              /* VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Customer Report',
                vendorDrawerOption: VendorDrawerOption.customerReport,
              ),
              const SizedBox(height: 20),*/

              /// Invoice report
              /*VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Invoice Report',
                vendorDrawerOption: VendorDrawerOption.invoiceReport,
              ),
              const SizedBox(height: 20),*/

              VendorDrawerSingleItemModule(
                img: AppImages.termsAndCondSvgLogo,
                name: 'Terms & Conditions',
                vendorDrawerOption: VendorDrawerOption.termsAndCondition,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.privacyPolicySvgLogo,
                name: 'Privacy Policy',
                vendorDrawerOption: VendorDrawerOption.privacyPolicy,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.logoutSvgLogo,
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
