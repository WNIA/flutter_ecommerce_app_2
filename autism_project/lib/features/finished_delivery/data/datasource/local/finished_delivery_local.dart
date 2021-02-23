import 'dart:convert';

import 'package:autism_project/features/finished_delivery/data/model/finished_delivery_response_model.dart';
import 'package:flutter/material.dart';

abstract class FinishedDeliveryLocal {
  Future<List> fetchLocalJson(BuildContext context);
}

class FinishedDeliveryLocalImpl implements FinishedDeliveryLocal {
  @override
  Future<List> fetchLocalJson(BuildContext context) async {
    String j = await DefaultAssetBundle.of(context)
        .loadString("assets/json/finished_delivery.json");
    final responseModel =
        FinishedDeliveryResponseModel.fromJson(json.decode(j));
    List data = [];
    int length = responseModel.data.length;

    for (int i = 0; i < length; i++) {
      data.add(responseModel.data[i].toJson());
    }
    return data;
  }
}
