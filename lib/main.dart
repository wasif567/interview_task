import 'package:flutter/material.dart';
import 'package:interview_task/app/app.dart';
import 'package:interview_task/app/injector/injector.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}
