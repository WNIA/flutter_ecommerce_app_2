import 'dart:convert';

import 'package:autism_project/domain/entity/finished_deliveries_response_entity.dart';

FinishedDeliveriesResponseModel finishedDeliveriesResponseModelFromJson(String str) => FinishedDeliveriesResponseModel.fromJson(json.decode(str));

String finishedDeliveriesResponseModelToJson(FinishedDeliveriesResponseModel data) => json.encode(data.toJson());

class FinishedDeliveriesResponseModel extends FinishedDeliveriesResponseEntity {
  FinishedDeliveriesResponseModel({
    int status,
    bool success,
    List<FinishedDeliveriesResponseData> data,
    String message,
  }) : super(status: status, success: success, data: data, message: message);


  factory FinishedDeliveriesResponseModel.fromJson(Map<String, dynamic> json) => FinishedDeliveriesResponseModel(
    status: json["status"],
    success: json["success"],
    data: List<FinishedDeliveriesResponseData>.from(json["data"].map((x) => FinishedDeliveriesResponseData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class FinishedDeliveriesResponseData {
  FinishedDeliveriesResponseData({
    this.name,
    this.email,
    this.mobileNumber,
    this.picture,
    this.orderLatitude,
    this.orderLongitude,
    this.orderId,
    this.shopId,
    this.id,
    this.invoiceNumber,
    this.deliveryCharge,
    this.orderDetails,
    this.status,
    this.created,
    this.customerId,
  });

  String name;
  String email;
  String mobileNumber;
  String picture;
  double orderLatitude;
  double orderLongitude;
  int orderId;
  int shopId;
  int id;
  String invoiceNumber;
  int deliveryCharge;
  String orderDetails;
  int status;
  DateTime created;
  int customerId;

  factory FinishedDeliveriesResponseData.fromJson(Map<String, dynamic> json) => FinishedDeliveriesResponseData(
    name: json["Name"],
    email: json["Email"],
    mobileNumber: json["MobileNumber"],
    picture: json["Picture"],
    orderLatitude: json["OrderLatitude"].toDouble(),
    orderLongitude: json["OrderLongitude"].toDouble(),
    orderId: json["OrderId"],
    shopId: json["ShopId"],
    id: json["Id"],
    invoiceNumber: json["InvoiceNumber"],
    deliveryCharge: json["DeliveryCharge"],
    orderDetails: json["OrderDetails"],
    status: json["Status"],
    created: DateTime.parse(json["Created"]),
    customerId: json["CustomerId"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Email": email,
    "MobileNumber": mobileNumber,
    "Picture": picture,
    "OrderLatitude": orderLatitude,
    "OrderLongitude": orderLongitude,
    "OrderId": orderId,
    "ShopId": shopId,
    "Id": id,
    "InvoiceNumber": invoiceNumber,
    "DeliveryCharge": deliveryCharge,
    "OrderDetails": orderDetails,
    "Status": status,
    "Created": created.toIso8601String(),
    "CustomerId": customerId,
  };
}