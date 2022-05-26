import 'dart:async';
import 'package:booking_management/user_side/model/user_conversation_screen_model/send_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class UserConversationScreenController extends GetxController {
  String roomId = Get.arguments[0];
  String receiverEmail = Get.arguments[1];
  // List<SendMessageModel> userNewChatList = Get.arguments[2];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  StreamSubscription? _streamSubscriptionChat;

  List<SendMessageModel>? userChatList;
  // List<SendMessageModel> userNewChatList = [];
  // List<SendMessageModel> userReversedChatList = [];

  final TextEditingController messageFieldController = TextEditingController();



  /// Send Message on Send Button Click
  Future<void> sendMessageFunction(SendMessageModel sendMsg) async {
    messageFieldController.clear();

    var documentReference = FirebaseFirestore.instance
    .collection("Chats").doc(DateTime.now().millisecondsSinceEpoch.toString());

    /// Set Data in Firebase
    documentReference.set(sendMsg.toJson());

    /// Hide Keyboard
    // hideKeyboard();

    loadUI();
  }

  /// Get All Messages From Firebase -> Return Chat List
  /*fetchChatFromFirebase() async {
    isLoading(true);

    var ref = FirebaseFirestore.instance.collection("Chats")
        .where("room_id", isEqualTo: roomId)
        .orderBy("created_at", descending: true)
        .snapshots()
        .asBroadcastStream();

    var value = ref.map((event) => event.docs.map((e) => SendMessageModel.fromJson(e.data())).toList());

    if(_streamSubscriptionChat == null) {
      _streamSubscriptionChat = value.listen((event) {
        userChatList = event;
      });
    }

    isLoading(false);
    loadUI();
    // log("userChatList : ${userChatList.length}");

  }*/

  /// Get All Messages From Firebase -> Return Chat List
  Stream<List<SendMessageModel>> fetchChatFromFirebase() {
    return FirebaseFirestore.instance.collection("Chats")
        .where("room_id", isEqualTo: roomId)
        .orderBy("created_at", descending: false)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => SendMessageModel.fromJson(doc.data()))
            .toList());
  }


  /// Load UI
  loadUI() {
    isLoading(true);
    isLoading(false);
  }

}


class UserChatMessageModel {
  final bool isSendByMe;
  final String message;

  UserChatMessageModel({required this.isSendByMe, required this.message});
}