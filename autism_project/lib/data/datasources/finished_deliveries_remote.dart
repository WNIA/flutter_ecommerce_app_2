import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/data/models/finished_deliveries_response_model.dart';

abstract class FinishedDeliveriesRemoteDataSource {
  Future<FinishedDeliveriesResponseModel> fetchFinishedDeliveriesPagination(
      int page, String token);
}

class FinishedDeliveriesAPIService
    implements FinishedDeliveriesRemoteDataSource {
  @override
  Future<FinishedDeliveriesResponseModel> fetchFinishedDeliveriesPagination(
          int page, String token) =>
      _fetchFinishedDeliveriesPagination(page, token);

  Future<FinishedDeliveriesResponseModel> _fetchFinishedDeliveriesPagination(
      int page, String token) async {
    try {
      final stringBuffer = StringBuffer();
      final completer = Completer<String>();

      String stringToDecode = "";
      final client = HttpClient();
      final request = await client.postUrl(Uri.parse(
          "http://199.192.28.11/stationary/v1/get-delivery-own-deliveries-pagination.php"));
      request.headers.set("Authorization", token, preserveHeaderCase: true);
      request.write('{"limit": 10,"page": $page}');
      final response = await request.close();
      print(response.statusCode);
      response.transform(utf8.decoder).listen((contents) {
        stringBuffer.write(contents);
      }, onDone: () => completer.complete(stringBuffer.toString()));
      stringToDecode = await completer.future;
      print(stringToDecode);
      return finishedDeliveriesResponseModelFromJson(stringToDecode);
    } catch (e) {
      print(e);
    }
  }
}
