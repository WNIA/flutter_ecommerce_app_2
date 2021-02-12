import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/domain/repository/pending_order_repository.dart';
import 'package:dartz/dartz.dart';

class PendingOrderUseCase {
  final PendingOrderRepository pendingOrderRepository;

  PendingOrderUseCase(this.pendingOrderRepository);

  Future<Either<Failure, List>> callPendingOrderUseCase(int page, String token) async {
    return pendingOrderRepository.getPendingOrderResponseRepository(page, token);
  }
}