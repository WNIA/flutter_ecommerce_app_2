import 'package:autism_project/domain/entity/pending_order_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:autism_project/core/error/failure.dart';

abstract class PendingOrderRepository {
  Future<Either<Failure, PendingOrderResponseEntity>> getPendingOrderResponse(int page, String token);
}

class PendingOrderRepositoryImpl implements PendingOrderRepository {
  @override
  Future<Either<Failure, PendingOrderResponseEntity>> getPendingOrderResponse(int page, String token) {
    // TODO: implement getPendingOrderResponse
    throw UnimplementedError();
  }

  }
}