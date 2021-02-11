import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/data/models/login_request_model.dart';
import 'package:autism_project/domain/entity/login_and_profile_response_entity.dart';
import 'package:autism_project/domain/repository/login_and_profile_repository.dart';
import 'package:dartz/dartz.dart';

class LoginAndProfileUseCase {
  final LoginAndProfileRepository loginAndProfileRepository;

  LoginAndProfileUseCase(this.loginAndProfileRepository);

  Future<Either<Failure, LoginAndProfileResponseEntity>> callLogin(LoginRequestModel requestModel) async {
    return await loginAndProfileRepository.getLoginResponse(requestModel);
  }
  Future<Either<Failure, LoginAndProfileResponseEntity>> callProfile() async {
    return await loginAndProfileRepository.getProfileResponse();
  }
}