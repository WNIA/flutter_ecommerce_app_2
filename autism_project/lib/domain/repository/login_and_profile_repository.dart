import 'package:autism_project/core/error/exception.dart';
import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/core/network/network_info.dart';
import 'package:autism_project/data/datasources/remote/login_and_profile_remote.dart';
import 'package:autism_project/data/models/login_request_model.dart';
import 'package:autism_project/domain/entity/login_and_profile_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginAndProfileRepository {
  Future<Either<Failure, LoginAndProfileResponseEntity>> getLoginResponse(
      LoginRequestModel requestModel);

  Future<Either<Failure, LoginAndProfileResponseEntity>> getProfileResponse();
}

class LoginAndProfileRepositoryImpl implements LoginAndProfileRepository {
  final LoginAndProfileRemoteDataSource loginAndProfileRemoteDataSource;
  final NetworkInfo networkInfo;

  LoginAndProfileRepositoryImpl(
      {this.loginAndProfileRemoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, LoginAndProfileResponseEntity>> getLoginResponse(
      LoginRequestModel requestModel) async {
    return await _getData(
        loginAndProfileRemoteDataSource.fetchLoginResponse(requestModel));
  }

  @override
  Future<Either<Failure, LoginAndProfileResponseEntity>>
      getProfileResponse() async {
    return await _getData(loginAndProfileRemoteDataSource.fetchProfileData());
  }

  _getData(Future func) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await func;
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
