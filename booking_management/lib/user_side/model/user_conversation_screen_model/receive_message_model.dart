import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// SendMessageModel sendMessageModelFromJson(String str) => SendMessageModel.fromJson(json.decode(str));

// String sendMessageModelToJson(SendMessageModel data) => json.encode(data.toJson());

class ReceiveMessageModel {
  ReceiveMessageModel({
    required this.docId,
    required this.roomId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.createdAt,
    required this.seen,
  });

  String docId;
  String roomId;
  String senderId;
  String receiverId;
  String message;
  Timestamp createdAt;
  bool seen;

  factory ReceiveMessageModel.fromJson(Map<String, dynamic> json, String id) => ReceiveMessageModel(
    docId: id,
    roomId: json["room_id"] ?? "",
    senderId: json["sender_id"] ?? "",
    receiverId: json["receiver_id"] ?? "",
    message: json["message"] ?? "",
    createdAt: json["created_at"] ?? Timestamp.now(),
    seen: json["seen"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "room_id": roomId,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "message": message,
    "created_at": createdAt,
    "seen": seen,
  };
}