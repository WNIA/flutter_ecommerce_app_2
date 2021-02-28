import 'package:autism_project/features/finished_delivery/domain/repository/finished_delivey_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FinishedDeliveryPaginationUseCase {
  final FinishedDeliveryRepository finishedDeliveryRepository;

  FinishedDeliveryPaginationUseCase(
      {@required this.finishedDeliveryRepository});

  Future<List> call(int page, String token) async {
    return finishedDeliveryRepository.callFinishedDeliveryRepository(
        page, token);
  }
}
