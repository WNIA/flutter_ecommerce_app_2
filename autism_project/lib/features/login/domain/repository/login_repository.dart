import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/features/login/data/datasource/remote/login_remote.dart';
import 'package:autism_project/features/login/domain/entity/login_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseEntity>> callLoginRepository(
      String email, String pass);
}

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource loginRemoteDataSource;
  final sharedPrefs;

  LoginRepositoryImpl({this.networkInfo, this.loginRemoteDataSource, this.sharedPrefs});

  @override
  Future<Either<Failure, LoginResponseEntity>> callLoginRepository(
      String email, String pass) async {
    final isConnect = await networkInfo.isConnected;
    return isConnect != null
        ? (isConnect ? _getRemote(email, pass) : _getCache())
        : _getCache();
  }
  Future<Either<Failure, LoginResponseEntity>> _getRemote(String email, String pass) async {
    try {
      final data = await loginRemoteDataSource.callLoginRemote(email, pass);
      sharedPrefs.saveUserJWTSharedPref(data.jwt);
      sharedPrefs.saveUserLoggedInSharedPref(data.success);
      Constant.token = data.jwt;
      // Constant.login = data.success;
      print(data.jwt);
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

