import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/data/datasources/remote/processed_deliveries_remote.dart';
import 'package:autism_project/data/models/processed_deliveries_response_model.dart';
import 'package:autism_project/domain/entity/processed_deliveries_response_entity.dart';
import 'package:autism_project/domain/entity/processed_delivery_details_response_entity.dart';
import 'package:autism_project/domain/entity/processed_delivery_list_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProcessedDeliveriesRepository {
  Future<Either<Failure, ProcessedDeliveriesResponseEntity>>
      getProcessedDeliveriesPagination(int page, String token);

  Future<Either<Failure, ProcessedDeliveriesListResponseEntity>>
      getProcessedDeliveriesList(String token, int orderId);

  Future<Either<Failure, ProcessedDeliveriesDetailsResponseEntity>>
      getProcessedDeliveriesDetails(String token, int orderId);
}

class ProcessedDeliveriesRepositoryImpl
    implements ProcessedDeliveriesRepository {
  final ProcessDeliveriesRemoteDataSource processDeliveriesRemoteDataSource;
  final NetworkInfo networkInfo;

  ProcessedDeliveriesRepositoryImpl(
      {this.processDeliveriesRemoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, ProcessedDeliveriesDetailsResponseEntity>>
      getProcessedDeliveriesDetails(String token, int orderId) async {
    return await _getData(processDeliveriesRemoteDataSource.fetchProcessedDeliveriesDetails(token, orderId));
  }

  @override
  Future<Either<Failure, ProcessedDeliveriesListResponseEntity>>
      getProcessedDeliveriesList(String token, int orderId) async {
    return await _getData(processDeliveriesRemoteDataSource.fetchProcessedDeliveriesList(token, orderId));
  }

  @override
  Future<Either<Failure, ProcessedDeliveriesResponseModel>>
      getProcessedDeliveriesPagination(int page, String token) async {
    return await _getData(processDeliveriesRemoteDataSource.fetchProcessedDeliveriesPagination(page, token));
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
