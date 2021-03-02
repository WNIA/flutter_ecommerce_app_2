import 'package:autism_project/features/pending_order/domain/repository/pending_order_repository.dart';
import 'package:flutter/foundation.dart';

class PendingOrderPaginationUseCase {
  final PendingOrderRepository pendingOrderRepository;

  PendingOrderPaginationUseCase(
      {@required this.pendingOrderRepository});

  Future<List> call(int page, String token) async {
    return pendingOrderRepository.callPendingOrderRepository(
        page, token);
  }
}
