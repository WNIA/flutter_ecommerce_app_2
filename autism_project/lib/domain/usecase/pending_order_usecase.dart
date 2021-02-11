import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/domain/entity/pending_order_response_entity.dart';
import 'package:autism_project/domain/repository/pending_order_repository.dart';
import 'package:dartz/dartz.dart';

class PendingOrderUseCase {
  final PendingOrderRepository pendingOrderRepository;

  PendingOrderUseCase(this.pendingOrderRepository);

  Future<Either<Failure, PendingOrderResponseEntity>> call(int page, String token) async {
    return pendingOrderRepository.getPendingOrderResponse(page, token);
  }
}