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
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              UserDetails.isUserLoggedIn == true
                  ? CustomerDrawerSingleItemModule(
                      img: AppImages.profileSvgLogo,
                      name: 'Profile',
                      customerDrawerOption: CustomerDrawerOption.profile,
                    )
                  : Container(),
              // UserDetails.isUserLoggedIn == true
              //     ? const SizedBox(height: 20)
              //     : Container(),

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

              /*UserDetails.isUserLoggedIn == true
              ? CustomerDrawerSingleItemModule(
                img: AppImages.bookingHistoryImg,
                name: 'Favourites',
                customerDrawerOption: CustomerDrawerOption.favourites,
              )
              : Container(),
              const SizedBox(height: 20),*/

              // UserDetails.isUserLoggedIn == true
              //     ? CustomerDrawerSingleItemModule(
              //         img: AppImages.bookingHistoryImg,
              //         name: 'Booking History',
              //         customerDrawerOption: CustomerDrawerOption.bookingHistory,
              //       )
              //     : Container(),
              UserDetails.isUserLoggedIn == true
                  ? const SizedBox(height: 20)
                  : Container(),

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
                      img: AppImages.scheduleManageSvgLogo,
                      name: 'Transactions',
                      customerDrawerOption: CustomerDrawerOption.transaction,
                    )
                  : Container(),
              UserDetails.isUserLoggedIn == true
                  ? const SizedBox(height: 20)
                  : Container(),

              // CustomerDrawerSingleItemModule(
              //   img: AppImages.helpImg,
              //   name: 'Help',
              //   customerDrawerOption: CustomerDrawerOption.help,
              // ),
              // const SizedBox(height: 20),

              UserDetails.isUserLoggedIn == true
                  ? CustomerDrawerSingleItemModule(
                      img: AppImages.changePassSvgLogo,
                      name: 'Change Password',
                      customerDrawerOption: CustomerDrawerOption.changePassword,
                    )
                  : Container(),
              UserDetails.isUserLoggedIn == true
                  ? const SizedBox(height: 20)
                  : Container(),

              CustomerDrawerSingleItemModule(
                img: AppImages.termsAndCondSvgLogo,
                name: 'Terms And Conditions',
                customerDrawerOption: CustomerDrawerOption.termsAndCondition,
              ),
              const SizedBox(height: 20),

              CustomerDrawerSingleItemModule(
                img: AppImages.privacyPolicySvgLogo,
                name: 'Privacy Policy',
                customerDrawerOption: CustomerDrawerOption.privacyPolicy,
              ),

              const SizedBox(height: 20),
              UserDetails.isUserLoggedIn == true
                  ? CustomerDrawerSingleItemModule(
                      img: AppImages.logoutSvgLogo,
                      name: 'Logout',
                      customerDrawerOption: CustomerDrawerOption.logOut,
                    )
                  : CustomerDrawerSingleItemModule(
                      img: AppImages.loginSvgLogo,
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
