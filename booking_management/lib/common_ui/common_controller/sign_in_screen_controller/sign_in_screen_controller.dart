import 'dart:convert';
import 'dart:developer';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/model/sign_in_screen_model/sign_in_screen_model.dart';
import 'package:booking_management/common_ui/model/sign_in_screen_model/sign_vendor_model.dart';
import 'package:booking_management/user_side/screens/index_screen/index_screen.dart';
import 'package:booking_management/vendor_side/model/vendor_subscription_report_screen_model/vendor_subscription_report_model.dart';
import 'package:booking_management/vendor_side/screens/vendor_index_screen/vendor_index_screen.dart';
import 'package:booking_management/vendor_side/screens/vendor_subscription_plan_screen/vendor_subscription_plan_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common_modules/constants/user_details.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

class SignInScreenController extends GetxController {
  SignInRoute signInRoute = Get.arguments ?? SignInRoute.none;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  // RxInt isStatus = 0.obs;
  RxBool isPasswordVisible = true.obs;
  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  RxBool isIosPlatform = false.obs;

  /// Fb Login
  FacebookUserProfile? profile;
  final FacebookLogin plugin = FacebookLogin(debug: true);

  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController unameFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();

  signInFunction() async {
    isLoading(true);

    String url = ApiUrl.signInApi +
        "?UserName=${unameFieldController.text.trim()}&Password=${passwordFieldController.text.trim()}&Fcm=${UserDetails.fcmToken}";
    log('Url : $url');

    try {
      http.Response response = await http.post(Uri.parse(url));
      log('Response statsu code : ${response.statusCode}');
      log('Response : ${response.body}');

      // if(response.body.toString().contains("Subscription pending")) {
      //   //Get.to(() => VendorSubscriptionPlanScreen());
      //   Get.to(() => VendorIndexScreen());
      // }

      var body = jsonDecode(response.body);

      // log(body);

      if (response.body.toString().contains("Please confirm your email")) {
        SignInVendorErrorModel signInVendorErrorModel =
            SignInVendorErrorModel.fromJson(json.decode(response.body));
        Fluttertoast.showToast(
            msg:
                "Your account is in-active. Please check your email to activate.",
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.statusCode.toString().contains("417")) {
        SignInVendorErrorModel signInVendorErrorModel =
            SignInVendorErrorModel.fromJson(json.decode(response.body));
        Fluttertoast.showToast(
            msg: signInVendorErrorModel.message,
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.body
          .toString()
          .contains("Your account is DeActivate")) {
        Fluttertoast.showToast(
            msg: "Your account is DeActivated.",
            toastLength: Toast.LENGTH_SHORT);
      } else if (body["statusCode"].toString().contains("417")) {
        Get.snackbar("Login Failed", body["errorMessage"]);
      } else {
        SignInModel signInModel =
            SignInModel.fromJson(json.decode(response.body));

        isSuccessStatus = signInModel.success.obs;

        log("status: $isSuccessStatus");

        if (isSuccessStatus.value) {
          if (signInModel.message.toString().contains("not Verified")) {
            Get.snackbar(signInModel.message, '');
          }
          /*else if (signInModel.message.contains("Invalid login attempt")) {
            Get.snackbar(signInModel.message, '');
          }*/

          else if (signInModel.role[0] == "Customer") {
            log('customer side');
            Get.snackbar("${signInModel.data.userName} login successfully", '');

            // String dob = signInModel.customer.dateOfBirth;
            // String finalDob = dob.substring(0, dob.length - 9);
            // log("finalDob : $finalDob");

            log("signInModel response1212 : ${signInModel.message}");
            // log("signInModel response : ${signInModel.message}");

            if (signInModel.message
                .toString()
                .contains("Successfully Logged")) {
              log("user logged in ");
              sharedPreferenceData.setUserLoginDetailsInPrefs(
                apiToken: signInModel.data.apiToken,
                uniqueId: signInModel.data.id,
                tableWiseId: signInModel.customer.id,
                userName: signInModel.data.userName,
                email: signInModel.data.email,
                phoneNo: signInModel.data.phoneNumber,
                dob: signInModel.customer.dateOfBirth,
                roleName: signInModel.role[0],
                gender: signInModel.customer.gender,
                businessName: "",
                address: "",
                street: "",
                state: "",
                country: "",
                subUrb: "",
                postCode: "",
                stripeId: "",
                //slotDuration: ""
                vendorVerification: false,
                businessId: "",
                serviceSlot: false,
                institutionName: "",
                accountName: "",
                accountNumber: "",
                ifscCode: "",
                isPriceDisplay: false,
              );
              log("Fcm Token : ${UserDetails.fcmToken}");
              if (signInRoute == SignInRoute.fromBookScreen) {
                Get.back();
                Get.back();
              } else {
                Get.offAll(() => IndexScreen());
              }
            }

            //Get.snackbar(signInModel.message, '');
          } else if (signInModel.role[0] == "Vendor") {
            log('Vendor side');
            log('Api token: ${signInModel.data.apiToken}');
            Get.snackbar("${signInModel.data.fullName} login successfully", '');

            var isSub = true;
            if (signInModel.message.contains("Subscription pending")) {
              isSub = false;
              log("vendor has no subscription");
              log("logged in state");
              log("subscription state is : $isSub");

              sharedPreferenceData.setUserLoginDetailsInPrefs(
                apiToken: signInModel.data.apiToken,
                uniqueId: signInModel.data.id,
                tableWiseId: signInModel.vendor.id,
                userName: signInModel.data.fullName,
                email: signInModel.data.email,
                phoneNo: signInModel.data.phoneNumber,
                dob: "",
                roleName: signInModel.role[0],
                gender: "",
                businessName: signInModel.vendor.businessName,
                address: signInModel.vendor.address,
                street: signInModel.vendor.street,
                state: signInModel.vendor.state,
                country: signInModel.vendor.country,
                subUrb: signInModel.vendor.suburb,
                postCode: signInModel.vendor.postcode,
                stripeId: signInModel.vendor.stripeId.isEmpty
                    ? ""
                    : signInModel.vendor.stripeId,
                isSubscription: isSub,
                // slotDuration: signInModel.vendor.
                vendorVerification: signInModel.vendor.vendorVerification,
                businessId: signInModel.vendor.businessId,
                serviceSlot: signInModel.vendor.isServiceSlots,
                institutionName: signInModel.vendor.financialInstitutionName,
                accountName: signInModel.vendor.accountName,
                accountNumber: signInModel.vendor.accountNumber,
                ifscCode: signInModel.vendor.accountCode,
                isPriceDisplay: signInModel.vendor.isPriceDisplay,
              );

              // DateTime subscription = signInModel.vendor.nextPayment;
              //
              // if(subscription == "") {
              //   Get.offAll(()=> VendorSubscriptionPlanScreen(), transition: Transition.zoom);
              // }
              // else {
              //   Get.offAll(() => VendorIndexScreen());
              // }

              log("navigate to subscription plan screen");
              Get.offAll(
                () => VendorSubscriptionPlanScreen(),
                arguments: SubscriptionOption.direct,
              );
            } else if (signInModel.message
                .toString()
                .contains("Successfully Logged")) {
              isSub = true;

              log("logged in state");
              log("subscription state is : $isSub");

              sharedPreferenceData.setUserLoginDetailsInPrefs(
                apiToken: signInModel.data.apiToken,
                uniqueId: signInModel.data.id,
                tableWiseId: signInModel.vendor.id,
                userName: signInModel.data.fullName,
                email: signInModel.data.email,
                phoneNo: signInModel.data.phoneNumber,
                dob: "",
                roleName: signInModel.role[0],
                gender: "",
                businessName: signInModel.vendor.businessName,
                address: signInModel.vendor.address,
                street: signInModel.vendor.street,
                state: signInModel.vendor.state,
                country: signInModel.vendor.country,
                subUrb: signInModel.vendor.suburb,
                postCode: signInModel.vendor.postcode,
                stripeId: signInModel.vendor.stripeId.isEmpty
                    ? ""
                    : signInModel.vendor.stripeId,
                isSubscription: isSub,
                // slotDuration: signInModel.vendor.
                vendorVerification: signInModel.vendor.vendorVerification,
                businessId: signInModel.vendor.businessId,
                serviceSlot: signInModel.vendor.isServiceSlots,
                institutionName: signInModel.vendor.financialInstitutionName,
                accountName: signInModel.vendor.accountName,
                accountNumber: signInModel.vendor.accountNumber,
                ifscCode: signInModel.vendor.accountCode,
                isPriceDisplay: signInModel.vendor.isPriceDisplay,
              );

              // DateTime subscription = signInModel.vendor.nextPayment;
              //
              // if(subscription == "") {
              //   Get.offAll(()=> VendorSubscriptionPlanScreen(), transition: Transition.zoom);
              // }
              // else {
              //   Get.offAll(() => VendorIndexScreen());
              // }

              // if (isSub == false) {
              log("navigate to subscription plan screen");
              Get.offAll(
                () => VendorIndexScreen(),
                arguments: SubscriptionOption.direct,
              );
              // } else {
              //   log("navigate to vendor index screen");
              //   Get.offAll(() => VendorIndexScreen());
              // }

            }
          }
        } else {
          log('SignIn False False');
          log('SignIn message from api ' + signInModel.message);
          // Get.snackbar(signInModel.message, '');
          log("asdasdsd");
        }
      }
    } catch (e) {
      log('SignIn Error : $e');
      Fluttertoast.showToast(
          msg: "Invalid login attempt", toastLength: Toast.LENGTH_SHORT);
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future signInWithGoogleFunction() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.signOut();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      log("Email: ${result.user!.email}");
      log("Username: ${result.user!.displayName}");
      log("User Id: ${result.user!.uid}");

      // login = prefs.getString('userId');
      // print(login);
      if (result != null) {
        prefs.setString('userId', result.user!.uid);
        prefs.setString('userName', result.user!.displayName!);
        prefs.setString('email', result.user!.email!);
        prefs.setString('photo', result.user!.photoURL!);
        prefs.setBool('isLoggedIn', false);

        // Entry in Database
        await authenticationFunction(
          userName: result.user!.displayName!,
          email: result.user!.email!,
          socialProv: "google",
        );
        // Get.offAll(() => IndexScreen());

      }
    }
    isLoading(false);
  }

  Future signInWithFacebookFunction() async {
    await plugin.logIn(
      permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ],
    );

    await subPartOfFacebookLogin();
    await plugin.logOut();
  }

  subPartOfFacebookLogin() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final plugin1 = plugin;
    final token = await plugin1.accessToken;

    String? email;
    String? imageUrl;

    if (token != null) {
      log("token===$token");
      profile = await plugin1.getUserProfile();
      log("profile===$profile");
      if (token.permissions.contains(FacebookPermission.email.name)) {
        email = await plugin1.getUserEmail();
      }
      imageUrl = await plugin1.getProfileImageUrl(width: 100);
      if (profile != null) {
        if (profile!.userId.isNotEmpty) {
          // Entry in Database
          await authenticationFunction(
            userName: profile!.firstName!,
            email: email!,
            socialProv: "facebook",
          );

          // prefs.setString('userId', profile!.userId);
          // prefs.setString('userName', profile!.firstName!);
          // prefs.setString('email', email!);
          // prefs.setString('photo', imageUrl!.toString());

          // String ? userId = prefs.getString('userId');
          // String ? uName = prefs.getString('userName');
          // String ? uEmail = prefs.getString('email');
          // String ? uPhotoUrl = prefs.getString('photo');
          // log('id: $userId, username : $uName, email : $uEmail, photo : $uPhotoUrl');
        }
      }
    }
  }

  Future<void> authenticationFunction({
    required String userName,
    required String email,
    required String socialProv,
  }) async {
    String finalUserName = userName.replaceAll(" ", "");

    String url = ApiUrl.authenticationApi +
        "?userName=${finalUserName.trim()}" +
        "&email=$email" +
        "&password=Admin@123" +
        "&socialProvider=$socialProv";
    log('authenticationFunction Api Url $url');
    try {
      http.Response response = await http.post(Uri.parse(url));
      log('Response status code : ${response.statusCode}');
      log('Response : ${response.body}');

      var body = jsonDecode(response.body);
      if (response.body.toString().contains("Please confirm your email")) {
        SignInVendorErrorModel signInVendorErrorModel =
            SignInVendorErrorModel.fromJson(json.decode(response.body));
        Fluttertoast.showToast(
            msg:
                "Your account is in-active. Please check your email to activate.",
            toastLength: Toast.LENGTH_SHORT);
      } else if (response.statusCode.toString().contains("417")) {
        SignInVendorErrorModel signInVendorErrorModel =
            SignInVendorErrorModel.fromJson(json.decode(response.body));
        Fluttertoast.showToast(
            msg: signInVendorErrorModel.message,
            toastLength: Toast.LENGTH_SHORT);
      } else if (body["statusCode"].toString().contains("417")) {
        Get.snackbar("Login Failed", body["errorMessage"]);
      } else {
        SignInModel signInModel =
            SignInModel.fromJson(json.decode(response.body));

        isSuccessStatus = signInModel.success.obs;

        log("status: $isSuccessStatus");

        if (isSuccessStatus.value) {
          if (signInModel.message.toString().contains("not Verified")) {
            Get.snackbar(signInModel.message, '');
          }
          /*else if (signInModel.message.contains("Invalid login attempt")) {
            Get.snackbar(signInModel.message, '');
          }*/

          else if (signInModel.role[0] == "Customer") {
            log('customer side');
            Get.snackbar("${signInModel.data.userName} login successfully", '');

            // String dob = signInModel.customer.dateOfBirth;
            // String finalDob = dob.substring(0, dob.length - 9);
            // log("finalDob : $finalDob");

            if (signInModel.message
                .toString()
                .contains("Successfully Logged")) {
              log("user logged in ");
              sharedPreferenceData.setUserLoginDetailsInPrefs(
                apiToken: signInModel.data.apiToken,
                uniqueId: signInModel.data.id,
                tableWiseId: signInModel.customer.id,
                userName: signInModel.data.userName,
                email: signInModel.data.email,
                phoneNo: signInModel.data.phoneNumber,
                dob: signInModel.customer.dateOfBirth,
                roleName: signInModel.role[0],
                gender: signInModel.customer.gender,
                businessName: "",
                address: "",
                street: "",
                state: "",
                country: "",
                subUrb: "",
                postCode: "",
                stripeId: "",
                //slotDuration: ""
                vendorVerification: false,
                businessId: "",
                serviceSlot: false,
                institutionName: "",
                accountName: "",
                accountNumber: "",
                ifscCode: "",
                isPriceDisplay: false,
              );
              log("Fcm Token : ${UserDetails.fcmToken}");
              if (signInRoute == SignInRoute.fromBookScreen) {
                Get.back();
                Get.back();
              } else {
                Get.offAll(() => IndexScreen());
              }
            }

            //Get.snackbar(signInModel.message, '');
          } else if (signInModel.role[0] == "Vendor") {
            log('Vendor side');
            log('Api token: ${signInModel.data.apiToken}');
            Get.snackbar("${signInModel.data.fullName} login successfully", '');

            var isSub = true;
            if (signInModel.message.contains("Subscription pending")) {
              isSub = false;
              log("vendor has no subscription");
              log("logged in state");
              log("subscription state is : $isSub");

              sharedPreferenceData.setUserLoginDetailsInPrefs(
                apiToken: signInModel.data.apiToken,
                uniqueId: signInModel.data.id,
                tableWiseId: signInModel.vendor.id,
                userName: signInModel.data.fullName,
                email: signInModel.data.email,
                phoneNo: signInModel.data.phoneNumber,
                dob: "",
                roleName: signInModel.role[0],
                gender: "",
                businessName: signInModel.vendor.businessName,
                address: signInModel.vendor.address,
                street: signInModel.vendor.street,
                state: signInModel.vendor.state,
                country: signInModel.vendor.country,
                subUrb: signInModel.vendor.suburb,
                postCode: signInModel.vendor.postcode,
                stripeId: signInModel.vendor.stripeId.isEmpty
                    ? ""
                    : signInModel.vendor.stripeId,
                isSubscription: isSub,
                // slotDuration: signInModel.vendor.
                vendorVerification: signInModel.vendor.vendorVerification,
                businessId: signInModel.vendor.businessId,
                serviceSlot: signInModel.vendor.isServiceSlots,
                institutionName: signInModel.vendor.financialInstitutionName,
                accountName: signInModel.vendor.accountName,
                accountNumber: signInModel.vendor.accountNumber,
                ifscCode: signInModel.vendor.accountCode,
                isPriceDisplay: signInModel.vendor.isPriceDisplay,
              );

              // DateTime subscription = signInModel.vendor.nextPayment;
              //
              // if(subscription == "") {
              //   Get.offAll(()=> VendorSubscriptionPlanScreen(), transition: Transition.zoom);
              // }
              // else {
              //   Get.offAll(() => VendorIndexScreen());
              // }

              log("navigate to subscription plan screen");
              Get.offAll(
                () => VendorSubscriptionPlanScreen(),
                arguments: SubscriptionOption.direct,
              );
            } else if (signInModel.message
                .toString()
                .contains("Successfully Logged")) {
              isSub = true;

              log("logged in state");
              log("subscription state is : $isSub");

              sharedPreferenceData.setUserLoginDetailsInPrefs(
                apiToken: signInModel.data.apiToken,
                uniqueId: signInModel.data.id,
                tableWiseId: signInModel.vendor.id,
                userName: signInModel.data.fullName,
                email: signInModel.data.email,
                phoneNo: signInModel.data.phoneNumber,
                dob: "",
                roleName: signInModel.role[0],
                gender: "",
                businessName: signInModel.vendor.businessName,
                address: signInModel.vendor.address,
                street: signInModel.vendor.street,
                state: signInModel.vendor.state,
                country: signInModel.vendor.country,
                subUrb: signInModel.vendor.suburb,
                postCode: signInModel.vendor.postcode,
                stripeId: signInModel.vendor.stripeId.isEmpty
                    ? ""
                    : signInModel.vendor.stripeId,
                isSubscription: isSub,
                // slotDuration: signInModel.vendor.
                vendorVerification: signInModel.vendor.vendorVerification,
                businessId: signInModel.vendor.businessId,
                serviceSlot: signInModel.vendor.isServiceSlots,
                institutionName: signInModel.vendor.financialInstitutionName,
                accountName: signInModel.vendor.accountName,
                accountNumber: signInModel.vendor.accountNumber,
                ifscCode: signInModel.vendor.accountCode,
                isPriceDisplay: signInModel.vendor.isPriceDisplay,
              );

              // DateTime subscription = signInModel.vendor.nextPayment;
              //
              // if(subscription == "") {
              //   Get.offAll(()=> VendorSubscriptionPlanScreen(), transition: Transition.zoom);
              // }
              // else {
              //   Get.offAll(() => VendorIndexScreen());
              // }

              // if (isSub == false) {
              log("navigate to subscription plan screen");
              Get.offAll(
                () => VendorIndexScreen(),
                arguments: SubscriptionOption.direct,
              );
              // } else {
              //   log("navigate to vendor index screen");
              //   Get.offAll(() => VendorIndexScreen());
              // }

            }
          }
        } else {
          log('SignIn False False');
          log('SignIn message from api ' + signInModel.message);
          // Get.snackbar(signInModel.message, '');
          log("asdasdsd");
        }
      }
    } catch (e) {
      log('SignIn Error : $e');
      Fluttertoast.showToast(
          msg: "Invalid login attempt", toastLength: Toast.LENGTH_SHORT);
      rethrow;
    }
  }

  @override
  void onInit() {
    super.onInit();

    if (Platform.isAndroid) {
      // Android-specific code
    } else if (Platform.isIOS) {
      // iOS-specific code
      isIosPlatform.value = true;
    }
  }
}
