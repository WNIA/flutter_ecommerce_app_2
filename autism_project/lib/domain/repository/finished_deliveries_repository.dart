import 'package:dartz/dartz.dart';
import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/domain/entity/finished_deliveries_response_entity.dart';

abstract class FinishedDeliveriesRepository {
  Future<Either<Failure, FinishedDeliveriesResponseEntity>> getFinishedDeliveriesResponse(int page, String token);
}

class FinishedDeliveriesRepositoryImpl implements FinishedDeliveriesRepository {
  @override
  Future<Either<Failure, FinishedDeliveriesResponseEntity>> getFinishedDeliveriesResponse(int page, String token) {
    // TODO: implement getFinishedDeliveriesResponse
    throw UnimplementedError();
  }

}