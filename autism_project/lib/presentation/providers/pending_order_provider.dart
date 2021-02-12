import 'package:autism_project/domain/usecase/pending_order_usecase.dart';
import 'package:flutter/material.dart';

class PendingOrderProvider with ChangeNotifier {
  final PendingOrderUseCase _pendingOrderUseCase;

  PendingOrderProvider({@required PendingOrderUseCase pendingOrderUseCase}) : _pendingOrderUseCase = pendingOrderUseCase;

  String error;
  List data;

  getPendingOrderProvider(int page, String token) async {
    final result = await _pendingOrderUseCase.callPendingOrderUseCase(page, token);
    result.fold((l){
    error = 'failed attempt';
    }, (r){
      data = r;
    });
    notifyListeners();
    return data;
  }
}