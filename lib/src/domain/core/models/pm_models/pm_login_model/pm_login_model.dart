import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pm_login_model.g.dart';

@JsonSerializable()
class PmLoginModel extends Equatable {
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'password')
  final String? password;

  const 
  
  
  PmLoginModel({required this.email, required this.password});

  factory PmLoginModel.fromJson(Map<String, dynamic> json) => _$PmLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$PmLoginModelToJson(this);

  @override
  List<Object?> get props => [email, password];
}
