import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  final FirebaseMessaging fcm;

  PushNotification({this.fcm});

  Future initialize() async {
    if (Platform.isIOS) {
      //request permission
      fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _showDialogueBox(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _navigateToDetails();
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _navigateToDetails();
      },
      onBackgroundMessage: myBackgroundMessageHandler,
    );
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }
    // Or do other work.
  }

  _showDialogueBox(Map<String, dynamic> message) {}

  _navigateToDetails() {}
}
