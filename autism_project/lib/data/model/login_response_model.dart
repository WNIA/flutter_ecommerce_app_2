import 'package:autism_project/domain/entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({
    int status,
    bool success,
    String jwt,
    LoginResponseData data,
    String message,
  }) : super(status: status, success: success, jwt: jwt, data: data, message: message);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        success: json["success"],
        jwt: json["jwt"],
        data: LoginResponseData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "jwt": jwt,
        "data": data.toJson(),
        "message": message,
      };
}

class LoginResponseData {
  int id;
  String name;
  String email;
  String password;
  String mobileNumber;
  int gender;
  String nid;
  int status;
  DateTime created;
  String picture;
  int deliveryStatus;
  dynamic latitude;
  dynamic longitude;

  LoginResponseData({
    this.id,
    this.name,
    this.email,
    this.password,
    this.mobileNumber,
    this.gender,
    this.nid,
    this.status,
    this.created,
    this.picture,
    this.deliveryStatus,
    this.latitude,
    this.longitude,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      LoginResponseData(
        id: json["Id"],
        name: json["Name"],
        email: json["Email"],
        password: json["Password"],
        mobileNumber: json["MobileNumber"],
        gender: json["Gender"],
        nid: json["NID"],
        status: json["Status"],
        created: DateTime.parse(json["Created"]),
        picture: json["Picture"],
        deliveryStatus: json["DeliveryStatus"],
        latitude: json["Latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Email": email,
        "Password": password,
        "MobileNumber": mobileNumber,
        "Gender": gender,
        "NID": nid,
        "Status": status,
        "Created": created.toIso8601String(),
        "Picture": picture,
        "DeliveryStatus": deliveryStatus,
        "Latitude": latitude,
        "longitude": longitude,
      };
}
