import 'dart:developer';

import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/app_images.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/custom_appbar/custom_appbar.dart';
import 'package:booking_management/user_side/screens/user_conversation_screen/user_conversation_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import '../../../common_modules/common_widgets.dart';
import '../../../common_modules/constants/app_colors.dart';
import '../../../common_modules/constants/user_details.dart';
import '../../controllers/user_chat_list_screen_controller/user_chat_list_screen_controller.dart';
import '../../model/user_chat_list_screen_model/user_chat_list_screen_model.dart';

class UserChatListScreen extends StatefulWidget {
  UserChatListScreen({Key? key}) : super(key: key);

  @override
  State<UserChatListScreen> createState() => _UserChatListScreenState();
}

class _UserChatListScreenState extends State<UserChatListScreen> {
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
              child: Obx(
                () => userChatListScreenController.isLoading.value
                    ? const CustomCircularLoaderModule()
                    : StreamBuilder<List<UserChatRoomListModel>>(
                        stream: userChatListScreenController
                            .getChatRoomListFunction(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                                "Something went wrong! ${snapshot.error}");
                          } else if (snapshot.hasData) {
                            final chatList = snapshot.data;
                            log(" chatlist len : ${chatList!.length.toString()}");

                            return chatList.isEmpty
                                ? const Center(
                                    child: Text("No chat data available"),
                                  )
                                : Scrollbar(
                                    child: RefreshIndicator(
                                      triggerMode:
                                          RefreshIndicatorTriggerMode.anywhere,
                                      onRefresh: () async {
                                        setState(() {});
                                        userChatListScreenController
                                            .getChatRoomListFunction();
                                      },
                                      child: ListView.builder(
                                        itemCount: chatList.length,
                                        shrinkWrap: true,
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          UserChatRoomListModel singleMsg =
                                              chatList[i];

                                          return _chatListTile(
                                              singleMsg, context);
                                        },
                                      ).commonAllSidePadding(15),
                                    ),
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

  Widget _chatListTile(UserChatRoomListModel singleMsg, BuildContext context) {
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

          //readAllMessage(context, singleMsg, singleMsg.roomId!);

          Get.to(() => UserConversationScreen(),
              transition: Transition.zoom,
              arguments: [
                singleMsg.roomId,
                singleMsg.peerId,
                singleMsg.peerName,
                oppositeUserUniqueId,
                singleMsg.customerid,
                singleMsg.createdBy,
                // screenController.userChatList,
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
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: FutureBuilder<String>(
                          future: userChatListScreenController
                              .getUserChatImage(singleMsg.vendorid!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                padding: const EdgeInsets.all(15),
                                child: CircularProgressIndicator(
                                  color: AppColors.accentColor,
                                  strokeWidth: 2,
                                ),
                              );
                            } else if (snapshot.hasData) {
                              log(ApiUrl.apiImagePath +
                                  snapshot.data.toString());
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  ApiUrl.apiImagePath +
                                      snapshot.data.toString(),
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(AppImages.profileImg);
                                  },
                                ),
                              );
                            }

                            return Container(
                              padding: const EdgeInsets.all(15),
                              child: CircularProgressIndicator(
                                color: AppColors.accentColor,
                                strokeWidth: 2,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                        log("sender email is :  ${usrData["sender_id"]}");
                        log("stored user email is :  ${UserDetails.email}");

                        if (usrData["sender_id"] != UserDetails.email) {
                          if (usrData["seen"] == false) {
                            msgCount++;
                            widget = Container(
                              height: 25,
                              width: 25,
                              margin: const EdgeInsets.only(right: 8),
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
                    }
                    return widget;
                  },
                ),

                // newMessage(singleMsg)

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

  /*void readAllMessage(BuildContext context,UserChatRoomListModel singleMsg, String room) {
    if (userChatListScreenController.streamSubscription != null) {
      print("second chat");
      userChatListScreenController.streamSubscription!.cancel();
      userChatListScreenController.streamSubscriptionChat!.cancel();
      userChatListScreenController.streamSubscription = null;
      //_streamSubscriptionChat = null;
    }

    print("read Messages ${userChatListScreenController.streamSubscription}");
    //print("against email $email");
    userChatListScreenController.streamSubscription = FirebaseFirestore.instance
        .collection("Chats")
        .where('room_id', isEqualTo: room)
        .where('receiver_id', isEqualTo: singleMsg.vendorid)
        .where('sender_id', isEqualTo: singleMsg.customerid)
        .where('seen', isEqualTo: false)
        .snapshots()
        .listen((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("Chats")
            .doc(element.id)
            .update({'seen': true}).then((value) {
          print('Seen by user :::::::::::::::updated');
        });
      });
    });

    log('userChatListScreenController.streamSubscription: ${userChatListScreenController.streamSubscription}');
  }*/
  int _getUnseenMessagesNumber(List<Map<String, dynamic>> items) {
    var counter;
    for (final item in items) {
      counter += item.values.first.length;
    }
    return counter;
  }

  readMessages(UserChatRoomListModel singleMsg) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('Chats')
          .where('room_id', isEqualTo: singleMsg.roomId)
          .where('seen', isEqualTo: false)
          .get(),
      builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
        var data = snapshot.data!.docs;

        data.forEach((element) {
          print(element.data());
        });

        return Container();
      },
    );

    // newChatDisplayBadge(UserChatRoomListModel singleMsg) {
    //   return StreamBuilder(
    //       stream: FirebaseFirestore.instance
    //           .collection('Chats')
    //           .where('room_id', isEqualTo: roomId)
    //           .where('seen', isEqualTo: false)
    //           .get(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           // for (var element in snapshot.) {
    //           var data = snapshot.data;

    //           // var sener_id = data["sender_id"];

    //           // log("$data");

    //           print("$data");

    //           return Container(
    //             height: 15,
    //             width: 15,
    //             color: Colors.red,
    //           );

    //           // customerId = data["customerid"];
    //           // vendorEmail = data["peerId"];
    //           // name = data["peerName"];
    //           // id = data["vendorid"];
    //           // roomId = data["roomId"];
    //           // createdByMail = data["createdBy"];

    //           // users.add(vendorEmail);
    //           // getUnreadMessage();
    //           // }
    //         } else {
    //           return SizedBox();
    //         }
    //       });
    // }

    // getNewMsgs(UserChatRoomListModel chatList) {
    //   var number = 0;

    //   var docref = FirebaseFirestore.instance.collection('Chats').doc().id;

    //   print("doc id is : ${docref} ");

    //   FirebaseFirestore.instance
    //       .collection('Chats')
    //       .where(docref)
    //       .snapshots()
    //       .listen((event) {
    //     for (int i = 0; i < event.docs.length; i++) {
    //       print(event.docs[i].data()["seen"]);
    //     }
    //   });

    //   // docref.listen(
    //   //   (event) {
    //   //     print(" event data is : ${event.data()}");
    //   //     // number = event.data().t;
    //   //   },
    //   //   onError: (error) => print("Listen failed: $error"),
    //   // );

    //   return Container(
    //     height: 20,
    //     width: 20,
    //     decoration: BoxDecoration(
    //       shape: BoxShape.circle,
    //       color: Colors.red,
    //     ),
    //     child: Center(
    //       child: Text(
    //         number.toString(),
    //         style: TextStyle(
    //           color: AppColors.whiteColor,
    //         ),
    //       ),
    //     ),
    //   );

    //   .snapshots((snapshot)  {
    //     snapshot.docChanges().forEach((change) => {
    //       if (change.type === 'added') {
    //         this.listMessage.push({
    //             isNew: true,
    //             message: change.doc.data()
    //         });
    //       }
    //    });
    // });
    // }
  }
}
