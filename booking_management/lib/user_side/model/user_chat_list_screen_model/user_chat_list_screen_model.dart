import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';


// UserChatRoomListModel sendMessageModelFromJson(String str) => UserChatRoomListModel.fromJson(json.decode(str));

String sendMessageModelToJson(UserChatRoomListModel data) => json.encode(data.toJson());

class UserChatRoomListModel {
  UserChatRoomListModel({
    this.createdAt,
    this.createdBy,
    this.peerId,
    this.roomId,
    this.users,
    this.createdName,
    this.peerName,
    this.customerid,
    this.vendorid,
    this.img
  });

  Timestamp? createdAt;
  String? createdBy;
  String? peerId;
  String? roomId;
  String? createdName;
  String? peerName;
  List<String>? users;
  String? customerid;
  String? vendorid;
  String? img;

  factory UserChatRoomListModel.fromJson(Map<String, dynamic> json, String img) => UserChatRoomListModel(
    createdAt: json["createdAt"] ?? Timestamp.now(),
    createdBy: json["createdBy"] ?? "",
    peerId: json["peerId"] ?? "",
    roomId: json["roomId"] ?? "",
    createdName: json["createdName"] ?? "",
    peerName: json["peerName"] ?? "",
    customerid: json["customerid"] ?? "",
    vendorid: json["vendorid"] ?? "",
    users: List<String>.from(json["users"].map((x) => x) ?? []),
    img: img
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt,
    "createdBy": createdBy,
    "peerId": peerId,
    "roomId": roomId,
    "createdName" : createdName,
    "peerName" : peerName,
    "customerid" : customerid,
    "vendorid" : vendorid,
    "users": List<dynamic>.from(users!.map((x) => x)),
  };
}
