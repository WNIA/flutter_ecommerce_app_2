import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/data/datasources/remote/pending_order_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:autism_project/core/error/failure.dart';

abstract class PendingOrderRepository {
  Future<Either<Failure, List>> getPendingOrderResponseRepository(
      int page, String token);
}

class PendingOrderRepositoryImpl implements PendingOrderRepository {
  final PendingOrderRemoteDataSource pendingOrderRemoteDataSource;
  final NetworkInfo networkInfo;

  PendingOrderRepositoryImpl(
      {this.pendingOrderRemoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, List>> getPendingOrderResponseRepository(
      int page, String token) async {
    if(await networkInfo.isConnected){
      try{
        final remoteData = await pendingOrderRemoteDataSource.fetchPendingOrderPaginationRemote(page, token);
        return Right(remoteData);
      } on ServerException {
        Left(ServerFailure());
      }
    }

  }
}
