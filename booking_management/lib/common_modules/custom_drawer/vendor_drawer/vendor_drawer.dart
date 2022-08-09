import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/custom_drawer/vendor_drawer/vendor_drawer_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_ui/common_controller/custom_drawer_controller/custom_drawer_controller.dart';
import 'package:expandable/expandable.dart';
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(AppImages.profileImg, scale: 1),
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
                      //todo
                      const SizedBox(height: 10),
                      VendorDrawerSingleItemModule(
                        img: AppImages.profileImg,
                        name: 'Settings',
                        vendorDrawerOption: VendorDrawerOption.profile,
                      ),
                      const SizedBox(height: 20),

                      VendorDrawerSingleItemModule(
                        img: AppImages.profileImg,
                        name: 'Bank Details',
                        vendorDrawerOption: VendorDrawerOption.bankAccountInfo,
                      ),
                      const SizedBox(height: 20),

                      VendorDrawerSingleItemModule(
                        img: AppImages.resourcesImg,
                        name: 'Business Hours',
                        vendorDrawerOption: VendorDrawerOption.availableTime,
                      ),
                      const SizedBox(height: 20),

                      VendorDrawerSingleItemModule(
                        img: AppImages.resourcesImg,
                        name: 'Business Document',
                        vendorDrawerOption: VendorDrawerOption.businessDocument,
                      ),
                      const SizedBox(height: 20),

                      VendorDrawerSingleItemModule(
                        img: AppImages.resourcesImg,
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
                img: AppImages.resourcesImg,
                name: 'Add Resources',
                vendorDrawerOption: VendorDrawerOption.resources,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Resource Schedule',
                vendorDrawerOption: VendorDrawerOption.scheduleTime,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Schedule Management',
                vendorDrawerOption: VendorDrawerOption.scheduleManagement,
              ),
              const SizedBox(height: 20),

              UserDetails.isServiceSlot
                  ? VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Manage Services',
                vendorDrawerOption: VendorDrawerOption.services,
              )
                  : VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Manage Additional Slot',
                vendorDrawerOption: VendorDrawerOption.additionalSlot,
              ),
              const SizedBox(height: 20),

              /// Appointment report
              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Appointment Report',
                vendorDrawerOption: VendorDrawerOption.appointmentReport,
              ),
              const SizedBox(height: 20),

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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(AppImages.profileImg, scale: 1),
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
                        img: AppImages.subscriptionsImg,
                        name: 'Manage',
                        vendorDrawerOption: VendorDrawerOption.subscription,
                      ),
                      const SizedBox(height: 20),

                      VendorDrawerSingleItemModule(
                        img: AppImages.resourcesImg,
                        name: 'Subscription Report',
                        vendorDrawerOption: VendorDrawerOption.subscriptionReport,
                      ),
                      const SizedBox(height: 20),

                      const SizedBox(height: 10),

                    ],
                  ).commonAllSidePadding(5),
                ),
              ),
              const SizedBox(height: 20),


              VendorDrawerSingleItemModule(
                img: AppImages.changePasswordImg,
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
