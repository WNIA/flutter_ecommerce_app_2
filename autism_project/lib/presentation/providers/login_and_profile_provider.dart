import 'package:autism_project/data/models/login_request_model.dart';
import 'package:autism_project/domain/entity/login_and_profile_response_entity.dart';
import 'package:autism_project/domain/usecase/login_and_profile_usecase.dart';
import 'package:flutter/material.dart';

class LoginAndProfileProvider extends ChangeNotifier {
  final LoginAndProfileUseCase _loginAndProfileUseCase;

  LoginAndProfileProvider({@required LoginAndProfileUseCase loginAndProfileUseCase}) : _loginAndProfileUseCase = loginAndProfileUseCase;

  bool isLogin = false;
  String error;
  LoginAndProfileResponseEntity loginAndProfileResponseEntity;

  Future<void> getLogin(LoginRequestModel requestModel) async {
    final result = await _loginAndProfileUseCase.callLogin(requestModel);
    result.fold((l) {
      error = 'failed attempt';
      isLogin = false;
    }, (r) {
      loginAndProfileResponseEntity = r;
      isLogin = true;
    });
    notifyListeners();
  }
}
