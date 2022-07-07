import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_ui/common_controller/custom_drawer_controller/custom_drawer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_images.dart';
import '../../constants/enums.dart';
import 'customer_drawer_widgets.dart';


class CustomerDrawer extends StatelessWidget {
  CustomerDrawer({Key? key}) : super(key: key);
  final customDrawerController = Get.put(CustomDrawerController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              UserDetails.isUserLoggedIn == true
              ? CustomerDrawerSingleItemModule(
                img: AppImages.profileImg,
                name: 'Profile',
                customerDrawerOption: CustomerDrawerOption.profile,
              )
              : Container(),
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

              UserDetails.isUserLoggedIn == true
              ? CustomerDrawerSingleItemModule(
                img: AppImages.bookingHistoryImg,
                name: 'Favourites',
                customerDrawerOption: CustomerDrawerOption.favourites,
              )
              : Container(),
              const SizedBox(height: 20),

              UserDetails.isUserLoggedIn == true
              ? CustomerDrawerSingleItemModule(
                img: AppImages.bookingHistoryImg,
                name: 'Booking History',
                customerDrawerOption: CustomerDrawerOption.bookingHistory,
              )
              : Container(),
              const SizedBox(height: 20),

              // UserDetails.isUserLoggedIn == true
              // ? CustomerDrawerSingleItemModule(
              //   img: AppImages.paymentImg,
              //   name: 'Payment',
              //   customerDrawerOption: CustomerDrawerOption.payment,
              // )
              // : Container(),
              // const SizedBox(height: 20),

              UserDetails.isUserLoggedIn == true
                  ? CustomerDrawerSingleItemModule(
                img: AppImages.paymentImg,
                name: 'Transaction',
                customerDrawerOption: CustomerDrawerOption.transaction,
              )
                  : Container(),
              const SizedBox(height: 20),

              // CustomerDrawerSingleItemModule(
              //   img: AppImages.helpImg,
              //   name: 'Help',
              //   customerDrawerOption: CustomerDrawerOption.help,
              // ),
              // const SizedBox(height: 20),

              UserDetails.isUserLoggedIn == true
              ? CustomerDrawerSingleItemModule(
                img: AppImages.changePasswordImg,
                name: 'Change Password',
                customerDrawerOption: CustomerDrawerOption.changePassword,
              )
              : Container(),
              const SizedBox(height: 20),

              CustomerDrawerSingleItemModule(
                img: AppImages.changePasswordImg,
                name: 'Terms And Condition',
                customerDrawerOption: CustomerDrawerOption.termsAndCondition,
              ),
              const SizedBox(height: 20),

              CustomerDrawerSingleItemModule(
                img: AppImages.changePasswordImg,
                name: 'Privacy Policy',
                customerDrawerOption: CustomerDrawerOption.privacyPolicy,
              ),

              const SizedBox(height: 20),
              UserDetails.isUserLoggedIn == true
                  ? CustomerDrawerSingleItemModule(
                img: AppImages.logoutImg,
                name: 'Logout',
                customerDrawerOption: CustomerDrawerOption.logOut,
              )
              : CustomerDrawerSingleItemModule(
                img: AppImages.logoutImg,
                name: 'Login',
                customerDrawerOption: CustomerDrawerOption.login,
              ),
              const SizedBox(height: 20),

            ],
          ).commonAllSidePadding(15),
        ),
      ),
    );
  }
}
