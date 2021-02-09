import 'package:autism_project/data/models/login_request_model.dart';
import 'package:autism_project/data/models/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAPIService extends ChangeNotifier {
  LoginResponseModel _userDataList = LoginResponseModel();

  // LoginResponseModel get userDataList => _userDataList;

  Future<LoginResponseModel> fetchLoginResponse(
      LoginRequestModel requestModel) async {
    String url = "http://199.192.28.11/stationary/v1/login-delivery-api.php";

    final response =
        await http.post(url, body: loginRequestToJson(requestModel));
    if (response.statusCode == 200) {
      _userDataList = loginResponseFromJson(response.body);
      notifyListeners();
    } else {
      _userDataList = null;
      notifyListeners();
      // throw Exception('Unable to fetch Data from rest api');
    }
    return _userDataList;
  }
}
