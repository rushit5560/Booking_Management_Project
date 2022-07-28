import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../../user_side/model/user_chat_list_screen_model/user_chat_list_screen_model.dart';
import '../../../user_side/screens/user_conversation_screen/user_conversation_screen.dart';
import '../../controllers/vendor_chat_list_screen_controller/vendor_chat_list_screen_controller.dart';

class VendorChatListScreen extends StatelessWidget {
  VendorChatListScreen({Key? key}) : super(key: key);
  final vendorChatListScreenController =
      Get.put(VendorChatListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CommonAppBarModule(
              title: 'Chat',
              appBarOption: AppBarOption.none,
            ),
            // Expanded(
            //   child: const VendorChatList().commonAllSidePadding(20),
            // ),
            Expanded(
              child: StreamBuilder<List<UserChatRoomListModel>>(
                stream:
                    vendorChatListScreenController.getChatRoomListFunction(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong! ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    final chatList = snapshot.data;
                    return ListView.builder(
                      itemCount: chatList!.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, i) {
                        UserChatRoomListModel singleMsg = chatList[i];

                        return _chatListTile(singleMsg);
                      },
                    ).commonAllSidePadding(15);
                    // return ListView(
                    //   physics: const BouncingScrollPhysics(),
                    //   children: categories!.map((val) {
                    //     return categoryListTile(val).commonSymmetricPadding(horizontal: 8, vertical: 6);
                    //   }).toList(),
                    // ).commonAllSidePadding(padding: 15);
                  } else {
                    return const CustomCircularLoaderModule();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatListTile(UserChatRoomListModel singleMsg) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          String oppositeUserUniqueId = "";
          if (UserDetails.roleName == "Customer") {
            oppositeUserUniqueId = singleMsg.vendorid!;
          } else {
            oppositeUserUniqueId = singleMsg.customerid!;
          }

          Get.to(() => UserConversationScreen(),
              transition: Transition.zoom,
              arguments: [
                singleMsg.roomId,
                singleMsg.peerId,
                singleMsg.createdName,
                oppositeUserUniqueId,
              ]);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 5,
                color: Colors.grey.shade300,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(15),
                            // image: const DecorationImage(
                            //   image: AssetImage(AppImages.vendorImg),
                            //   fit: BoxFit.cover,
                            // ),
                            ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: FutureBuilder<String>(
                            future: vendorChatListScreenController
                                .getUserChatImage(singleMsg.customerid!),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Image.network(
                                  ApiUrl.apiImagePath + snapshot.data!,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(AppImages.profileImg);
                                  },
                                );
                              }
                              return Container(
                                padding: const EdgeInsets.all(8),
                                child: CircularProgressIndicator(
                                  color: AppColors.accentColor,
                                ),
                              );
                            },
                          ),

                          //  Image.network(
                          //   ApiUrl.apiImagePath + singleMsg.img!,
                          //   // errorBuilder: (context, error, stackTrace) {
                          //   //   return Image.asset(AppImages.profileImg);
                          //   // },
                          // ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              singleMsg.createdName!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // const SizedBox(height: 5),
                            // Text(
                            //   'Lorem Ipsum dummy Text for printing',
                            //   maxLines: 1,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: TextStyle(fontSize: 11),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // const Text(
                //   '12:00 PM',
                //   style: TextStyle(fontSize: 11),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
