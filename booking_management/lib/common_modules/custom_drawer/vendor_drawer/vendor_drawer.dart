import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_drawer/vendor_drawer/vendor_drawer_widgets.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

import '../../constants/app_images.dart';


class VendorDrawer extends StatelessWidget {
  const VendorDrawer({Key? key}) : super(key: key);

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
                name: 'Profile',
                vendorDrawerOption: VendorDrawerOption.profile,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'My Customer',
                vendorDrawerOption: VendorDrawerOption.myCustomer,
              ),
              const SizedBox(height: 20),

              /*VendorDrawerSingleItemModule(
                img: AppImages.chatImg,
                name: 'Chat',
                vendorDrawerOption: VendorDrawerOption.chat,
              ),
              const SizedBox(height: 20),*/

              VendorDrawerSingleItemModule(
                img: AppImages.bookingHistoryImg,
                name: 'Booking History',
                vendorDrawerOption: VendorDrawerOption.bookingHistory,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.paymentImg,
                name: 'Wallet',
                vendorDrawerOption: VendorDrawerOption.wallet,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Resources',
                vendorDrawerOption: VendorDrawerOption.resources,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Services',
                vendorDrawerOption: VendorDrawerOption.services,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Additional Slot',
                vendorDrawerOption: VendorDrawerOption.additionalSlot,
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
                name: 'Review',
                vendorDrawerOption: VendorDrawerOption.review,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Schedule Time',
                vendorDrawerOption: VendorDrawerOption.scheduleTime,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Available Time',
                vendorDrawerOption: VendorDrawerOption.availableTime,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.resourcesImg,
                name: 'Invoices',
                vendorDrawerOption: VendorDrawerOption.invoices,
              ),
              const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.subscriptionsImg,
                name: 'Subscriptions',
                vendorDrawerOption: VendorDrawerOption.subscription,
              ),
              const SizedBox(height: 20),

              // VendorDrawerSingleItemModule(
              //   img: AppImages.helpImg,
              //   name: 'Help',
              //   vendorDrawerOption: VendorDrawerOption.help,
              // ),
              // const SizedBox(height: 20),

              VendorDrawerSingleItemModule(
                img: AppImages.changePasswordImg,
                name: 'Change Password',
                vendorDrawerOption: VendorDrawerOption.changePassword,
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
