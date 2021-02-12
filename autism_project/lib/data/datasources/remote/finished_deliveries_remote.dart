import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/data/models/finished_deliveries_response_model.dart';

abstract class FinishedDeliveriesRemoteDataSource {
  Future<List> fetchFinishedDeliveriesPaginationRemote(
      int page, String token);
}

class FinishedDeliveriesAPIService
    implements FinishedDeliveriesRemoteDataSource {
  @override
  Future<List> fetchFinishedDeliveriesPaginationRemote(
          int page, String token) =>
      _fetchFinishedDeliveriesPaginationAPI(page, token);

  Future<List> _fetchFinishedDeliveriesPaginationAPI(
      int page, String token) async {
    final stringBuffer = StringBuffer();
    final completer = Completer<String>();
    List data = [];
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

    if (response.statusCode == 200) {
      final result = finishedDeliveriesResponseModelFromJson(stringToDecode);
      int len = result.data.length;
      for (int i = 0; i < len; i++) {
        data.add(result.data[i].toJson());
      }
      return data;
    } else {
      throw Exception('Unable to fetch Data from rest api');
    }
  }
}
