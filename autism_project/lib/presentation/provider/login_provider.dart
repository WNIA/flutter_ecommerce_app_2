import 'package:autism_project/domain/entity/login_response_entity.dart';
import 'package:autism_project/domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthUseCase _loginUseCase;

  AuthProvider({@required AuthUseCase loginUseCase}) : _loginUseCase = loginUseCase;

  Future<LoginResponseEntity> userLogIn(String email, String pass) {
    return _loginUseCase.callLoginUseCase(email, pass);
  }
  void userLogOut(){

  }
  Future<String> userToken() {
    return _loginUseCase.getUserToken();
  }
  Future<bool> userLoggedIn() {
    return _loginUseCase.getUserLoggedIn();
  }
}
