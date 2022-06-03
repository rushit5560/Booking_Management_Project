import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';

import '../../constants/app_images.dart';
import '../../constants/enums.dart';
import 'customer_drawer_widgets.dart';


class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [

              CustomerDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'Profile',
                customerDrawerOption: CustomerDrawerOption.profile,
              ),
              const SizedBox(height: 20),

              /*CustomerDrawerSingleItemModule(
                img: AppImages.chatImg,
                name: 'Chat',
                customerDrawerOption: CustomerDrawerOption.chat,
              ),
              const SizedBox(height: 20),*/

              /*CustomerDrawerSingleItemModule(
                img: AppImages.bookingHistoryImg,
                name: 'Order History',
                customerDrawerOption: CustomerDrawerOption.orderList,
              ),
              const SizedBox(height: 20),*/

              CustomerDrawerSingleItemModule(
                img: AppImages.bookingHistoryImg,
                name: 'Favourites',
                customerDrawerOption: CustomerDrawerOption.favourites,
              ),
              const SizedBox(height: 20),

              CustomerDrawerSingleItemModule(
                img: AppImages.bookingHistoryImg,
                name: 'Booking History',
                customerDrawerOption: CustomerDrawerOption.bookingHistory,
              ),
              const SizedBox(height: 20),

              CustomerDrawerSingleItemModule(
                img: AppImages.paymentImg,
                name: 'Payment',
                customerDrawerOption: CustomerDrawerOption.payment,
              ),
              const SizedBox(height: 20),

              CustomerDrawerSingleItemModule(
                img: AppImages.helpImg,
                name: 'Help',
                customerDrawerOption: CustomerDrawerOption.help,
              ),
              const SizedBox(height: 20),

              CustomerDrawerSingleItemModule(
                img: AppImages.changePasswordImg,
                name: 'Change Password',
                customerDrawerOption: CustomerDrawerOption.changePassword,
              ),
              const SizedBox(height: 20),

              CustomerDrawerSingleItemModule(
                img: AppImages.logoutImg,
                name: 'Logout',
                customerDrawerOption: CustomerDrawerOption.logOut,
              ),
              const SizedBox(height: 20),

            ],
          ).commonAllSidePadding(15),
        ),
      ),
    );
  }
}
