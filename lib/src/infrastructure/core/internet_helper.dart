import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:interview_task/src/domain/core/failures/api_auth_failure.dart';
import 'package:interview_task/src/domain/core/failures/api_failure.dart';
import 'package:interview_task/src/domain/core/internet_service/i_base_client.dart';
import 'package:interview_task/src/domain/core/models/models/business_exception_model.dart';
import 'package:interview_task/src/domain/core/pref_keys/preference_key.dart';
import 'package:interview_task/src/infrastructure/core/preference_helper.dart';

@LazySingleton(as: IBaseClient)
class InternetHelper extends IBaseClient {
  InternetHelper(this.client);
  final http.Client client;

  String regUrl = 'https://mock-api.zoft.care/';

  /* var header = {
      "content-type": "application/json",
      "accept": "application/json",
      'Authorization': 'Bearer ${getToken()}',
    }; */

  getToken() async {
    return await PreferenceHelper().getString(key: AppPrefKeys.token);
  }

  @override
  Future<http.Response> get(String url, {bool authorizedPost = true}) async {
    try {
      var header = {
        "content-type": "application/json",
        "accept": "application/json",
        'x-auth-key': '${await getToken()}',
      };
      if (!authorizedPost) {
        header.remove('x-auth-key');
      }

      Uri uri = Uri.parse(regUrl + url);
      final response = await client.get(uri, headers: header);
      if (response.body.isEmpty && response.statusCode != 200) {
        throw ApiFailure('no data found');
      }
      return _response(response);
    } on SocketException {
      throw const SocketException('Internet service not found');
    } on ApiFailure catch (e) {
      throw ApiFailure(e.error);
    } on TimeoutException {
      throw TimeoutException('Time out');
    } on ApiAuthFailure catch (_) {
      throw ApiAuthFailure('Api authenication failed');
    } catch (e) {
      throw ApiFailure("something went wrong");
    }
  }

  @override
  Future<http.Response> post(String url,
      {required Map<String, dynamic> body, bool authorizedPost = true}) async {
    try {
      var header = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'x-auth-key': '${await getToken()}',
      };
      if (!authorizedPost) {
        header.remove('x-auth-key');
      }

      var jsonData = jsonEncode(body);
      Uri uri = Uri.parse(regUrl + url);
      final response = await client.post(uri, body: jsonData, headers: header);
      if (response.body.isEmpty && response.statusCode != 200) {
        throw ApiFailure('no data found');
      }
      return _response(response);
    } on SocketException {
      throw const SocketException('Internet service not found');
    } on ApiFailure catch (e) {
      throw ApiFailure(e.error);
    } on TimeoutException {
      throw TimeoutException('Time out');
    } on ApiAuthFailure catch (_) {
      throw ApiAuthFailure('Api authenication failed');
    } on BusinessException catch (e) {
      throw BusinessException(e.businessException);
    }
  }

  http.Response _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 204:
        throw NoContentFailure("No Content");
      case 500:
        throw InternalServerError('error 500');
      case 400:
        var errorResp = jsonDecode(response.body);
        throw BusinessException(BusinessExceptionModel.fromJson(errorResp['error']));
      case 404:
        throw ApiAuthFailure('Authenication expired');
      default:
        throw ApiFailure('error invalid');
    }
  }
}
