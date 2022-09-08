import 'dart:async';
import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_colors.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../../user_side/model/user_chat_list_screen_model/user_chat_list_screen_model.dart';
import '../../../user_side/screens/user_conversation_screen/user_conversation_screen.dart';
import '../../controllers/vendor_chat_list_screen_controller/vendor_chat_list_screen_controller.dart';

class VendorChatListScreen extends StatefulWidget {
  const VendorChatListScreen({Key? key}) : super(key: key);

  @override
  State<VendorChatListScreen> createState() => _VendorChatListScreenState();
}

class _VendorChatListScreenState extends State<VendorChatListScreen> {
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
            Expanded(
              child: StreamBuilder<List<UserChatRoomListModel>>(
                stream:
                    vendorChatListScreenController.getChatRoomListFunction(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong! ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    final chatList = snapshot.data;
                    return chatList!.isEmpty
                        ? const Center(
                            child: Text("No chat data available"),
                          )
                        : RefreshIndicator(
                            triggerMode: RefreshIndicatorTriggerMode.anywhere,
                            onRefresh: () async {
                              setState(() {});
                              vendorChatListScreenController
                                  .getChatRoomListFunction();
                            },
                            child: ListView.builder(
                              itemCount: chatList.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, i) {
                                UserChatRoomListModel singleMsg = chatList[i];

                                return _chatListTile(singleMsg);
                              },
                            ).commonAllSidePadding(15),
                          );
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
                singleMsg.customerid,
                singleMsg.createdBy,
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
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
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
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  padding: EdgeInsets.all(15),
                                  child: CircularProgressIndicator(
                                    color: AppColors.accentColor,
                                    strokeWidth: 2,
                                  ),
                                );
                              } else if (snapshot.hasData) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    ApiUrl.apiImagePath + snapshot.data!,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(AppImages.profileImg);
                                    },
                                  ),
                                );
                              }
                              return Container(
                                padding: EdgeInsets.all(15),
                                child: CircularProgressIndicator(
                                  color: AppColors.accentColor,
                                  strokeWidth: 2,
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
                // FutureBuilder(
                //   future: FirebaseFirestore.instance
                //       .collection('Chats')
                //       .where('room_id', isEqualTo: singleMsg.roomId)
                //       .where('seen', isEqualTo: false)
                //       .get(),
                //   builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                //     Widget widget = Container();
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return const CustomCircularLoaderModule();
                //     } else if (snapshot.hasData) {
                //       var data = snapshot.data!.docs;

                //       for (var element in data) {
                //         Map usrData = element.data() as Map;
                //         // print(usrData);
                //         print("seen value is :  ${usrData["seen"]}");

                //         if (usrData["seen"] == false) {
                //           widget = Container(
                //             height: 12,
                //             width: 12,
                //             margin: const EdgeInsets.only(right: 8),
                //             decoration: const BoxDecoration(
                //               color: Colors.green,
                //               shape: BoxShape.circle,
                //             ),
                //           );
                //         }
                //       }
                //     }
                //     return widget;
                //   },
                // ),

                FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('Chats')
                      .where('room_id', isEqualTo: singleMsg.roomId)
                      .where('seen', isEqualTo: false)
                      .get(),
                  builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                    Widget widget = Container();

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox();
                    } else if (snapshot.hasData) {
                      var data = snapshot.data!.docs;

                      var msgCount = 0;

                      for (var element in data) {
                        Map usrData = element.data() as Map;
                        // print(usrData);
                        print("seen value is :  ${usrData["seen"]}");

                        if (usrData["seen"] == false) {
                          msgCount++;
                          widget = Container(
                            height: 25,
                            width: 25,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                msgCount.toString(),
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    }
                    return widget;
                  },
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
