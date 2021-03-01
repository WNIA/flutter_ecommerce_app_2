import 'package:autism_project/data/model/login_response_model.dart';
import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final int status;
  final bool success;
  final String jwt;
  final LoginResponseData data;
  final String message;

  LoginResponseEntity({
    this.status,
    this.success,
    this.jwt,
    this.data,
    this.message,
  });

  @override
  // TODO: implement props
  List<Object> get props => [status, success, jwt, data, message];
}
