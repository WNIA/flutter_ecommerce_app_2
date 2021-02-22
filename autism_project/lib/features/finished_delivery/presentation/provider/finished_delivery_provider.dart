import 'package:autism_project/features/finished_delivery/domain/usecase/finished_delivery_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FinishedDeliveryProvider extends ChangeNotifier {
  final FinishedDeliveryPaginationUseCase _finishedDeliveryUseCase;

  FinishedDeliveryProvider(
      {@required FinishedDeliveryPaginationUseCase finishedDeliveryUseCase})
      : _finishedDeliveryUseCase = finishedDeliveryUseCase;

  bool isLoading = false;
  List deliveryData;
  String error;

  int _page = 1;

  Future<void> loadFinishedDeliveryPaginationData(
      String token) async {
    isLoading = true;
    // notifyListeners();

    final result = await _finishedDeliveryUseCase(_page, token);

    result.fold(
      (l) {
        error = "fail";
        isLoading = false;
      },
      (r) {
        deliveryData = r;
        isLoading = false;
      },
    );
    _page++;
    notifyListeners();
  }
}
