// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:injectable/injectable.dart';
import 'package:interview_task/src/domain/core/preference/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: PreferenceContracts)
class PreferenceHelper implements PreferenceContracts {
  @override
  Future<bool> getBool({required String key}) async {
    final value = await _getData(key);
    return value.toLowerCase() == "true";
  }

  @override
  Future<double> getDouble({required String key}) async {
    final value = await _getData(key);
    return double.parse(value);
  }

  @override
  Future<int> getInt({required String key}) async {
    final value = await _getData(key);
    return int.parse(value);
  }

  @override
  Future<String> getString({required String key}) async {
    return await _getData(key);
  }

  @override
  void setBool({required String key, required bool value}) {
    _setData(key, value.toString());
  }

  @override
  void setDouble({required String key, required double value}) {
    _setData(key, value.toString());
  }

  @override
  void setInt({required String key, required int value}) {
    _setData(key, value.toString());
  }

  @override
  void setString({required String key, required String value}) {
    _setData(key, value);
  }

  Future<bool> _setData(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  Future<String> _getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }
}
