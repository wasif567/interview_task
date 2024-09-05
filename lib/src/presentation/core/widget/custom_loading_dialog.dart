import 'package:flutter/material.dart';

class CustomLoading {
  CustomLoading({required this.context});
  final BuildContext context;

  Future<void> show() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.red,
            actions: [CircularProgressIndicator()],
          );
        });
  }
}
