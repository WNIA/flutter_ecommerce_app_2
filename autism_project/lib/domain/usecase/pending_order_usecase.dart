import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/domain/repository/pending_order_repository.dart';
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
