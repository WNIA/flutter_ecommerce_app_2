import 'package:autism_project/core/data/shared_prefs.dart';
import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/features/login/data/datasource/remote/login_remote.dart';
import 'package:autism_project/features/login/domain/entity/login_request_entity.dart';
import 'package:autism_project/features/login/domain/entity/login_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseEntity>> callLoginRepository(
      LoginRequestEntity requestEntity);
}

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource loginRemoteDataSource;
  final LocalDataSource localDataSource;

  LoginRepositoryImpl({this.networkInfo, this.loginRemoteDataSource, this.localDataSource});

  @override
  Future<Either<Failure, LoginResponseEntity>> callLoginRepository(
      LoginRequestEntity requestEntity) async {
    final isConnect = await networkInfo.isConnected;
    return isConnect != null
        ? (isConnect ? _getRemote(requestEntity) : _getCache())
        : _getCache();
  }
  Future<Either<Failure, LoginResponseEntity>> _getRemote(LoginRequestEntity requestEntity) async {
    try {
      final data = await loginRemoteDataSource.callLoginRemote(requestEntity);
      localDataSource.saveUserLoggedInSharedPref(data.success);
      localDataSource.saveUserJWTSharedPref(data.jwt);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }

  }
  Future<Either<Failure, LoginResponseEntity>> _getCache() async {
    try {
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}

