import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/data/models/processed_deliveries_response_model.dart';
import 'package:autism_project/domain/entity/processed_delivery_details_response_entity.dart';
import 'package:autism_project/domain/entity/processed_delivery_list_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProcessedDeliveriesRepository {
  Future<Either<Failure, ProcessedDeliveriesResponseEntity>> getProcessedDeliveriesPagination(
      int page, String token);

  Future<Either<Failure, ProcessedDeliveriesListResponseEntity>> getProcessedDeliveriesList(
      String token, int orderId);

  Future<Either<Failure, ProcessedDeliveriesDetailsResponseEntity>>
  getProcessedDeliveriesDetails(String token, int orderId);
}

class ProcessedDeliveriesRepositoryImpl implements ProcessedDeliveriesRepository {
  @override
  Future<Either<Failure, ProcessedDeliveriesDetailsResponseEntity>> getProcessedDeliveriesDetails(String token, int orderId) {
    // TODO: implement getProcessedDeliveriesDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProcessedDeliveriesListResponseEntity>> getProcessedDeliveriesList(String token, int orderId) {
    // TODO: implement getProcessedDeliveriesList
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProcessedDeliveriesResponseEntity>> getProcessedDeliveriesPagination(int page, String token) {
    // TODO: implement getProcessedDeliveriesPagination
    throw UnimplementedError();
  }


}