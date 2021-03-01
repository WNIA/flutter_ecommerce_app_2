import 'package:autism_project/core/network/network_info.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/data/source/local/finished_delivery_local.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/data/source/remote/finished_delivery_remote.dart';

abstract class FinishedDeliveryRepository {
  Future<List> callFinishedDeliveryRepository(int page, String token);
}

class FinishedDeliveryRepositoryImpl implements FinishedDeliveryRepository {
  final NetworkInfo networkInfo;
  final FinishedDeliveryRemoteDataSource finishedDeliveryRemote;
  final FinishedDeliveryLocal finishedDeliveryLocal;

  FinishedDeliveryRepositoryImpl({
    this.networkInfo,
    this.finishedDeliveryRemote,
    this.finishedDeliveryLocal,
  });

  @override
  Future<List> callFinishedDeliveryRepository(int page, String token) async {
    final isConnect = await networkInfo.isConnected;
    return isConnect != null
        ? (isConnect ? _getRemote(page, token) : _getCache())
        : _getCache();
  }

  Future<List> _getRemote(int page, String token) {
    return finishedDeliveryRemote.callFinishedDeliveryRemote(page, token);
  }

  List _getCache() {
    return finishedDeliveryLocal.callFinishedDeliveryLocalData();
  }
}
