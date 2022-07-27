import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/user_side/model/user_profile_screen_model/user_profile_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:booking_management/common_modules/constants/api_header.dart';
import 'package:booking_management/common_modules/constants/api_url.dart';
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
  ApiHeader apiHeader = ApiHeader();

  String profileImage = "";

  /// Get User ChatRoom List
  Stream<List<UserChatRoomListModel>> getChatRoomListFunction() {
    // isLoading(true);
    String userEmail = UserDetails.email;

    return FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userEmail)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) {
          String img = "";
          return UserChatRoomListModel.fromJson(doc.data(), img);
        })
            .toList());

    /*firebaseDatabase.getChatRooms(userEmail).then((value) {
      chatRoomsStream = value;
      loadUI();
    });*/
    // loadUI();
    // isLoading(false);
    // return chatRoomsStream;
  }

  /// Get User Details By Id
  // getUserDetailsById()async {
  //   isLoading(true);
  //   String url = ApiUrl.getUserDetailsByIdApi + "?id=${UserDetails.uniqueId}";
  //   log('Url : $url');
  //   log('header: ${apiHeader.headers}');
  //
  //   try{
  //
  //     http.Response response = await http.get(Uri.parse(url), headers: apiHeader.headers);
  //     log('Get All User Details Response : ${response.body}');
  //
  //     UserProfileDetailsModel userProfileDetailsModel = UserProfileDetailsModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = userProfileDetailsModel.success.obs;
  //     log('getUserDetailsByIdModel: ${userProfileDetailsModel.success}');
  //     log('getUserDetailsByIdModelStatus : $isSuccessStatus');
  //
  //     if(isSuccessStatus.value) {
  //       profileImage = ApiUrl.apiImagePath + userProfileDetailsModel.data.businessLogo;
  //       log('profileImage: $profileImage');
  //       // nameTextFieldController.text = userProfileDetailsModel.data.userName;
  //       // emailTextFieldController.text = userProfileDetailsModel.data.email;
  //       // mobileTextFieldController.text = userProfileDetailsModel.data.phoneNo;
  //       // gender.value = userProfileDetailsModel.data.gender;
  //       // selectedDate = DateTime.parse(userProfileDetailsModel.data.dateOfBirth);
  //
  //       // if(userProfileDetailsModel.data.dateOfBirth.length > 10) {
  //       //   String dob = userProfileDetailsModel.data.dateOfBirth;
  //       //   String finalDob = dob.substring(0, dob.length - 9);
  //       //   selectedDate.value = finalDob;
  //       // } else {
  //       //   selectedDate.value = userProfileDetailsModel.data.dateOfBirth;
  //       // }
  //     } else {
  //       log('Get All User Details Else Else');
  //     }
  //
  //   } catch(e) {
  //     log('Get All User Details Error ::: $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    getChatRoomListFunction();
    //getUserDetailsById();
    super.onInit();
  }

}