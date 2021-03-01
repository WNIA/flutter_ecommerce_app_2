import 'package:autism_project/domain/entity/login_response_entity.dart';
import 'package:autism_project/domain/repository/login_repository.dart';
import 'package:flutter/foundation.dart';

class AuthUseCase {
  final AuthRepository loginRepository;

  AuthUseCase({@required this.loginRepository});

  Future<LoginResponseEntity> callLoginUseCase(String email, String pass) async {
    return loginRepository.callLoginRepository(email, pass);
  }

  Future<String> getUserToken() {
    return loginRepository.getUserToken();
  }

  Future<bool> getUserLoggedIn() {
    return loginRepository.getUserLoggedIn();
  }
}