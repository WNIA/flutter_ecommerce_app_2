import 'dart:convert';

LoginRequestModel loginRequestFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
  LoginRequestModel({
    this.email,
    this.password,
  });

  String email;
  String password;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
    email: json["Email"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "Email": email,
    "Password": password,
  };
}
