import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/data/models/processed_delivery_list_response_model.dart';
import 'package:flutter/material.dart';

class ProcessedDeliveriesListAPIService extends ChangeNotifier{
  fetchProcessedDeliveriesList(String token, int orderId) async {
    try {
      final stringBuffer = StringBuffer();
      final completer = Completer<String>();

      String stringToDecode = "";
      List data = new List();
      ProcessedDeliveriesListResponseModel responseModel = new ProcessedDeliveriesListResponseModel();
      String _token = token;
      final client = HttpClient();
      final request = await client.postUrl(Uri.parse("http://199.192.28.11/stationary/v1/customer-order-products-delivery.php"));
      request.headers.set("Authorization", _token, preserveHeaderCase: true);
      request.write('{"OrderId": $orderId}');
      final response = await request.close();
      print(response.statusCode);
      response.transform(utf8.decoder).listen((contents) {
        stringBuffer.write(contents);
      }, onDone: () => completer.complete(stringBuffer.toString()));
      stringToDecode = await completer.future;
      print(stringToDecode);
      print('list');
      responseModel = processedDeliveriesListResponseModelFromJson(stringToDecode);
      int len = responseModel.data.length;
      for (int i = 0; i < len; i++) {
        data.add(responseModel.data[i].toJson());
      }
      notifyListeners();
      return data;
    } catch (e) {
      print(e);
    }
  }

}