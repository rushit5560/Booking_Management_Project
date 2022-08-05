import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:booking_management/user_side/controllers/user_chat_list_screen_controller/user_chat_list_screen_controller.dart';
import 'package:booking_management/user_side/model/user_conversation_screen_model/receive_message_model.dart';
import 'package:booking_management/user_side/model/user_conversation_screen_model/send_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_url.dart';
import '../../../vendor_side/controllers/vendor_chat_list_screen_controller/vendor_chat_list_screen_controller.dart';
import '../../model/user_conversation_screen_model/get_fcm_token_model.dart';

class UserConversationScreenController extends GetxController {
  String roomId = Get.arguments[0];
  String receiverEmail = Get.arguments[1];
  String headerName = Get.arguments[2];
  String peerUniqueId = Get.arguments[3];
  String customerId = Get.arguments[4];
  String senderEmail = Get.arguments[5];

  // List<SendMessageModel> userNewChatList = Get.arguments[2];

  /// Getting From API
  String oppositeUserFcmToken = "";

  // ApiHeader apiHeader = ApiHeader();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  StreamSubscription? _streamSubscriptionChat;

  List<SendMessageModel>? userChatList;

  // List<SendMessageModel> userNewChatList = [];
  // List<SendMessageModel> userReversedChatList = [];

  final TextEditingController messageFieldController = TextEditingController();

  /// Send Message on Send Button Click
  Future<void> sendMessageFunction(SendMessageModel sendMsg) async {
    var documentReference = FirebaseFirestore.instance
        .collection("Chats")
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    /// Set Data in Firebase
    documentReference.set(sendMsg.toJson());

    /// Send Chat Notification
    sendGeneralNotification(
      fcmToken: oppositeUserFcmToken, // Getting From API
      title: UserDetails.userName,
      body: messageFieldController.text.trim(),
      type: 0,
    );

    /// Hide Keyboard
    // hideKeyboard();
    messageFieldController.clear();
    loadUI();
  }

  Future<void> readMessages() async {
    final query = await FirebaseFirestore.instance
        .collection('Chats')
        .where('room_id', isEqualTo: roomId)
        .where('seen', isEqualTo: false)
        .get();

    for (var doc in query.docs) {
      print(" seen is :  ${doc.data()['seen']}");
      doc.reference.update({'seen': true});
    }
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
  Stream<List<ReceiveMessageModel>> fetchChatFromFirebase() {
    return FirebaseFirestore.instance
        .collection("Chats")
        .where("room_id", isEqualTo: roomId)
        .orderBy("created_at", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              // log("doc : ${doc.id}");

              return ReceiveMessageModel.fromJson(doc.data(), doc.id);
            }).toList());
  }

  /// Delete Message
  deleteSingleMessage(String docId) {
    FirebaseFirestore.instance.collection("Chats").doc(docId).delete();
    Get.back();
  }

  /// Load UI
  loadUI() {
    isLoading(true);
    isLoading(false);
  }

  static void sendGeneralNotification({
    required String fcmToken,
    required String body,
    required String title,
    required int type,
  }) async {
    log("fcmToken : $fcmToken");
    log("body : $body");
    log("title : $title");

    final response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': "Key=${ApiUrl.serverApiKey}",
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': title,
            'type': '$type'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '10',
            "sound": "default",
            'status': 'done'
          },
          'to': fcmToken,
        },
      ),
    );
    log("response : ${response.body}");
    if (response.statusCode == 200) {
      // on success do
      log("General Notification Sent to $fcmToken");
    } else {
      // on failure do
      log("General Notification Failed");
    }

    // Get.back();
  }

  /// Get User FCM Token
  getUserFcmTokenFunction() async {
    isLoading(true);
    String url = ApiUrl.getFcmTokenApi + "?id=$peerUniqueId";
    log("Get User Fcm Token : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      GetFcmTokeModel getFcmTokeModel =
          GetFcmTokeModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFcmTokeModel.success.obs;
      log("getFcmTokeModel.success : ${getFcmTokeModel.success}");
      log("getFcmTokeModel.success : ${getFcmTokeModel.statusCode}");
      log("getFcmTokeModel.success : ${getFcmTokeModel.data.fcmToken}");

      if (isSuccessStatus.value) {
        oppositeUserFcmToken = getFcmTokeModel.data.fcmToken;
        log("oppositeUserFcmToken : $oppositeUserFcmToken");
      } else {
        log("getUserFcmTokenFunction Else Else");
      }
    } catch (e) {
      log("getUserFcmTokenFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getUserFcmTokenFunction();
    readMessages();
    super.onInit();
  }


}

// class UserChatMessageModel {
//   final bool isSendByMe;
//   final String message;
//
//   UserChatMessageModel({required this.isSendByMe, required this.message});
// }
