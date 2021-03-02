import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/domain/usecase/finished_delivery_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FinishedDeliveryProvider extends ChangeNotifier {
  final FinishedDeliveryPaginationUseCase _finishedDeliveryUseCase;

  FinishedDeliveryProvider(
      {@required FinishedDeliveryPaginationUseCase finishedDeliveryUseCase})
      : _finishedDeliveryUseCase = finishedDeliveryUseCase;

  Future<List> callFinishedDeliveryAPI(int page, String token) {
    return _finishedDeliveryUseCase.call(page, token);
  }
}
