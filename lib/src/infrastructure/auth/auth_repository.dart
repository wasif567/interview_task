import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:interview_task/src/domain/auth/i_auth_repository.dart';
import 'package:interview_task/src/domain/core/app_url/app_url.dart';
import 'package:interview_task/src/domain/core/internet_service/i_base_client.dart';
import 'package:interview_task/src/domain/core/models/models/login_model/login_model.dart';
import 'package:interview_task/src/domain/core/models/pm_models/pm_login_model/pm_login_model.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository extends IAuthRepository {
  AuthRepository(this.client);
  final IBaseClient client;

  @override
  Future<LoginModel> login({required PmLoginModel pmLogin}) async {
    try {
      final response = await client.post(AppUrl.login, body: pmLogin.toJson(), authorizedPost: false).timeout(
            const Duration(seconds: 60),
          );

      final decode = jsonDecode(response.body);
      if (kDebugMode) {
        log(" decoded >>>>> $decode");
      }
      return LoginModel.fromJson(decode);
    } catch (e) {
      rethrow;
    }
  }
}
