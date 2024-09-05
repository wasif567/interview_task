import 'package:http/http.dart';

abstract class IBaseClient {
  Future<Response> get(String url, {bool authorizedPost = true});

  Future<Response> post(String url, {required Map<String, dynamic> body, bool authorizedPost = true});
}
