import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/data/models/pending_order_response_model.dart';

abstract class PendingOrderRemoteDataSource {
  Future<PendingOrderResponseModel> fetchPendingOrderPagination(
      int page, String token);
}

class PendingOrderAPIService implements PendingOrderRemoteDataSource {
  @override
  Future<PendingOrderResponseModel> fetchPendingOrderPagination(
          int page, String token) =>
      _fetchPendingOrderPagination(page, token);

  Future<PendingOrderResponseModel> _fetchPendingOrderPagination(
      int page, String token) async {
    try {
      final stringBuffer = StringBuffer();
      final completer = Completer<String>();

      String stringToDecode = "";

      String _token = token;
      final client = HttpClient();
      final request = await client.postUrl(Uri.parse(
          "http://199.192.28.11/stationary/v1/get-delivery-pending-order-pagination.php"));
      request.headers
          .set("Content-Type", "application/json", preserveHeaderCase: true);
      request.headers
          .set("Accept", "application/json", preserveHeaderCase: true);
      request.headers.set("Authorization", _token, preserveHeaderCase: true);
      request.write(
          '{"limit": 10,"page": $page,"Latitude": 23.7747523,"Longititude": 90.3654215}');
      final response = await request.close();
      print(response.statusCode);
      response.transform(utf8.decoder).listen((contents) {
        stringBuffer.write(contents);
      }, onDone: () => completer.complete(stringBuffer.toString()));
      stringToDecode = await completer.future;
      return pendingOrderResponseFromJson(stringToDecode);
    } catch (e) {
      print(e);
    }
  }
}
