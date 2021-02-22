import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/features/finished_delivery/data/model/finished_delivery_response_model.dart';
import 'package:flutter/foundation.dart';

abstract class FinishedDeliveryRemote {
  Future<List> callFinishedDeliveryRemote(int page, String token);
}

class FinishedDeliveryRemoteImpl implements FinishedDeliveryRemote {
  final HttpClient client;

  FinishedDeliveryRemoteImpl({@required this.client});
  List allData = List();
  @override
  Future<List> callFinishedDeliveryRemote(int page, String token) async {
    final sBuffer = StringBuffer();
    final completer = Completer();

    final request = await client.postUrl(Uri.parse(
        "http://199.192.28.11/stationary/v1/get-delivery-own-deliveries-pagination.php"));
    request.headers.set("Authorization", token, preserveHeaderCase: true);
    request.write('{"limit": 10,"page": $page}');

    final response = await request.close();
    response.transform(utf8.decoder).listen((event) {
      sBuffer.write(event);
    }, onDone: () => completer.complete(sBuffer.toString()));
    String decode = await completer.future;
    List data = [];
    if (response.statusCode == 200) {

      final fdrm = FinishedDeliveryResponseModel.fromJson(json.decode(decode));
      print(fdrm);
      for(int i = 0; i < fdrm.data.length; i++){
       data.add(fdrm.data[i].toJson());
      }
      allData.addAll(data);
      return allData;
    } else {
      throw ServerException();
    }
  }
}
