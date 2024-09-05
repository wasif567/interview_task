import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class CheckInternet {
  BuildContext parentContext;

  CheckInternet({required this.parentContext});

  bool isActive = false;

  Future checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        isActive = !isActive;
      } else {
        isActive = false;
      }
      return isActive;
    } catch (e) {
      return isActive;
    }
  }
}
