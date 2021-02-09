import 'dart:convert';

ProcessedDeliveriesResponseModel processedDeliveriesResponseModelFromJson(String str) => ProcessedDeliveriesResponseModel.fromJson(json.decode(str));

String processedDeliveriesResponseModelToJson(ProcessedDeliveriesResponseModel data) => json.encode(data.toJson());

class ProcessedDeliveriesResponseModel {
  ProcessedDeliveriesResponseModel({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  int status;
  bool success;
  List<ProcessedDeliveryData> data;
  String message;

  factory ProcessedDeliveriesResponseModel.fromJson(Map<String, dynamic> json) => ProcessedDeliveriesResponseModel(
    status: json["status"],
    success: json["success"],
    data: List<ProcessedDeliveryData>.from(json["data"].map((x) => ProcessedDeliveryData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ProcessedDeliveryData {
  ProcessedDeliveryData({
    this.name,
    this.email,
    this.mobileNumber,
    this.picture,
    this.orderLatitude,
    this.orderLongitude,
    this.shopId,
    this.id,
    this.invoiceNumber,
    this.deliveryCharge,
    this.orderDetails,
    this.status,
    this.created,
    this.customerId,
    this.orderId,
    this.distance,
  });

  String name;
  String email;
  String mobileNumber;
  String picture;
  double orderLatitude;
  double orderLongitude;
  int shopId;
  int id;
  String invoiceNumber;
  int deliveryCharge;
  String orderDetails;
  int status;
  DateTime created;
  int customerId;
  int orderId;
  double distance;

  factory ProcessedDeliveryData.fromJson(Map<String, dynamic> json) => ProcessedDeliveryData(
    name: json["Name"],
    email: json["Email"],
    mobileNumber: json["MobileNumber"],
    picture: json["Picture"],
    orderLatitude: json["OrderLatitude"].toDouble(),
    orderLongitude: json["OrderLongitude"].toDouble(),
    shopId: json["ShopId"],
    id: json["Id"],
    invoiceNumber: json["InvoiceNumber"],
    deliveryCharge: json["DeliveryCharge"],
    orderDetails: json["OrderDetails"],
    status: json["Status"],
    created: DateTime.parse(json["Created"]),
    customerId: json["CustomerId"],
    orderId: json["OrderId"],
    distance: json["distance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Email": email,
    "MobileNumber": mobileNumber,
    "Picture": picture,
    "OrderLatitude": orderLatitude,
    "OrderLongitude": orderLongitude,
    "ShopId": shopId,
    "Id": id,
    "InvoiceNumber": invoiceNumber,
    "DeliveryCharge": deliveryCharge,
    "OrderDetails": orderDetails,
    "Status": status,
    "Created": created.toIso8601String(),
    "CustomerId": customerId,
    "OrderId": orderId,
    "distance": distance,
  };
}
