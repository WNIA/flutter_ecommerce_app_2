import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/data/models/processed_deliveries_response_model.dart';
import 'package:autism_project/data/models/processed_delivery_details_response_model.dart';
import 'package:autism_project/data/models/processed_delivery_list_response_model.dart';

abstract class ProcessDeliveriesRemoteDataSource {
  Future<ProcessedDeliveriesResponseModel> fetchProcessedDeliveriesPagination(
      int page, String token);

  Future<ProcessedDeliveriesListResponseModel> fetchProcessedDeliveriesList(
      String token, int orderId);

  Future<ProcessedDeliveriesDetailsResponseModel>
      fetchProcessedDeliveriesDetails(String token, int orderId);
}

class ProcessedDeliveriesAPIService
    implements ProcessDeliveriesRemoteDataSource {
  @override
  Future<ProcessedDeliveriesResponseModel> fetchProcessedDeliveriesPagination(
          int page, String token) =>
      _fetchProcessedDeliveriesPagination(page, token);

  @override
  Future<ProcessedDeliveriesListResponseModel> fetchProcessedDeliveriesList(
          String token, int orderId) =>
      _fetchProcessedDeliveriesList(token, orderId);

  @override
  Future<ProcessedDeliveriesDetailsResponseModel>
      fetchProcessedDeliveriesDetails(String token, int orderId) =>
          _fetchProcessedDeliveriesDetails(token, orderId);

  Future<ProcessedDeliveriesResponseModel> _fetchProcessedDeliveriesPagination(
      int page, String token) async {
    final stringBuffer = StringBuffer();
    final completer = Completer<String>();

    String stringToDecode = "";
    final client = HttpClient();
    final request = await client.postUrl(Uri.parse(
        "http://199.192.28.11/stationary/v1/get-delivery-processing-pagination.php"));
    request.headers.set("Authorization", token, preserveHeaderCase: true);
    request.write(
        '{"limit": 10,"page": $page,"Latitude": 23.8084641,"Longititude": 90.4277429}');

    final response = await request.close();
    print(response.statusCode);
    response.transform(utf8.decoder).listen((contents) {
      stringBuffer.write(contents);
    }, onDone: () => completer.complete(stringBuffer.toString()));
    stringToDecode = await completer.future;

    if (response.statusCode == 200) {
      return processedDeliveriesResponseModelFromJson(stringToDecode);
    } else {
      throw Exception('Unable to fetch Data from rest api');
    }
  }

  Future<ProcessedDeliveriesListResponseModel> _fetchProcessedDeliveriesList(
      String token, int orderId) async {
    final stringBuffer = StringBuffer();
    final completer = Completer<String>();

    String stringToDecode = "";
    final client = HttpClient();
    final request = await client.postUrl(Uri.parse(
        "http://199.192.28.11/stationary/v1/customer-order-products-delivery.php"));
    request.headers.set("Authorization", token, preserveHeaderCase: true);
    request.write('{"OrderId": $orderId}');

    final response = await request.close();
    print(response.statusCode);
    response.transform(utf8.decoder).listen((contents) {
      stringBuffer.write(contents);
    }, onDone: () => completer.complete(stringBuffer.toString()));
    stringToDecode = await completer.future;

    if (response.statusCode == 200) {
      return processedDeliveriesListResponseModelFromJson(stringToDecode);
    } else {
      throw Exception('Unable to fetch Data from rest api');
    }
  }

  Future<ProcessedDeliveriesDetailsResponseModel>
      _fetchProcessedDeliveriesDetails(String token, int orderId) async {
    final stringBuffer = StringBuffer();
    final completer = Completer<String>();

    String stringToDecode = "";
    final client = HttpClient();
    final request = await client.postUrl(Uri.parse(
        "http://199.192.28.11/stationary/v1/get-delivery-customer-order-details.php"));
    request.headers.set("Authorization", token, preserveHeaderCase: true);
    request.write('{"OrderId": $orderId}');

    final response = await request.close();
    response.transform(utf8.decoder).listen((contents) {
      stringBuffer.write(contents);
    }, onDone: () => completer.complete(stringBuffer.toString()));
    stringToDecode = await completer.future;
    print(stringToDecode);

    if (response.statusCode == 200) {
      return processedDeliveriesDetailsResponseModelFromJson(stringToDecode);
    } else {
      throw Exception('Unable to fetch Data from rest api');
    }
  }
}
