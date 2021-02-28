

import 'package:autism_project/features/pending_order/domain/usecase/pending_order_usecase.dart';
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
