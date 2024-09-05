import 'dart:convert';

BusinessExceptionModel businessExceptionModelFromJson(String str) =>
    BusinessExceptionModel.fromJson(json.decode(str));

String businessExceptionModelToJson(BusinessExceptionModel data) =>
    json.encode(data.toJson());

class BusinessExceptionModel {
  final dynamic code;
  final String? message;
  final dynamic details;
  final dynamic validationErrors;

  BusinessExceptionModel({
    this.code,
    this.message,
    this.details,
    this.validationErrors,
  });

  factory BusinessExceptionModel.fromJson(Map<String, dynamic> json) =>
      BusinessExceptionModel(
        code: json["code"],
        message: json["message"],
        details: json["details"],
        validationErrors: json["validationErrors"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "details": details,
        "validationErrors": validationErrors,
      };
}
