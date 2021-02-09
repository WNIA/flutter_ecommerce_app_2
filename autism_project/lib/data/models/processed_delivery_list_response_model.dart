// To parse this JSON data, do
//
//     final processedDeliveriesListResponseModel = processedDeliveriesListResponseModelFromJson(jsonString);

import 'dart:convert';

ProcessedDeliveriesListResponseModel processedDeliveriesListResponseModelFromJson(String str) => ProcessedDeliveriesListResponseModel.fromJson(json.decode(str));

String processedDeliveriesListResponseModelToJson(ProcessedDeliveriesListResponseModel data) => json.encode(data.toJson());

class ProcessedDeliveriesListResponseModel {
  ProcessedDeliveriesListResponseModel({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  int status;
  bool success;
  List<ProcessedDeliveryListData> data;
  String message;

  factory ProcessedDeliveriesListResponseModel.fromJson(Map<String, dynamic> json) => ProcessedDeliveriesListResponseModel(
    status: json["status"],
    success: json["success"],
    data: List<ProcessedDeliveryListData>.from(json["data"].map((x) => ProcessedDeliveryListData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class ProcessedDeliveryListData {
  ProcessedDeliveryListData({
    this.id,
    this.name,
    this.quantity,
    this.price,
    this.productId,
    this.orderId,
    this.orderStatus,
    this.picture,
    this.shopId,
    this.created,
    this.customerId,
    this.returnProduct,
    this.returnReason,
  });

  int id;
  String name;
  int quantity;
  int price;
  int productId;
  int orderId;
  int orderStatus;
  String picture;
  int shopId;
  DateTime created;
  int customerId;
  dynamic returnProduct;
  dynamic returnReason;

  factory ProcessedDeliveryListData.fromJson(Map<String, dynamic> json) => ProcessedDeliveryListData(
    id: json["Id"],
    name: json["Name"],
    quantity: json["Quantity"],
    price: json["Price"],
    productId: json["ProductId"],
    orderId: json["OrderId"],
    orderStatus: json["OrderStatus"],
    picture: json["Picture"],
    shopId: json["ShopId"],
    created: DateTime.parse(json["Created"]),
    customerId: json["CustomerId"],
    returnProduct: json["ReturnProduct"],
    returnReason: json["ReturnReason"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "Quantity": quantity,
    "Price": price,
    "ProductId": productId,
    "OrderId": orderId,
    "OrderStatus": orderStatus,
    "Picture": picture,
    "ShopId": shopId,
    "Created": created.toIso8601String(),
    "CustomerId": customerId,
    "ReturnProduct": returnProduct,
    "ReturnReason": returnReason,
  };
}
