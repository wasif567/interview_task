part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({
    required this.userName,
    required this.password,
  });
  final String userName;
  final String password;

  @override
  List<Object> get props => [
        userName,
        password,
      ];
}

class AuthIntial extends AuthEvent {
  const AuthIntial();
  @override
  List<Object> get props => [];
}
