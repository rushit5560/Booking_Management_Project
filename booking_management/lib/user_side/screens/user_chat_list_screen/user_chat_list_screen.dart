import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/user_side/screens/user_conversation_screen/user_conversation_screen.dart';
import 'package:flutter/material.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../controllers/user_chat_list_screen_controller/user_chat_list_screen_controller.dart';
import '../../model/user_chat_list_screen_model/user_chat_list_screen_model.dart';



class UserChatListScreen extends StatelessWidget {
  UserChatListScreen({Key? key}) : super(key: key);
  final userChatListScreenController = Get.put(UserChatListScreenController());

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
                stream: userChatListScreenController.getChatRoomListFunction(),
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
              /*child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, i) {
                  return _chatListTile();
                },
              ).commonAllSidePadding(20),*/
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
        onTap: () => Get.to(()=> UserConversationScreen(),
            transition: Transition.zoom,
            arguments: [
              singleMsg.roomId,
              singleMsg.peerId,
              singleMsg.peerName,
              // screenController.userChatList,
            ]),
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
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /*Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.vendorImg),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),*/
                      // const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              singleMsg.peerName!,
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
