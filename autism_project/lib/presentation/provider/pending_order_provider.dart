

import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/domain/usecase/pending_order_usecase.dart';
import 'package:flutter/foundation.dart';

class PendingOrderProvider extends ChangeNotifier {
  final PendingOrderPaginationUseCase _pendingOrderPaginationUseCase;

  PendingOrderProvider(
      {@required PendingOrderPaginationUseCase pendingOrderPaginationUseCase})
      : _pendingOrderPaginationUseCase = pendingOrderPaginationUseCase;

  Future<List> callPendingOrderAPI(int page, String token) {
    return _pendingOrderPaginationUseCase.call(page, token);
  }
}
