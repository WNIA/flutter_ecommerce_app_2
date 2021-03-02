import 'package:autism_project/features/finished_delivery/domain/usecase/finished_delivery_usecase.dart';
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
