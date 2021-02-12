import 'package:equatable/equatable.dart';

class LoginRequestEntity extends Equatable{
  LoginRequestEntity({
    this.email,
    this.password,
  });

  String email;
  String password;

  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}
