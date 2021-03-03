import 'dart:convert';

import 'package:autism_project/features/login/data/model/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> callLoginRemote(String email, String pass);
}

class LoginRemoteImpl extends LoginRemoteDataSource {
  Future<LoginResponseModel> callLoginRemote(String email, String pass) async {
    String url = "http://199.192.28.11/stationary/v1/login-delivery-api.php";
    String requestBody = '''{"Email":"$email","Password":"$pass"}''';

    final response =
        await http.post(url, body: requestBody);

    if (response.statusCode == 200) {
      final lrm = LoginResponseModel.fromJson(json.decode(response.body));
      print(lrm.message);
      return lrm;
    } else {
      return null;
    }
  }
}
