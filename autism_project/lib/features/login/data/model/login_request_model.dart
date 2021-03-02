import 'package:autism_project/features/login/domain/entity/login_request_entity.dart';


class LoginRequestModel extends LoginRequestEntity {
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
