import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/data/datasources/remote/processed_deliveries_remote.dart';
import 'package:autism_project/domain/entity/processed_delivery_details_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProcessedDeliveriesRepository {
  Future<Either<Failure, List>>
      getProcessedDeliveriesPaginationRepository(int page, String token);

  Future<Either<Failure, List>>
      getProcessedDeliveriesListRepository(String token, int orderId);

  Future<Either<Failure, ProcessedDeliveriesDetailsResponseEntity>>
      getProcessedDeliveriesDetailsRepository(String token, int orderId);
}

class ProcessedDeliveriesRepositoryImpl
    implements ProcessedDeliveriesRepository {
  final ProcessDeliveriesRemoteDataSource processDeliveriesRemoteDataSource;
  final NetworkInfo networkInfo;

  ProcessedDeliveriesRepositoryImpl(
      {this.processDeliveriesRemoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, ProcessedDeliveriesDetailsResponseEntity>>
      getProcessedDeliveriesDetailsRepository(String token, int orderId) async {
    return await _getData(processDeliveriesRemoteDataSource.fetchProcessedDeliveriesDetailsRemote(token, orderId));
  }

  @override
  Future<Either<Failure, List>>
      getProcessedDeliveriesListRepository(String token, int orderId) async {
    return await _getData(processDeliveriesRemoteDataSource.fetchProcessedDeliveriesListRemote(token, orderId));
  }

  @override
  Future<Either<Failure, List>>
      getProcessedDeliveriesPaginationRepository(int page, String token) async {
    return await _getData(processDeliveriesRemoteDataSource.fetchProcessedDeliveriesPaginationRemote(page, token));
  }

  _getData(Future func) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await func;
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
