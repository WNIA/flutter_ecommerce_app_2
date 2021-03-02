import 'package:autism_project/features/login/domain/entity/login_response_entity.dart';
import 'package:autism_project/features/login/domain/repository/login_repository.dart';
import 'package:flutter/foundation.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({@required this.loginRepository});

  Future<LoginResponseEntity> callLoginRepository(String email, String pass){
    return loginRepository.callLoginRepository(email, pass);
  }
  Future<bool> loginState(){
    return loginRepository.loginState();
  }
  Future<String> userToken(){
    return loginRepository.userToken();
  }
  void logOut(){
    loginRepository.logOut();
  }
}