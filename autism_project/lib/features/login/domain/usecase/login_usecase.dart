import 'package:autism_project/core/error/failure.dart';
import 'package:autism_project/features/login/domain/entity/login_request_entity.dart';
import 'package:autism_project/features/login/domain/entity/login_response_entity.dart';
import 'package:autism_project/features/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({@required this.loginRepository});

  Future<Either<Failure, LoginResponseEntity>> callLoginUseCase(LoginRequestEntity requestEntity) async {
    return loginRepository.callLoginRepository(requestEntity);
  }
}