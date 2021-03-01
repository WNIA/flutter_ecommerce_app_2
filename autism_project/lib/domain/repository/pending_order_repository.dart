import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/data/source/local/pending_order_local.dart';
import 'package:autism_project/data/source/remote/pending_order_remote.dart';

abstract class PendingOrderRepository {
  Future<List> callPendingOrderRepository(int page, String token);
}

class PendingOrderRepositoryImpl implements PendingOrderRepository {
  final NetworkInfo networkInfo;
  final PendingOrderRemoteDataSource pendingOrderRemote;
  final PendingOrderLocal pendingOrderLocal;

  PendingOrderRepositoryImpl({
    this.networkInfo,
    this.pendingOrderRemote,
    this.pendingOrderLocal,
  });

  @override
  Future<List> callPendingOrderRepository(int page, String token) async {
    final isConnect = await networkInfo.isConnected;
    return isConnect != null
        ? (isConnect ? _getRemote(page, token) : _getCache())
        : _getCache();
  }

  Future<List> _getRemote(int page, String token) {
    return pendingOrderRemote.callPendingOrderRemote(page, token);
  }

  List _getCache() {
    return pendingOrderLocal.callFinishedDeliveryLocalData();
  }
}
