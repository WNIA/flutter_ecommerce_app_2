import 'package:autism_project/features/login/domain/entity/login_request_entity.dart';
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

  Future<void> loadLoginData(LoginRequestEntity requestEntity) async {
    isLoading = true;
    notifyListeners();
    final result = await _loginUseCase.callLoginUseCase(requestEntity);
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
    notifyListeners();
  }
}
