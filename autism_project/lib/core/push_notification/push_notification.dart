import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

abstract class PushNotification{
  Future init();
}

class PushNotificationImpl implements PushNotification {
  final FirebaseMessaging firebaseMessaging;

  PushNotificationImpl({this.firebaseMessaging});

  @override
  Future init() async {
    if (Platform.isIOS) {
      firebaseMessaging
          .requestNotificationPermissions(IosNotificationSettings());
    }
    firebaseMessaging.configure(
      //when app is open and receives push notif
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      //when app is completely closed and opens via push notif
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _serialiseAndNavigate(message);
      },
      //when app is in the background and opens via push notif
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _serialiseAndNavigate(message);
      },
    );
  }
  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];
    if(view != null){
      if(view == 'create_post'){

      }
    }
  }
}
