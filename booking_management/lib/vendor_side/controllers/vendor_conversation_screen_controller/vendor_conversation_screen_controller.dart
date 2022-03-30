import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorConversationScreenController extends GetxController {

  final TextEditingController messageFieldController = TextEditingController();

  List<VendorChatMessageModel> userChatList = [
    VendorChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type "),
    VendorChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    VendorChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type"),
    VendorChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever"),
    VendorChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    VendorChatMessageModel(isSendByMe: false, message: "Hi lorem Ipsum dummy text ever"),
    VendorChatMessageModel(isSendByMe: true, message: "Hi lorem Ipsum dummy text ever since the 150s, when an unknown printer to ok a gallery of type"),
  ];

}


class VendorChatMessageModel {
  final bool isSendByMe;
  final String message;

  VendorChatMessageModel({required this.isSendByMe, required this.message});
}