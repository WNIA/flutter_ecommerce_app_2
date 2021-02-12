import 'package:autism_project/domain/usecase/finished_deliveries_usecase.dart';
import 'package:flutter/material.dart';

class FinishedDeliveriesProvider with ChangeNotifier {
  final FinishedDeliveriesUseCase _finishedDeliveriesUseCase;

  FinishedDeliveriesProvider({@required FinishedDeliveriesUseCase finishedDeliveriesUseCase}) : _finishedDeliveriesUseCase = finishedDeliveriesUseCase;

  String error;
  List data;

  getFinishedDeliveriesProvider(int page, String token) async{
    final result = await _finishedDeliveriesUseCase.callFinishedDeliveriesUseCase(page, token);
    result.fold((l){
      error = 'failed attempt';
    }, (r){
      data = r;
    });
    notifyListeners();
    return data;
  }
}
