import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/data/models/login_request_model.dart';
import 'package:autism_project/data/models/login_and_profile_response_model.dart';
import 'package:http/http.dart' as http;

class LoginAndProfileAPIService{
  LoginAndProfileResponseModel _responseModel = LoginAndProfileResponseModel();

  Future<LoginAndProfileResponseModel> fetchLoginResponse(
      LoginRequestModel requestModel) async {
    String url = "http://199.192.28.11/stationary/v1/login-delivery-api.php";

    final response =
        await http.post(url, body: loginRequestToJson(requestModel));
    if (response.statusCode == 200) {
      _responseModel = loginAndProfileResponseFromJson(response.body);
    } else {
      _responseModel = null;
      // throw Exception('Unable to fetch Data from rest api');
    }
    return _responseModel;
  }
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
      _responseModel = loginAndProfileResponseFromJson(stringToDecode);
      return _responseModel;
    } catch (e) {
      print(e);
    }
  }

}
