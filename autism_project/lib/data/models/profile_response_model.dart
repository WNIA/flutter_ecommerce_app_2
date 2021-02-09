import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) => ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) => json.encode(data.toJson());

class ProfileResponseModel {
  ProfileResponseModel({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  int status;
  bool success;
  ProfileData data;
  String message;

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => ProfileResponseModel(
    status: json["status"],
    success: json["success"],
    data: ProfileData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class ProfileData {
  ProfileData({
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

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
