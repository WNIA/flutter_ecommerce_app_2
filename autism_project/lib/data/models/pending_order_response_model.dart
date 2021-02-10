import 'dart:convert';

import 'package:autism_project/domain/entity/pending_order_response_entity.dart';


PendingOrderResponseModel pendingOrderResponseFromJson(String str) =>
    PendingOrderResponseModel.fromJson(json.decode(str));

String pendingOrderResponseToJson(PendingOrderResponseModel data) =>
    json.encode(data.toJson());

class PendingOrderResponseModel extends PendingOrderResponseEntity{
  PendingOrderResponseModel({
    int status,
    bool success,
    List<PendingOrderData> data,
    String message,
  }) : super(status: status, success: success, data: data, message: message);

  factory PendingOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      PendingOrderResponseModel(
        status: json["status"],
        success: json["success"],
        data: List<PendingOrderData>.from(json["data"].map((x) => PendingOrderData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class PendingOrderData {
  PendingOrderData({
    this.id,
    this.shopId,
    this.customerId,
    this.created,
    this.orderAddress,
    this.orderLatitude,
    this.orderLongitude,
    this.orderArea,
    this.name,
    this.mobileNumber,
    this.email,
    this.picture,
    this.distance,
  });

  int id;
  int shopId;
  int customerId;
  DateTime created;
  String orderAddress;
  double orderLatitude;
  double orderLongitude;
  String orderArea;
  String name;
  String mobileNumber;
  String email;
  String picture;
  double distance;

  factory PendingOrderData.fromJson(Map<String, dynamic> json) => PendingOrderData(
        id: json["Id"],
        shopId: json["ShopId"],
        customerId: json["CustomerId"],
        created: DateTime.parse(json["Created"]),
        orderAddress: json["OrderAddress"],
        orderLatitude: json["OrderLatitude"].toDouble(),
        orderLongitude: json["OrderLongitude"].toDouble(),
        orderArea: json["OrderArea"],
        name: json["Name"],
        mobileNumber: json["MobileNumber"],
        email: json["Email"],
        picture: json["Picture"],
        distance: json["distance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ShopId": shopId,
        "CustomerId": customerId,
        "Created": created.toIso8601String(),
        "OrderAddress": orderAddress,
        "OrderLatitude": orderLatitude,
        "OrderLongitude": orderLongitude,
        "OrderArea": orderArea,
        "Name": name,
        "MobileNumber": mobileNumber,
        "Email": email,
        "Picture": picture,
        "distance": distance,
      };
}
