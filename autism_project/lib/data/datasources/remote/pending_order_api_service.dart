import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:autism_project/data/models/pending_order_response_model.dart';


List<PendingOrderAPIService> _customerPendingOrder;

List<PendingOrderAPIService> get customerPendingOrderList =>
    _customerPendingOrder;

/*
      * fetch data from server
      * HttpClient used to preserve header
      * Data chunks are stored in StringBuffer -> Completer[when completed] -> String[for json.decode] -> List[returns]
      * @WNIA*/
class PendingOrderAPIService {

  fetchPendingOrderPagination(int page, String token) async {
    try {
      final stringBuffer = StringBuffer();
      final completer = Completer<String>();

      String stringToDecode = "";
      List data = new List();
      PendingOrderResponseModel responseModel = new PendingOrderResponseModel();

      String _token = token;
      final client = HttpClient();
      final request = await client.postUrl(Uri.parse("http://199.192.28.11/stationary/v1/get-delivery-pending-order-pagination.php"));
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
      print(stringToDecode);
      responseModel = pendingOrderResponseFromJson(stringToDecode);

      int len = responseModel.data.length;
      for (int i = 0; i < len; i++) {
        data.add(responseModel.data[i].toJson());
      }
      return data;
    } catch (e) {
      print(e);
    }
  }
}
