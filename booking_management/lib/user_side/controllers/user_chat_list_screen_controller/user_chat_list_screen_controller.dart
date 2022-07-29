import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/user_side/model/user_chat_list_screen_model/profile_image_model.dart';
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

  /// Get User ChatRoom List
  Stream<List<UserChatRoomListModel>> getChatRoomListFunction() {
    // isLoading(true);
    String userEmail = UserDetails.email;

    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userEmail)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        log("============================");
        Map<String, dynamic> json = doc.data();
        String vendorId = json["vendorid"];
        log("vendorId Firebase: $vendorId");
        // String img = getUserProfileImage(vendorId).toString();
        String img = "";
        return UserChatRoomListModel.fromJson(doc.data(), img.toString());
      }).toList();
    });

    /*firebaseDatabase.getChatRooms(userEmail).then((value) {
      chatRoomsStream = value;
      loadUI();
    });*/
    // loadUI();
    // isLoading(false);
    // return chatRoomsStream;
  }

  // Get User Profile - todo
  // getUserProfileImage(String id) async {
  //   // isLoading(true);
  //   String imgUrl = "";
  //   String url = ApiUrl.getUserDetailsByIdApi + "?id=$id";
  //   log("Get User Profile Api Url : $url");

  //   try {
  //     http.Response response =
  //         await http.get(Uri.parse(url), headers: apiHeader.headers);

  //     ProfileImageModel profileImageModel =
  //         ProfileImageModel.fromJson(json.decode(response.body));

  //     isSuccessStatus = profileImageModel.success.obs;
  //     if (isSuccessStatus.value) {
  //       imgUrl = profileImageModel.data.businessLogo;
  //     } else {}
  //   } catch (e) {
  //     log("Get User Profile Only Error ::: $e");
  //   } finally {
  //     // isLoading(false);
  //   }
  //   log("imgUrl : $imgUrl");
  //   loadUI();
  //   isLoading(true);
  //   isLoading(false);
  //   return imgUrl;
  // }

  Future<String> getUserChatImage(String userId) async {
    isLoading(true);
    String url = ApiUrl.vendorGetProfileImageApi + "?id=$userId";
    log('Url : $url');

    String? image;

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log('Get image data Response : ${response.body}');

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
      isLoading(false);
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
