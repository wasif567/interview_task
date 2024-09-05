// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:interview_task/src/application/auth/auth_bloc.dart' as _i49;
import 'package:interview_task/src/domain/auth/i_auth_repository.dart' as _i609;
import 'package:interview_task/src/domain/core/internet_service/i_base_client.dart'
    as _i10;
import 'package:interview_task/src/domain/core/preference/preference.dart'
    as _i684;
import 'package:interview_task/src/infrastructure/auth/auth_repository.dart'
    as _i711;
import 'package:interview_task/src/infrastructure/core/internet_helper.dart'
    as _i42;
import 'package:interview_task/src/infrastructure/core/preference_helper.dart'
    as _i497;
import 'package:interview_task/src/infrastructure/core/third_party_injectable_module.dart'
    as _i601;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPatyInjectableModule = _$ThirdPatyInjectableModule();
    gh.lazySingleton<_i519.Client>(() => thirdPatyInjectableModule.client);
    gh.lazySingleton<_i497.PreferenceHelper>(
        () => thirdPatyInjectableModule.preferenceHelper);
    gh.lazySingleton<_i684.PreferenceContracts>(() => _i497.PreferenceHelper());
    gh.lazySingleton<_i10.IBaseClient>(
        () => _i42.InternetHelper(gh<_i519.Client>()));
    gh.lazySingleton<_i609.IAuthRepository>(
        () => _i711.AuthRepository(gh<_i10.IBaseClient>()));
    gh.factory<_i49.AuthBloc>(() => _i49.AuthBloc(gh<_i609.IAuthRepository>()));
    return this;
  }
}

class _$ThirdPatyInjectableModule extends _i601.ThirdPatyInjectableModule {}
