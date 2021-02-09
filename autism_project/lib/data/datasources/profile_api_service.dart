import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/data/models/profile_response_model.dart';
import 'package:flutter/material.dart';

class ProfileAPIService extends ChangeNotifier {
  ProfileResponseModel _responseModel = ProfileResponseModel();

  fetchProfileData() async {
    try {
      String stringToDecode = "";
      final client = HttpClient();
      final stringBuffer = StringBuffer();
      final completer = Completer();
      final request = await client.getUrl(Uri.parse(
          "http://199.192.28.11/stationary/v1/get-delivery-user-profile.php"));
      request.headers
          .set("Authorization", Constants.myToken, preserveHeaderCase: true);
      final response = await request.close();
      print(response.statusCode);
      response.transform(utf8.decoder).listen((event) {
        stringBuffer.write(event);
      }, onDone: () => completer.complete(stringBuffer.toString()));
      stringToDecode = await completer.future;
      print(stringToDecode);
      _responseModel = profileResponseModelFromJson(stringToDecode);
      return _responseModel;
    } catch (e) {
      print(e);
    }
  }
}
