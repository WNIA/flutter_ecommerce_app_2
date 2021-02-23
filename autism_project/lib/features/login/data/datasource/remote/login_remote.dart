import 'dart:convert';

import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/features/login/data/model/login_request_model.dart';
import 'package:autism_project/features/login/data/model/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> callLoginRemote(LoginRequestModel requestModel);
}

class LoginRemoteImpl extends LoginRemoteDataSource {
  Future<LoginResponseModel> callLoginRemote(
      LoginRequestModel requestModel) async {
    String url = "http://199.192.28.11/stationary/v1/login-delivery-api.php";

    final response = await http.post(url, body: json.encode(requestModel));
    if (response.statusCode == 200) {
      final lrm = LoginResponseModel.fromJson(json.decode(response.body));
      return lrm;
    } else {
      throw ServerException();
    }
  }
}
