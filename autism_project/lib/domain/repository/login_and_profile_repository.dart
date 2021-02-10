import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/data/models/login_request_model.dart';
import 'package:autism_project/domain/entity/login_and_profile_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginAndProfileRepository {
  Future<Either<Failure, LoginAndProfileResponseEntity>> getLoginResponse(LoginRequestModel requestModel);
  Future<Either<Failure, LoginAndProfileResponseEntity>> getProfileResponse();
}

class LoginAndProfileRepositoryImpl implements LoginAndProfileRepository {
  @override
  Future<Either<Failure, LoginAndProfileResponseEntity>> getLoginResponse(LoginRequestModel requestModel) {
    // TODO: implement getLoginResponse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LoginAndProfileResponseEntity>> getProfileResponse() {
    // TODO: implement getProfileResponse
    throw UnimplementedError();
  }

}