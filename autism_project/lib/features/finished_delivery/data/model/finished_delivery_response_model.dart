import 'package:autism_project/features/finished_delivery/domain/entity/finished_delivery_entity.dart';

class FinishedDeliveryResponseModel extends FinishedDeliveryEntity {
  FinishedDeliveryResponseModel({
    int status,
    bool success,
    List<FinishedDeliveryPaginationData> data,
    String message,
  }) : super(status: status, success: success, data: data, message: message);

  factory FinishedDeliveryResponseModel.fromJson(Map<String, dynamic> json) =>
      FinishedDeliveryResponseModel(
        status: json["status"],
        success: json["success"],
        data: List<FinishedDeliveryPaginationData>.from(json["data"]
            .map((x) => FinishedDeliveryPaginationData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class FinishedDeliveryPaginationData {
  FinishedDeliveryPaginationData({
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

  factory FinishedDeliveryPaginationData.fromJson(Map<String, dynamic> json) =>
      FinishedDeliveryPaginationData(
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
