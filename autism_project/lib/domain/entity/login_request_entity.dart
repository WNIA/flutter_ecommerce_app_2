import 'package:equatable/equatable.dart';

class LoginRequestEntity extends Equatable{
  LoginRequestEntity({
    this.email,
    this.password,
  });

  final String email;
  final String password;

  @override
  // TODO: implement props
  List<Object> get props => [email, password];
}
