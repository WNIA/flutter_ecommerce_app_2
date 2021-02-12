import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/domain/entity/processed_delivery_details_response_entity.dart';
import 'package:autism_project/domain/repository/processed_deliveries_repository.dart';
import 'package:dartz/dartz.dart';

class ProcessedDeliveriesUseCase {
  final ProcessedDeliveriesRepository processedDeliveriesRepository;

  ProcessedDeliveriesUseCase(this.processedDeliveriesRepository);

  Future<Either<Failure, List>>
  callProcessedDeliveriesPaginationUseCase(int page, String token) async {
    return await processedDeliveriesRepository.getProcessedDeliveriesPaginationRepository(page, token);
  }

  Future<Either<Failure, List>>
  callProcessedDeliveriesListUseCase(String token, int orderId) async {
    return await processedDeliveriesRepository.getProcessedDeliveriesListRepository(token, orderId);
  }

  Future<Either<Failure, ProcessedDeliveriesDetailsResponseEntity>>
  callProcessedDeliveriesDetailsUseCase(String token, int orderId) async {
    return await processedDeliveriesRepository.getProcessedDeliveriesDetailsRepository(token, orderId);
  }
}