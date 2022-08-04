import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/model/user_chat_list_screen_model/profile_image_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../firebase_database/firebase_database.dart';
import '../../../vendor_side/model/vendor_chat_screen_models/user_image_get_model.dart';
import '../../model/user_chat_list_screen_model/user_chat_list_screen_model.dart';

class UserChatListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  FirebaseDatabase firebaseDatabase = FirebaseDatabase();

  Stream? chatRoomsStream;
  ApiHeader apiHeader = ApiHeader();

  StreamSubscription<QuerySnapshot>? streamSubscription;
  StreamSubscription? streamSubscriptionChat;

  String img = "";

  dynamic customerId = "";
  dynamic vendorEmail;
  dynamic name;
  dynamic id;
  dynamic roomId;
  dynamic createdByMail;

  Widget msgIndiWidget = SizedBox();

  /// Get User ChatRoom List
  Stream<List<UserChatRoomListModel>> getChatRoomListFunction() {
    // isLoading(true);
    String userEmail = UserDetails.email;

    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userEmail)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              log("============================");
              Map<String, dynamic> jsonData = doc.data();
              String vendorId = jsonData["vendorid"];
              log(" Firebase vendorId : $vendorId");
              // String img = getUserProfileImage(vendorId).toString();

              var userchatDataList = UserChatRoomListModel.fromJson(
                doc.data(),
                img,
              );

              return userchatDataList;
            }).toList());

    /*firebaseDatabase.getChatRooms(userEmail).then((value) {
      chatRoomsStream = value;
      loadUI();
    });*/
    // loadUI();
    // isLoading(false);
    // return chatRoomsStream;
  }

  Widget getChatCredentials() {
    // isLoading(true);
    var users = [];

    var readAllMessage = true;
    Widget dotWidget = SizedBox();

    FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("createdBy", isEqualTo: UserDetails.email)
        .get()
        .then((querySnapshot) async {
      if (querySnapshot.size > 0) {
        for (var element in querySnapshot.docs) {
          var data = element.data();

          customerId = data["customerid"];
          vendorEmail = data["peerId"];
          name = data["peerName"];
          id = data["vendorid"];
          roomId = data["roomId"];
          createdByMail = data["createdBy"];

          users.add(vendorEmail);

          FirebaseFirestore.instance
              .collection("Chats")
              .where("room_id", isEqualTo: roomId)
              .get()
              .then((querySnapshot) {
            if (querySnapshot.size != 0) {
              for (var doc in querySnapshot.docs) {
                var data = doc.data();

                // print("senderid is :  ${data["sender_id"]}");
                // print("senderid is :  ${vendorEmail}");
                // // print("sender mail is :  ${createdByMail}");
                // print("receiver id is :  ${data["receiver_id"]}");
                // print("receiver id is :  ${customerId}");
                // print("data seen id is :  ${data["seen"]}");
                // print("vendor email is :  ${vendorEmail}   \n\n");

                if (data["sender_id"] == vendorEmail &&
                    // data["receiver_id"] == customerId &&
                    data["seen"] == false) {
                  var dataSeen = data["seen"];
                  // userUnreadChatCount++;

                  // msgIndiWidget = Container(
                  //   height: 15,
                  //   width: 15,
                  //   color: Colors.red,
                  // );
                  readAllMessage = false;
                  dotWidget = Container(
                    height: 15,
                    width: 15,
                    color: Colors.red,
                  );

                  print("data seen value is : $dataSeen");

                  // return userUnreadChatCount;
                  log("if case");
                }
              }
            } else {
              log("nothing done");
              // msgIndiWidget = SizedBox();
            }
          }).catchError((error) {
            log(error.toString());
          });
        }
      }
    });

    // isLoading(false);
    return Container(
      height: 15,
      width: 15,
      color: Colors.red,
    );
  }

  // int _getUnseenMessagesNumber(List<Map<String, dynamic>> items) {
  //   var counter;
  //   for (final item in items) {
  //     counter += item.values.first.length;
  //   }
  //   return counter;
  // }

  // getUnreadMessage() async {
  //   // var room_id = singleMsg.roomId;
  //   // var email = singleMsg.users![0];
  //   //  var sender_email = $("#senderemail").val();
  //   // var sender_id = userChatList!.first.senderId;
  //   print("customer id : $customerId");
  //   print("vendor email : $vendorEmail");
  //   print("vendor name : $name");
  //   print("vendor id : $id");
  //   print("chatroom id : $roomId");
  //   print("created by email : $createdByMail \n");

  //   var dataSeen;

  //   await FirebaseFirestore.instance
  //       .collection("Chats")
  //       .where("room_id", isEqualTo: roomId)
  //       .get()
  //       .then((querySnapshot) {
  //         if (querySnapshot.size != 0) {
  //           for (var doc in querySnapshot.docs) {
  //             var data = doc.data();
  //             print(data["seen"]);

  //             if (data["sender_id"] == createdByMail &&
  //                 data["receiver_id"] == vendorEmail &&
  //                 data["seen"] == false) {
  //               var dataSeen = data["seen"];

  //               print("data seen value is : $dataSeen");
  //               // msgIndiWidget = Container(
  //               //   height: 20,
  //               //   width: 20,
  //               //   color: Colors.red,
  //               // );

  //             } else {
  //               print("No new messages");
  //             }

  //             // var ref =
  //             //     FirebaseFirestore.instance.collection("Chats").doc(doc.id);

  //             // log(ref.get().toString());

  //             // ref.update({
  //             //   "seen": true,
  //             // });
  //           }
  //           // var element = document.getElementById("btn" + receiverEmail);
  //           // element..add("d-none1");
  //         } else {
  //           // log(receiverEmail);
  //         }
  //       })
  //       .then((val) {})
  //       .catchError((error) {
  //         log(error.toString());
  //       });

  //   // print("user id is : ${dataId}");
  //   return dataSeen;
  // }

  Future<String> getUserChatImage(String userId) async {
    // isLoading(true);
    String url = ApiUrl.vendorGetProfileImageApi + "?id=$userId";
    log('Url : $url');

    String? image;

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      // log('Get image data Response : ${response.body}');

      UserImageGetModel getUserImage =
          UserImageGetModel.fromJson(json.decode(response.body));
      // log('user get image : $getUserImage');
      isSuccessStatus = getUserImage.success!.obs;
      // log('user get image status  : $isSuccessStatus');

      if (getUserImage.statusCode == 200) {
        log("Success");
        image = getUserImage.image.toString();
        // log('chat image code: ${getUserImage.statusCode}');
      } else {
        log('Get user image Else Else');
      }
    } catch (e) {
      log('Get user image False False: $e');
    } finally {
      // isLoading(false);
      // await getUserDetailsById();
    }

    // log('user chat image is : $image');
    return "$image";
  }

  @override
  void onInit() {
    getChatRoomListFunction();

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamSubscription!.cancel();
    streamSubscriptionChat!.cancel();
    streamSubscriptionChat = null;
    streamSubscription = null;
    //textController.dispose();
    //_scrollController.dispose();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
