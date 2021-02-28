import 'package:autism_project/features/login/domain/entity/login_response_entity.dart';
import 'package:autism_project/features/login/domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginProvider({@required LoginUseCase loginUseCase}) : _loginUseCase = loginUseCase;

  LoginResponseEntity responseEntity;
  bool isLoading = false;
  String error;
  bool isLogin = false;

  Future<bool> loadLoginData(String email, String pass) async {
    isLoading = true;
    notifyListeners();
    final result = await _loginUseCase.callLoginUseCase(email, pass);
    result.fold(
      (l) {
        error = "fail";
        isLoading = false;
        isLogin = false;
      },
      (r) {
        responseEntity = r;
        isLoading = false;
        isLogin = true;
      },
    );
    print("error: $error, isLoading: $isLoading, isLogin: $isLogin");

    notifyListeners();
    return isLogin;
  }
}
