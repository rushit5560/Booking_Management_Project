import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

SendMessageModel sendMessageModelFromJson(String str) => SendMessageModel.fromJson(json.decode(str));

String sendMessageModelToJson(SendMessageModel data) => json.encode(data.toJson());

class SendMessageModel {
  SendMessageModel({
    required this.roomId,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.createdAt,
    required this.seen,
  });

  String roomId;
  String senderId;
  String receiverId;
  String message;
  Timestamp createdAt;
  bool seen;

  factory SendMessageModel.fromJson(Map<String, dynamic> json) => SendMessageModel(
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