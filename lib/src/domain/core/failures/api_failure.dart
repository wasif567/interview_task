import 'package:interview_task/src/domain/core/models/models/business_exception_model.dart';

class ApiFailure implements Exception {
  ApiFailure(this.error);
  final String? error;
}

class InternalServerError implements Exception {
  InternalServerError(this.error);
  final String? error;
}

class NoContentFailure implements Exception {
  NoContentFailure(this.error);
  final String? error;
}

class NoInternetFailure implements Exception {
  NoInternetFailure(this.error);
  final String? error;
}

class BusinessException implements Exception {
  BusinessException(this.businessException);
  final BusinessExceptionModel? businessException;
}
