import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:autism_project/data/models/processed_delivery_details_response_model.dart';
import 'package:flutter/material.dart';

class ProcessedDeliveriesDetailsAPIService extends ChangeNotifier{
  fetchProcessedDeliveriesDetails(String token, int orderId) async {
    try {
      final stringBuffer = StringBuffer();
      final completer = Completer<String>();

      String stringToDecode = "";
      ProcessedDeliveriesDetailsResponseModel responseModel = new ProcessedDeliveriesDetailsResponseModel();
      String _token = token;
      final client = HttpClient();
      final request = await client.postUrl(Uri.parse("http://199.192.28.11/stationary/v1/get-delivery-customer-order-details.php"));
      request.headers.set("Authorization", _token, preserveHeaderCase: true);
      request.write('{"OrderId": $orderId}');
      final response = await request.close();
      print(response.statusCode);
      response.transform(utf8.decoder).listen((contents) {
        stringBuffer.write(contents);
      }, onDone: () => completer.complete(stringBuffer.toString()));
      stringToDecode = await completer.future;
      print(stringToDecode);
      print('details');
      responseModel = processedDeliveriesDetailsResponseModelFromJson(stringToDecode);

      notifyListeners();
      return responseModel;
    } catch (e) {
      print(e);
    }
  }

}