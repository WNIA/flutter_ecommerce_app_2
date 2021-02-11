import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/domain/entity/finished_deliveries_response_entity.dart';
import 'package:autism_project/domain/repository/finished_deliveries_repository.dart';
import 'package:dartz/dartz.dart';

class FinishedDeliveriesUseCase{
  final FinishedDeliveriesRepository finishedDeliveriesRepository;

  FinishedDeliveriesUseCase(this.finishedDeliveriesRepository);

  Future<Either<Failure, FinishedDeliveriesResponseEntity>> call(int page, String token) async {
    return await finishedDeliveriesRepository.getFinishedDeliveriesResponse(page, token);
  }
}