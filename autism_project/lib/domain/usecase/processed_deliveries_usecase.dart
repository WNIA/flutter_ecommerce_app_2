import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/domain/entity/processed_deliveries_response_entity.dart';
import 'package:autism_project/domain/entity/processed_delivery_details_response_entity.dart';
import 'package:autism_project/domain/entity/processed_delivery_list_response_entity.dart';
import 'package:autism_project/domain/repository/processed_deliveries_repository.dart';
import 'package:dartz/dartz.dart';

class ProcessedDeliveriesUseCase {
  final ProcessedDeliveriesRepository processedDeliveriesRepository;

  ProcessedDeliveriesUseCase(this.processedDeliveriesRepository);

  Future<Either<Failure, ProcessedDeliveriesResponseEntity>>
  callProcessedDeliveriesPagination(int page, String token) async {
    return await processedDeliveriesRepository.getProcessedDeliveriesPagination(page, token);
  }

  Future<Either<Failure, ProcessedDeliveriesListResponseEntity>>
  callProcessedDeliveriesList(String token, int orderId) async {
    return await processedDeliveriesRepository.getProcessedDeliveriesList(token, orderId);
  }

  Future<Either<Failure, ProcessedDeliveriesDetailsResponseEntity>>
  callProcessedDeliveriesDetails(String token, int orderId) async {
    return await processedDeliveriesRepository.getProcessedDeliveriesDetails(token, orderId);
  }
}