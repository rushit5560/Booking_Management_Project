import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseDatabase {

  var db = FirebaseFirestore.instance;


  /// Create ChatRoom of 2 Users
  createChatRoomOfTwoUsers(String chatRoomId, chatRoomMap) {
    db.collection("ChatRoom").doc(chatRoomId).set(chatRoomMap).catchError((e) {
          log('Create ChatRoom Error ::: $e');
    });
  }


  /// Get ChatRoom List
  getChatRooms(String userEmail) async {
    return await FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userEmail)
        .snapshots();
  }
}