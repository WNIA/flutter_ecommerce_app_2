import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/features/finished_delivery/data/datasource/local/finished_delivery_local.dart';
import 'package:autism_project/features/finished_delivery/data/datasource/remote/finished_delivery_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

abstract class FinishedDeliveryRepository {
  Future<Either<Failure, List>> callFinishedDeliveryRepository(int page, String token, BuildContext context);
}
class FinishedDeliveryRepositoryImpl implements FinishedDeliveryRepository {
  final NetworkInfo networkInfo;
  final FinishedDeliveryRemote finishedDeliveryRemote;
  final FinishedDeliveryLocal finishedDeliveryLocal;

  FinishedDeliveryRepositoryImpl(
      {this.networkInfo, this.finishedDeliveryRemote, this.finishedDeliveryLocal});

  @override
  Future<Either<Failure, List>> callFinishedDeliveryRepository(int page, String token, BuildContext context) async {
    final isConnect = await networkInfo.isConnected;
    return isConnect != null ? (isConnect ? _getRemote(page, token) : _getCache(context) ): _getCache(context);
  }
  Future<Either<Failure, List>> _getRemote(int page, String token) async {
    try{
      final dataList = await finishedDeliveryRemote.callFinishedDeliveryRemote(page, token);
      return Right(dataList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  Future<Either<Failure, List>> _getCache(BuildContext context) async{
    try{
      final dataList = await finishedDeliveryLocal.fetchLocalJson(context);
      return Right(dataList);
    }on CacheException{
      return Left(CacheFailure());
    }
  }
}