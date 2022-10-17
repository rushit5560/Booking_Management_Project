import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/user_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common_modules/constants/api_header.dart';
import '../../model/user_business_details_model/add_customer_review_model.dart';
import '../../model/user_business_details_model/add_vendor_in_favourite_model.dart';
import '../../model/user_business_details_model/get_business_hours_model.dart';
import '../../model/user_business_details_model/get_vendor_reviews_model.dart';
import '../../model/user_conversation_screen_model/send_message_model.dart';
import '../../model/vendor_details_screen_models/vendor_details_model.dart';
import '../../screens/business_details_screen/get_fav_vendor_model.dart';

class BusinessDetailsScreenController extends GetxController {
  /// From Search Result List Screen
  int vendorId = Get.arguments[0];
  String vendorUniqueId = Get.arguments[1];
  String vendorEmail = Get.arguments[2];
  String vendorBusinessName = Get.arguments[3];
  final TextEditingController reviewFieldController = TextEditingController();
  GlobalKey<FormState> reviewFormKey = GlobalKey<FormState>();
  RxBool isOverviewSelected = true.obs;
  RxBool isReviewSelected = false.obs;
  RxString service = 'Daily Checkup'.obs;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String businessName = '';
  int ratting = 0;
  String description = "";
  double price = 0.0;
  String mobileNo = "";
  String address = "";

  RxInt selectRating = 1.obs;

  List<ReviewDatum> reviewList = [];
  List<BusinessHoursDatum> businessHoursList = [];

  //Data ? businessDetailsList;

  List<SendMessageModel> userChatList = [];
  StreamSubscription? _streamSubscriptionChat;

  VendorDetailsData? vendorDetailsData;
  RxBool isFavourite = false.obs;

  ApiHeader apiHeader = ApiHeader();

  /// Get Vendor Details By Id
  getVendorDetailsByIdFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorDetailsApi + "?id=$vendorId";
    log("Vendor Details API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Vendor Details Response : ${response.body}");

      VendorDetailsModel vendorDetailsModel =
          VendorDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = vendorDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        vendorDetailsData = vendorDetailsModel.data;
        log("vendorDetailsData : $vendorDetailsData");
      } else {
        log("getVendorDetailsByIdFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }
    } catch (e) {
      log("getVendorDetailsByIdFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      // isLoading(false);
      if(UserDetails.isUserLoggedIn == true) {
        await getFavVendorFunction(vendorDetailsData!.vendor!.id);
      } else {
        await getVendorReviewFunction();
      }
    }
  }

  // businessDetails()async {
  //   isLoading(true);
  //   String url = ApiUrl.userBusinessDetailsApi + "?VendorId=$vendorId";
  //   log('Url : $url');
  //   log("VendorId=$vendorId");
  //
  //   try{
  //     http.Response response = await http.get(Uri.parse(url));
  //
  //     log('Business Details Response : ${response.body}');
  //
  //     UserBusinessDetailsModel userBusinessDetailsModel = UserBusinessDetailsModel.fromJson(json.decode(response.body));
  //     isStatusSuccess = userBusinessDetailsModel.success.obs;
  //     log("status : $isStatusSuccess");

  //     if(isStatusSuccess.value){
  //       log("success");
  //       businessName = userBusinessDetailsModel.data.vendorBooking.businessName;
  //       ratting = userBusinessDetailsModel.data.review.ratting;
  //       description = userBusinessDetailsModel.data.review.description;
  //       price = userBusinessDetailsModel.data.price;
  //       mobileNo = userBusinessDetailsModel.data.mobileNo;
  //       address = userBusinessDetailsModel.data.vendorBooking.address;
  //       log('mobile: $mobileNo');
  //       log('address: $address');
  //       log('businessName: $businessName');
  //       //log('allBusinessList : $pendingList');
  //
  //     } else {
  //       log('Get All Business Else Else');
  //     }
  //   } catch(e) {
  //     log('Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  /// Get Vendor Review
  getVendorReviewFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorReviewApi + "?id=$vendorId";
    log("Vendor Review API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("vendor Review API Response : ${response.body}");

      GetVendorReviewsModel getVendorReviewsModel =
          GetVendorReviewsModel.fromJson(json.decode(response.body));
      isSuccessStatus = getVendorReviewsModel.success.obs;

      if (isSuccessStatus.value) {
        reviewList.clear();

        reviewList = getVendorReviewsModel.data;
        log("reviewList : ${reviewList.length}");
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getVendorReviewFunction Else Else");
      }
    } catch (e) {
      log("getVendorReviewFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await getBusinessHoursFunction();
    }
  }

  /// Add Customer Review
  addCustomerReviewFunction() async {
    DateTime date = DateTime.now();
    String fDate = "${date.day}-${date.month}-${date.year}";

    isLoading(true);
    String url = ApiUrl.customerGiveReviewApi;
    log("Add Review API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(apiHeader.headers);

      request.fields['VendorId'] = "$vendorId";
      request.fields['CustomerId'] = "${UserDetails.tableWiseId}";
      request.fields['Description'] = reviewFieldController.text.trim();
      request.fields['Ratting'] = jsonEncode(selectRating.value);
      request.fields['Date'] = fDate;

      log("Fields : ${request.fields}");
      log("Headers : ${request.headers}");

      var response = await request.send();
      log("response : ${response.statusCode}");

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((dataLine) async {
        AddCustomerReviewsModel addCustomerReviewsModel =
            AddCustomerReviewsModel.fromJson(json.decode(dataLine));
        isSuccessStatus = addCustomerReviewsModel.success.obs;
        log("response body : ${addCustomerReviewsModel.data}");

        if (isSuccessStatus.value) {
          Fluttertoast.showToast(msg: addCustomerReviewsModel.data);
          await getVendorReviewFunction();
        }

        // else {
        //   log("addCustomerReviewFunction Else Else");
        //   Fluttertoast.showToast(msg: "Something went wrong!");
        // }
      });

      /*Map<String, dynamic> data = {
        "VendorId" : "$vendorId",
        "CustomerId" : "${UserDetails.tableWiseId}",
        "Description" : reviewFieldController.text.trim(),
        "Ratting" : "${selectRating.value}",
        "Date" : fDate
      };
      log("Data : $data");

      http.Response response = await http.post(Uri.parse(url), headers: apiHeader.headers, body: jsonEncode(data));
      log("Add Review Response : ${response.statusCode}");
      log("Add Review Response : ${response.body}");

      AddCustomerReviewsModel addCustomerReviewsModel = AddCustomerReviewsModel.fromJson(json.decode(response.body));
      isSuccessStatus = addCustomerReviewsModel.success.obs;

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: addCustomerReviewsModel.data);
        await getVendorReviewFunction();
      } else {
        log("addCustomerReviewFunction Else Else");
        Fluttertoast.showToast(msg: "Something went wrong!");
      }*/

    } catch (e) {
      log("addCustomerReviewFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Get Business Hours
  getBusinessHoursFunction() async {
    isLoading(true);
    String url = ApiUrl.vendorBusinessHoursApi + "?vendorid=$vendorId";
    log("Get Business Hours API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url), /*headers: apiHeader.headers*/
      );
      log("Business Hours API URL : ${response.body}");

      GetBusinessHoursModel getBusinessHoursModel =
          GetBusinessHoursModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = getBusinessHoursModel.success;

      if (isSuccessStatus.value) {
        businessHoursList = getBusinessHoursModel.data;
        for (int i = 0; i < businessHoursList.length; i++) {
          log("businessHoursList : ${businessHoursList[i].day}");
        }
      } else {
        Fluttertoast.showToast(msg: "Something went wrong!");
        log("getBusinessHoursFunction Else Else");
      }
    } catch (e) {
      log("getBusinessHoursFunction Error ::: $e");
    } finally {
      // isLoading(false);
      await fetchChatFromFirebase();
    }
  }

  /// Get All Messages From Firebase
  Future<void> fetchChatFromFirebase() async {
    String roomId = "${UserDetails.uniqueId}_$vendorUniqueId";
    isLoading(true);

    var ref = FirebaseFirestore.instance
        .collection("Chats")
        .where("room_id", isEqualTo: roomId)
        .orderBy("created_at", descending: true)
        .snapshots()
        .asBroadcastStream();

    var value = ref.map((event) =>
        event.docs.map((e) => SendMessageModel.fromJson(e.data())).toList());

    if (_streamSubscriptionChat == null) {
      _streamSubscriptionChat = value.listen((event) {
        userChatList = event;
      });

      // userChatList.reversed;
      // for(int i = userChatList.length - 1; i > 0; i--) {
      //   userNewChatList.add(userChatList[i]);
      // }
    }

    isLoading(false);
    loadUI();
    log("userChatList : ${userChatList.length}");
  }

  /// Add Vendor in Favorite
  addVendorInFavoriteFunction() async {
    isLoading(true);
    String url = ApiUrl.addFavouriteVendorApi;
    log("Add Vendor in Favourite API URL : $url");

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(apiHeader.headers);

      request.fields['VendorId'] = "$vendorId";
      request.fields['CustomerId'] = "${UserDetails.tableWiseId}";

      log("Fields : ${request.fields}");
      log('request.headers: ${request.headers}');

      var response = await request.send();
      log('response: ${response.statusCode}');

      response.stream.transform(utf8.decoder).listen((value) async {
        AddVendorInFavouriteModel addVendorInFavouriteModel =
            AddVendorInFavouriteModel.fromJson(json.decode(value));
        isSuccessStatus = addVendorInFavouriteModel.success.obs;
        log("Body : ${addVendorInFavouriteModel.statusCode}");

        if (isSuccessStatus.value) {
          // vendorDetailsData!.favourites = !vendorDetailsData!.favourites;
          if (vendorDetailsData!.favourites!) {
            Fluttertoast.showToast(msg: "Added in favourite");
          } else {
            Fluttertoast.showToast(msg: "Removed from favourite");
          }
        } else {
          Fluttertoast.showToast(msg: "Something went wrong!");
        }
      });
    } catch (e) {
      log("addVendorInFavoriteFunction Error ::: $e");
      Fluttertoast.showToast(msg: "Something went wrong!");
    } finally {
      // isLoading(false);
      loadUI();
    }
  }

  getFavVendorFunction(int vendorId) async {
    isLoading(true);
    String url = ApiUrl.getFavVendorApi +
        "?VendorId=$vendorId" +
        "&CustomerId=${UserDetails.tableWiseId}";
    log("Get Fav Vendor API URL : $url");

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);
      log("response : ${response.body}");

      GetFavoriteVendorModel getFavoriteVendorModel =
          GetFavoriteVendorModel.fromJson(json.decode(response.body));
      isSuccessStatus = getFavoriteVendorModel.success.obs;

      if (isSuccessStatus.value) {
        isFavourite.value = getFavoriteVendorModel.workerList.isLike;
        log("isFavourite.value : ${isFavourite.value}");
      } else {
        log("getFavVendorFunction Else Else");
      }
    } catch (e) {
      log("getFavVendorFunction Error ::: $e");
    } finally {
      await getVendorReviewFunction();
    }
  }

  // getUserReview()async{
  //   isLoading(true);
  //   String url = ApiUrl.getReviewApi + "?VendorId=$vendorId";
  //   log('vendor Id: $vendorId');
  //   log('Url : $url');
  //   try{
  //     http.Response response = await http.get(Uri.parse(url));
  //
  //     log('Response : ${response.body}');
  //
  //     GetVendorReviewsModel getVendorReviewsModel = GetVendorReviewsModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = getVendorReviewsModel.success.obs;
  //     log("status : $isSuccessStatus");
  //
  //     if(isSuccessStatus.value){
  //       reviewList = getVendorReviewsModel.data;
  //       log('allReviewList : $reviewList');
  //     } else {
  //       log('Get All Review Else Else');
  //     }
  //   } catch(e) {
  //     log('Review Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // addReview()async{
  //   isLoading(true);
  //
  //   String url = ApiUrl.userAddReviewApi;
  //   log('Url : $url');
  //
  //   try{
  //     Map data = {
  //       "VendorId": "1",
  //       "CustomerId": "2",
  //       "Description": "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
  //       "Ratting": "4",
  //       "Id" : "8"
  //     };
  //
  //     log('data : $data');
  //     String body = json.encode(data);
  //
  //     http.Response response = await http.post(Uri.parse(url), body: data);
  //     log('Response : ${response.body}');
  //
  //     UserAddReviewModel addReviewModel = UserAddReviewModel.fromJson(json.decode(response.body));
  //     isSuccessStatus = addReviewModel.success.obs;
  //
  //     log("status: $isSuccessStatus");
  //
  //     if(isSuccessStatus.value) {
  //       //String userToken = signInModel.token;
  //       //print('userToken : $userToken');
  //       // await sharedPreferenceData.setUserLoginDetailsInPrefs(userToken: "$userToken");
  //       // await createUserWallet();
  //       String message = addReviewModel.message;
  //       //String role = signInModel.role.name;
  //       Get.snackbar(message, '');
  //     } else {
  //       log('Add Review False False');
  //     }
  //
  //   } catch(e) {
  //     log('Review Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    getVendorDetailsByIdFunction();
    // getUserReview();
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
