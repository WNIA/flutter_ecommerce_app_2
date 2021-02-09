import 'package:autism_project/data/models/pending_order_response_model.dart';
import 'package:flutter/material.dart';

class LocalJsonService {
  fetchLocalJson(BuildContext context, int page) async {
    try {
      if (page < 3) {
        String json = await DefaultAssetBundle.of(context)
            .loadString("assets/json/pending_order_$page.json");
        PendingOrderResponseModel responseModel =
            pendingOrderResponseFromJson(json);
        List data = new List();
        int length = responseModel.data.length;

        for (int i = 0; i < length; i++) {
          data.add(responseModel.data[i].toJson());
          // print(data);
          // print("-------------------> $i");
          // print("--------------------------> $page");
        }
        return data;
      }
    } catch (e) {
      print(e);
    }
  }
}
