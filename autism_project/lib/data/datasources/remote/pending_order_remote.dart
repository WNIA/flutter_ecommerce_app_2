import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/data/models/pending_order_response_model.dart';

abstract class PendingOrderRemoteDataSource {
  Future<List> fetchPendingOrderPaginationRemote(
      int page, String token);
}

class PendingOrderAPIService implements PendingOrderRemoteDataSource {
  @override
  Future<List> fetchPendingOrderPaginationRemote(
          int page, String token) =>
      _fetchPendingOrderPaginationAPI(page, token);

  Future<List> _fetchPendingOrderPaginationAPI(
      int page, String token) async {
    final stringBuffer = StringBuffer();
    final completer = Completer<String>();

    String stringToDecode = "";
    List data = [];
    String _token = token;
    final client = HttpClient();
    final request = await client.postUrl(Uri.parse(
        "http://199.192.28.11/stationary/v1/get-delivery-pending-order-pagination.php"));
    request.headers
        .set("Content-Type", "application/json", preserveHeaderCase: true);
    request.headers.set("Accept", "application/json", preserveHeaderCase: true);
    request.headers.set("Authorization", _token, preserveHeaderCase: true);
    request.write(
        '{"limit": 10,"page": $page,"Latitude": 23.7747523,"Longititude": 90.3654215}');

    final response = await request.close();
    response.transform(utf8.decoder).listen((contents) {
      stringBuffer.write(contents);
    }, onDone: () => completer.complete(stringBuffer.toString()));
    stringToDecode = await completer.future;

    if (response.statusCode == 200) {
      final result = pendingOrderResponseFromJson(stringToDecode);
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
