import 'package:booking_management/common_modules/common_functions.dart';
import 'package:booking_management/user_side/model/user_conversation_screen_model/send_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserConversationScreenController extends GetxController {
  String roomId = Get.arguments[0];
  String receiverEmail = Get.arguments[1];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  List<SendMessageModel> userNewChatList = [];

  final TextEditingController messageFieldController = TextEditingController();

  List<UserChatMessageModel> userChatList = [
    UserChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type "),
    UserChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    UserChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type"),
    UserChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever"),
    UserChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    UserChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    UserChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type"),
  ];



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