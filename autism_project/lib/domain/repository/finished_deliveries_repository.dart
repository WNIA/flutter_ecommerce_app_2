import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/data/datasources/finished_deliveries_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/domain/entity/finished_deliveries_response_entity.dart';


abstract class FinishedDeliveriesRepository {
  Future<Either<Failure, FinishedDeliveriesResponseEntity>>
      getFinishedDeliveriesResponse(int page, String token);
}

class FinishedDeliveriesRepositoryImpl implements FinishedDeliveriesRepository {
  final FinishedDeliveriesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FinishedDeliveriesRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, FinishedDeliveriesResponseEntity>>
      getFinishedDeliveriesResponse(int page, String token) async {
    if(await networkInfo.isConnected) {
      try{
        final remoteData = await remoteDataSource.fetchFinishedDeliveriesPagination(page, token);
        return Right(remoteData);
      }on ServerException{
        return Left(ServerFailure());
      }
    }

  }
}
