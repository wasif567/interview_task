import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class Status extends Equatable {
  const Status();

  @override
  List<Object> get props => [];
}

class StatusIntial extends Status {
  const StatusIntial();
}

class StatusLoading extends Status {}

class StatusSuccess extends Status {}

class StatusFailure extends Status {
  const StatusFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class StatusAuthFailure extends Status {
  const StatusAuthFailure(this.errorMessage);

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class ConnectionSuccess extends Status {
  const ConnectionSuccess();

  @override
  List<Object> get props => [];
}

class ConnectionFailure extends Status {
  const ConnectionFailure();

  @override
  List<Object> get props => [];
}

class CheckDeviceStatus extends Status {
  const CheckDeviceStatus();

  @override
  List<Object> get props => [];
}

class BusinessFailure extends Status {
  const BusinessFailure(this.error);

  final String error;

  @override
  List<Object> get props => [];
}

class StatusUICulture extends Status {
  const StatusUICulture();

  @override
  List<Object> get props => [];
}

class WebViewIntial extends Status {
  const WebViewIntial();

  @override
  List<Object> get props => [];
}

class TimeOutStatus extends Status {
  const TimeOutStatus(this.timeOutMsg);

  final String timeOutMsg;

  @override
  List<Object> get props => [];
}
