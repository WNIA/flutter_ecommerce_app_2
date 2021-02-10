import 'dart:convert';

import 'package:autism_project/domain/entity/login_request_entity.dart';

LoginRequestModel loginRequestFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel extends LoginRequestEntity{
  LoginRequestModel({
    String email,
    String password,
  }) : super(email: email, password: password);

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
    email: json["Email"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "Email": email,
    "Password": password,
  };
}
