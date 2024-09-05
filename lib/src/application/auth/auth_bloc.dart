import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:interview_task/src/domain/auth/i_auth_repository.dart';
import 'package:interview_task/src/domain/core/failures/api_failure.dart';
import 'package:interview_task/src/domain/core/models/pm_models/pm_login_model/pm_login_model.dart';
import 'package:interview_task/src/domain/core/pref_keys/preference_key.dart';
import 'package:interview_task/src/infrastructure/core/preference_helper.dart';
import 'package:interview_task/src/presentation/core/constants/app_strings.dart';

import '../core/status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;

  AuthBloc(
    this._authRepository,
  ) : super(const AuthState(token: '')) {
    on<LoginEvent>(_login);
    on<AuthIntial>(_loginIntial);
  }

  Future<String> _login(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(
        state.copyWith(
          errorPasswordText: '',
          userErrorText: '',
          token: '',
          loginStatus: StatusLoading(),
        ),
      );

      final res =
          await _authRepository.login(pmLogin: PmLoginModel(email: event.userName, password: event.password));

      if (res.token != null && res.token!.isNotEmpty) {
        //
      } else {
        PreferenceHelper().setString(key: AppPrefKeys.token, value: '');
        emit(
          state.copyWith(
              errorPasswordText: AppStrings.passwordHint, //AppStrings.passwordError,
              userErrorText: AppStrings.userNameError,
              loginStatus: StatusFailure(res.errorDesciption ?? 'Login Failed'),
              token: ''),
        );
      }
    } on ApiFailure catch (_) {
      PreferenceHelper().setString(key: AppPrefKeys.token, value: '');
      emit(state.copyWith(loginStatus: const StatusIntial()));
      emit(state.copyWith(
          errorPasswordText: AppStrings.passwordHint, //AppStrings.passwordError,
          userErrorText: AppStrings.userNameError,
          loginStatus: const StatusFailure('Login Failed'),
          token: ''));
    } on TimeoutException catch (e) {
      emit(state.copyWith(
        loginStatus: TimeOutStatus(e.message!),
      ));
    } catch (_) {
      emit(state.copyWith(
          errorPasswordText: AppStrings.passwordHint, //AppStrings.passwordError,
          userErrorText: AppStrings.userNameError,
          loginStatus: const StatusFailure('Login Failed'),
          token: ''));
    }
    return '';
  }

  Future<void> _loginIntial(AuthIntial event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(
          userErrorText: '', errorPasswordText: '', loginStatus: const StatusIntial(), token: ''));
    } catch (_) {}
  }
}
