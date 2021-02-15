import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/features/finished_delivery/domain/repository/finished_delivey_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FinishedDeliveryPaginationUseCase {
  final FinishedDeliveryRepository finishedDeliveryRepository;

  FinishedDeliveryPaginationUseCase({@required this.finishedDeliveryRepository});

  Future<Either<Failure, List>> call(int page, String token, BuildContext context) async {
    return finishedDeliveryRepository.callFinishedDeliveryRepository(page, token, context);
  }

}