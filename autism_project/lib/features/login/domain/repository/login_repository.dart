import 'package:autism_project/core/helper/constant.dart';
import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/error/failure.dart';
import 'file:///D:/AndroidStudioProjects/autism_project_final_repo/autism_project_final_repo/autism_project/lib/core/helper/shared_prefs.dart';
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
  final SharedPrefs sharedPrefs;

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

