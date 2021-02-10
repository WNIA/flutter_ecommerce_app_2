import 'package:autism_project/data/models/login_and_profile_response_model.dart';
import 'package:equatable/equatable.dart';

class LoginAndProfileResponseEntity extends Equatable{
  final int status;
  final bool success;
  final String jwt;
  final LoginAndProfileData data;
  final String message;

  LoginAndProfileResponseEntity({
    this.status,
    this.success,
    this.jwt,
    this.data,
    this.message,
  });


  @override
  // TODO: implement props
  List<Object> get props => [status, success, data, message];
}

