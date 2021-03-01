import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/data/model/pending_order_response_model.dart';
import 'package:flutter/foundation.dart';

abstract class PendingOrderRemoteDataSource {
  Future<List> callPendingOrderRemote(int page, String token);
}

class PendingOrderRemoteImpl implements PendingOrderRemoteDataSource {
  final HttpClient client;

  PendingOrderRemoteImpl({@required this.client});

  List allData = List();

  @override
  Future<List> callPendingOrderRemote(int page, String token) async {
    try {
      final sBuffer = StringBuffer();
      final completer = Completer();

      final request = await client.postUrl(Uri.parse(
          "http://199.192.28.11/stationary/v1/get-delivery-pending-order-pagination.php"));
      request.headers
          .set("Content-Type", "application/json", preserveHeaderCase: true);
      request.headers
          .set("Accept", "application/json", preserveHeaderCase: true);
      request.headers.set("Authorization", token, preserveHeaderCase: true);
      request.write(
          '{"limit": 10,"page": $page,"Latitude": 23.7747523,"Longititude": 90.3654215}');
      final response = await request.close();
      response.transform(utf8.decoder).listen((event) {
        sBuffer.write(event);
      }, onDone: () => completer.complete(sBuffer.toString()));
      String decode = await completer.future;
      List data = [];
      final prm = PendingOrderResponseModel.fromJson(json.decode(decode));
      print(prm.message);
      for (int i = 0; i < prm.data.length; i++) {
        data.add(prm.data[i].toJson());
      }
      allData.addAll(data);
      return allData;
    } catch (e) {
      print(e);
    }
  }
}
