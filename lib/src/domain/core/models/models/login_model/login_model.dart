import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  const LoginModel({this.token, this.error, this.errorDesciption});

  @JsonKey(name: 'accessToken')
  final String? token;
  @JsonKey(name: 'error')
  final String? error;
  @JsonKey(name: 'errorDescription')
  final String? errorDesciption;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props {
    return [token];
  }
}



