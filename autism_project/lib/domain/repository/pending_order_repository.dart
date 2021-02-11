import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/data/datasources/pending_order_remote.dart';
import 'package:autism_project/domain/entity/pending_order_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:autism_project/core/error/failure.dart';

abstract class PendingOrderRepository {
  Future<Either<Failure, PendingOrderResponseEntity>> getPendingOrderResponse(
      int page, String token);
}

class PendingOrderRepositoryImpl implements PendingOrderRepository {
  final PendingOrderRemoteDataSource pendingOrderRemoteDataSource;
  final NetworkInfo networkInfo;

  PendingOrderRepositoryImpl(
      {this.pendingOrderRemoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, PendingOrderResponseEntity>> getPendingOrderResponse(
      int page, String token) async {
    return _getPendingOrderResponse(page, token);
  }
  Future<Either<Failure, PendingOrderResponseEntity>> _getPendingOrderResponse(
      int page, String token) async {
    if(await networkInfo.isConnected){
      try{
        final remoteData = await pendingOrderRemoteDataSource.fetchPendingOrderPagination(page, token);
        return Right(remoteData);
      } on ServerException {
        Left(ServerFailure());
      }
    }
  }
}
