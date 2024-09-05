part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.loginStatus = const StatusIntial(),
    required this.token,
    this.errorUser,
    this.errorPassword,
    this.errorMsg,
  });

  final Status loginStatus;
  final String token;
  final String? errorUser;
  final String? errorPassword;
  final String? errorMsg;

  @override
  List<Object> get props => [
        loginStatus,
        token,
        errorUser ?? '',
        errorPassword ?? '',
        errorMsg ?? '',
      ];

  AuthState copyWith({
    Status? loginStatus,
    String? token,
    String? errorPasswordText,
    String? userErrorText,
    String? statusMsg,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      token: token ?? '',
      errorPassword: errorPasswordText ?? '',
      errorUser: userErrorText ?? '',
      errorMsg: statusMsg ?? errorMsg,
    );
  }
}
