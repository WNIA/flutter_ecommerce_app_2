import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/domain/repository/finished_deliveries_repository.dart';
import 'package:dartz/dartz.dart';

class FinishedDeliveriesUseCase{
  final FinishedDeliveriesRepository finishedDeliveriesRepository;

  FinishedDeliveriesUseCase(this.finishedDeliveriesRepository);

  Future<Either<Failure, List>> callFinishedDeliveriesUseCase(int page, String token) async {
    return await finishedDeliveriesRepository.getFinishedDeliveriesRepository(page, token);
  }
}