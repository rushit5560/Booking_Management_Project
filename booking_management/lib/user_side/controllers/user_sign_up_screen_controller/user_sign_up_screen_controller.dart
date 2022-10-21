import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:booking_management/common_modules/constants/api_url.dart';
import 'package:booking_management/common_modules/constants/enums.dart';
import 'package:booking_management/common_modules/extension_methods/extension_methods.dart';
import 'package:booking_management/common_modules/sharedpreference_data/sharedpreference_data.dart';
import 'package:booking_management/common_ui/common_screens/sign_in_screen/sign_in_screen.dart';
import 'package:booking_management/user_side/model/user_sign_up_model/user_sign_up_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class UserSignUpScreenController extends GetxController {
  SignInRoute signInRoute = Get.arguments ?? SignInRoute.none;
  RxBool isLoading = false.obs;
  RxInt isStatus = 0.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isRePasswordVisible = true.obs;
  RxString selectedDate = ''.obs;
  RxBool termsAndConditionCheckBox = false.obs;
  File? file;

  final fb = FacebookLogin();

  SharedPreferenceData sharedPreferenceData = SharedPreferenceData();

  /// Fb Login
  FacebookUserProfile? profile;
  final FacebookLogin plugin = FacebookLogin(debug: true);

  final GlobalKey<FormState> userSignUpFormKey = GlobalKey<FormState>();
  final TextEditingController userNameFieldController = TextEditingController();
  final TextEditingController fullNameFieldController = TextEditingController();
  final TextEditingController lastNameFieldController = TextEditingController();
  final TextEditingController genderFieldController = TextEditingController();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController mobileFieldController = TextEditingController();
  final TextEditingController passwordFieldController = TextEditingController();
  final TextEditingController cPasswordFieldController =
      TextEditingController();
  TextEditingController dobFieldController = TextEditingController();
  TextEditingController stateFieldController = TextEditingController();
  TextEditingController cityFieldController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      // selectedDate.value = DateFormat.yMMMMd("en_US").format(d);
      selectedDate.value = DateFormat.yMMMd("en_US").format(d);
      dobFieldController.text = selectedDate.value;
      log('selectedDate : ${selectedDate.value}');
    }
  }

  // Future signInWithGoogleFunction() async {
  //   isLoading(true);

  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   googleSignIn.signOut();
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //       idToken: googleSignInAuthentication.idToken,
  //       accessToken: googleSignInAuthentication.accessToken,
  //     );

  //     // Getting users credential
  //     UserCredential result = await auth.signInWithCredential(authCredential);
  //     // User? user = result.user;
  //     // log("Email: ${result.user!.email}");
  //     // log("Username: ${result.user!.displayName}");
  //     // log("User Id: ${result.user!.uid}");

  //     //login = prefs.getString('userId');
  //     //print(login);
  //     if (result != null) {
  //       String userName = result.user!.displayName!;
  //       String email = result.user!.email!;
  //       String googleKeyId = result.user!.uid;

  //       log("Username : $userName");
  //       log("email : $email");
  //       log("googleKeyId : $googleKeyId");

  //       // Navigator.of(context).push(
  //       //   MaterialPageRoute(
  //       //     builder: (context) => GoogleDetailsScreen(
  //       //       userName: userName,
  //       //       userEmail: email,
  //       //       userGoogleKeyId: googleKeyId,
  //       //     ),
  //       //   ),
  //       // );

  //       // await socialMediaRegisterFunction(
  //       //   userName: userName,
  //       //   userEmail: email,
  //       //   userId: googleKeyId,
  //       // );

  //     }
  //   }

  //   isLoading(false);
  // }

  // Future signInWithFacebookFunction2() async {
  //   //await fb.logOut();
  //   // isLoading(true);

  //   try {
  //     final res = await fb.logIn(
  //       permissions: [
  //         FacebookPermission.publicProfile,
  //         FacebookPermission.email,
  //       ],
  //     );
  //     // Check result status
  //     switch (res.status) {
  //       case FacebookLoginStatus.success:
  //         // Logged in

  //         // Send access token to server for validation and auth
  //         final FacebookAccessToken accessToken = res.accessToken!;
  //         log('Access token: ${accessToken.token}');

  //         // Get profile data
  //         final profile = await fb.getUserProfile();
  //         log('Hello, ${profile!.name}! You ID: ${profile.userId}');

  //         // Get user profile image url
  //         final imageUrl = await fb.getProfileImageUrl(width: 100);
  //         log('Your profile image: $imageUrl');

  //         // Navigator.of(context).push(
  //         //   MaterialPageRoute(
  //         //     builder: (context) => FacebookDetailsScreen(
  //         //       userName: profile.name!,
  //         //       userId: profile.userId,
  //         //       userImage: imageUrl!,
  //         //     ),
  //         //   ),
  //         // );

  //         // Get email (since we request email permission)
  //         final email = await fb.getUserEmail();
  //         log('Your profile email: $email');

  //         // But user can decline permission
  //         // if (email != null) {
  //         //   String userName = "${profile.firstName}";
  //         //   String fbKeyId = profile.userId;

  //         //   // await socialMediaRegisterFunction(
  //         //   //   userName: userName,
  //         //   //   userEmail: email,
  //         //   //   userId: fbKeyId,
  //         //   // );

  //         // }

  //         break;
  //       case FacebookLoginStatus.cancel:
  //         // User cancel log in
  //         break;
  //       case FacebookLoginStatus.error:
  //         // Log in failed
  //         log('Error while log in: ${res.error}');
  //         break;
  //     }
  //   } catch (e) {
  //     log("error occured : ${e.toString()}");

  //     rethrow;
  //   }

  //   isLoading(false);
  // }

  userSignUpFunction() async {
    isLoading(true);

    String url = ApiUrl.userSignUpApi;
    log('Url : $url');

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['UserName'] = userNameFieldController.text.trim();
      request.fields['Email'] = emailFieldController.text.trim();
      request.fields['PasswordHash'] = passwordFieldController.text.trim();
      request.fields['TermsConditions'] = termsAndConditionCheckBox.toString();
      request.fields['FullName'] = fullNameFieldController.text.trim();

      log('request.fields: ${request.fields}');

      var response = await request.send();
      log('response: ${response.request}');

      response.stream
          .transform(const Utf8Decoder())
          .transform(const LineSplitter())
          .listen((value) async {
        UserSignUpModel response1 =
            UserSignUpModel.fromJson(json.decode(value));
        log('response1 :::::: ${response1.statusCode}');
        isStatus = response1.statusCode.obs;

        if (isStatus.value == 200) {
          // UserDetails.customerId = response1.data.id;
          Fluttertoast.showToast(
              msg: "${response1.message}. Please confirm your email.");
          clearSignUpFieldsFunction();

          if (signInRoute == SignInRoute.fromBookScreen) {
            Get.back();
            Get.back();
          } else {
            Get.off(() => SignInScreen(), transition: Transition.zoom);
          }
        } else {
          log(response1.data.toString());
          Fluttertoast.showToast(msg: response1.message);
          log('False False');
        }
      });
    } catch (e) {
      log('SignUp Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future signInWithGoogleFunction() async {
    isLoading(true);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
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
      // User? user = result.user;
      log("Email: ${result.user!.email}");
      log("Username: ${result.user!.displayName}");
      log("User Id: ${result.user!.uid}");

      //login = prefs.getString('userId');
      //print(login);
      if (result != null) {
        String userName = result.user!.displayName!;
        String email = result.user!.email!;
        userNameFieldController.text = userName.wordCapitalize();
        emailFieldController.text = email;
        passwordFieldController.text = "${userNameFieldController.text}@123";

        await userSignUpFunction();

        // prefs.setString('userId', result.user!.uid);
        // prefs.setString('userName', result.user!.displayName!);
        // prefs.setString('email', result.user!.email!);
        // prefs.setString('photo', result.user!.photoURL!);
        // prefs.setBool('isLoggedIn', false);

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
        emailFieldController.text = email!;
      }
      imageUrl = await plugin1.getProfileImageUrl(width: 100);
      if (profile != null) {
        if (profile!.userId.isNotEmpty) {
          String userName = profile!.name!;
          userNameFieldController.text = userName.wordCapitalize();
          passwordFieldController.text = "${userNameFieldController.text}@123";

          await userSignUpFunction();

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

  clearSignUpFieldsFunction() {
    userNameFieldController.clear();
    lastNameFieldController.clear();
    emailFieldController.clear();
    mobileFieldController.clear();
    passwordFieldController.clear();
    cPasswordFieldController.clear();
    stateFieldController.clear();
    cityFieldController.clear();
    genderFieldController.clear();
  }
}
