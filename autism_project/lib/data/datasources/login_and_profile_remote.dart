import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/core/helper/constants.dart';
import 'package:autism_project/data/models/login_request_model.dart';
import 'package:autism_project/data/models/login_and_profile_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginAndProfileRemoteDataSource {
  Future<LoginAndProfileResponseModel> fetchLoginResponse(
      LoginRequestModel requestModel);

  Future<LoginAndProfileResponseModel> fetchProfileData();
}

class LoginAndProfileAPIService implements LoginAndProfileRemoteDataSource {
  @override
  Future<LoginAndProfileResponseModel> fetchLoginResponse(
          LoginRequestModel requestModel) =>
      _fetchLoginResponse(requestModel);

  @override
  Future<LoginAndProfileResponseModel> fetchProfileData() =>
      _fetchProfileData();

  Future<LoginAndProfileResponseModel> _fetchLoginResponse(
      LoginRequestModel requestModel) async {
    String url = "http://199.192.28.11/stationary/v1/login-delivery-api.php";

    final response =
        await http.post(url, body: loginRequestToJson(requestModel));
    if (response.statusCode == 200) {
      return loginAndProfileResponseFromJson(response.body);
    } else {
      // return null;
      //TODO: create new exception
      throw Exception('Unable to fetch Data from rest api');
    }
  }

  Future<LoginAndProfileResponseModel> _fetchProfileData() async {
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
      return loginAndProfileResponseFromJson(stringToDecode);
    } catch (e) {
      print(e);
    }
  }
}
