import 'dart:developer';
import 'package:booking_management/common_ui/common_screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  log('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// For Background
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      //'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  //firebaseMessaging.setForegroundNotificationPresentationOptions(sound: true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseMessaging.getToken().then((token) {
      log("token token $token");
      // Firebasetoken = token;
      //prefs.setString('apiToken', token);
      //SharedUserPreferences().setDeviceToken(token);
    });
    //checkForInitialMessage();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage ? message) {
      if (message != null) {
        print('we can now navigate to specific screen');
        /*Navigator.pushNamed(context, '/message',
            arguments: MessageArguments(message, true));*/
      }
    });

    /// For Forground Notification
    FirebaseMessaging.onMessage.listen((RemoteMessage ? message) {
      RemoteNotification ? notification = message!.notification;
      AndroidNotification ? android = message.notification!.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                //channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    ///Background notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      /* Navigator.pushNamed(context, '/message',
          arguments: MessageArguments(message, true));*/
    });
  }

  // For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      print('For handling notification when the app is in terminated state');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Booking Management System",
      debugShowCheckedModeBanner: false,


      home: SplashScreen(),
    );
  }
}
