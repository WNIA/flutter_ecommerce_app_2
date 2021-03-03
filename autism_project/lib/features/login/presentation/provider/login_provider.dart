import 'package:autism_project/features/login/domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginProvider({@required LoginUseCase loginUseCase}) : _loginUseCase = loginUseCase;

  Future<bool> callLoginRepository(String email, String pass) async {
    final data = await _loginUseCase.callLoginRepository(email, pass);
    if(data != null){
      return true;
    }else{
      return false;
    }
  }
  Future<bool> loginState(){
    return _loginUseCase.loginState();
  }
  Future<String> userToken(){
    return _loginUseCase.userToken();
  }
  void logOut(){
    _loginUseCase.logOut();
  }
}
