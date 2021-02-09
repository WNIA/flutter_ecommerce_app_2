// To parse this JSON data, do
//
//     final processedDeliveriesDetailsResponseModel = processedDeliveriesDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

ProcessedDeliveriesDetailsResponseModel processedDeliveriesDetailsResponseModelFromJson(String str) => ProcessedDeliveriesDetailsResponseModel.fromJson(json.decode(str));

String processedDeliveriesDetailsResponseModelToJson(ProcessedDeliveriesDetailsResponseModel data) => json.encode(data.toJson());

class ProcessedDeliveriesDetailsResponseModel {
  ProcessedDeliveriesDetailsResponseModel({
    this.status,
    this.success,
    this.data,
    this.message,
  });

  int status;
  bool success;
  ProcessedDeliveryDetailsData data;
  String message;

  factory ProcessedDeliveriesDetailsResponseModel.fromJson(Map<String, dynamic> json) => ProcessedDeliveriesDetailsResponseModel(
    status: json["status"],
    success: json["success"],
    data: ProcessedDeliveryDetailsData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class ProcessedDeliveryDetailsData {
  ProcessedDeliveryDetailsData({
    this.discount,
    this.total,
    this.invoiceNumber,
    this.deliveryCharge,
  });

  int discount;
  int total;
  String invoiceNumber;
  int deliveryCharge;

  factory ProcessedDeliveryDetailsData.fromJson(Map<String, dynamic> json) => ProcessedDeliveryDetailsData(
    discount: json["Discount"],
    total: json["Total"],
    invoiceNumber: json["InvoiceNumber"],
    deliveryCharge: json["DeliveryCharge"],
  );

  Map<String, dynamic> toJson() => {
    "Discount": discount,
    "Total": total,
    "InvoiceNumber": invoiceNumber,
    "DeliveryCharge": deliveryCharge,
  };
}
