import 'package:autism_project/features/finished_delivery/domain/usecase/finished_delivery_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FinishedDeliveryProvider with ChangeNotifier {
  final FinishedDeliveryPaginationUseCase _finishedDeliveryUseCase;

  FinishedDeliveryProvider(
      {@required FinishedDeliveryPaginationUseCase finishedDeliveryUseCase})
      : _finishedDeliveryUseCase = finishedDeliveryUseCase;

  bool isLoading = false;
  List deliveryData;
  String error;

  Future<void> loadFinishedDeliveryPaginationData(
      int page, String token, BuildContext context) async {
    isLoading = true;
    // notifyListeners();

    final result = await _finishedDeliveryUseCase(page, token, context);

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
    notifyListeners();
  }
}
