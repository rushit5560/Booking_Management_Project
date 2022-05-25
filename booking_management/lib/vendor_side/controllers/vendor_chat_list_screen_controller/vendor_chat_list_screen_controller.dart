import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../common_modules/constants/user_details.dart';
import '../../../firebase_database/firebase_database.dart';
import '../../../user_side/model/user_chat_list_screen_model/user_chat_list_screen_model.dart';

class VendorChatListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  FirebaseDatabase firebaseDatabase = FirebaseDatabase();

  Stream? chatRoomsStream;

  /// Get User ChatRoom List
  Stream<List<UserChatRoomListModel>> getChatRoomListFunction() {
    // isLoading(true);
    String userEmail = UserDetails.email;

    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userEmail)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => UserChatRoomListModel.fromJson(doc.data()))
            .toList());

    /*firebaseDatabase.getChatRooms(userEmail).then((value) {
      chatRoomsStream = value;
      loadUI();
    });*/
    // loadUI();
    // isLoading(false);
    // return chatRoomsStream;
  }

  @override
  void onInit() {
    getChatRoomListFunction();
    super.onInit();
  }

}