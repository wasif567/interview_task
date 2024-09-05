import 'dart:io';

import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class AppVersionService {
  static Future<AppVersion> checkUpdate(
    String? iosVersion,
    String? androidVerion,
  ) async {
    try { 
      // read app version from pubspec
      final yamlContent = await rootBundle.loadString('pubspec.yaml');
      final yaml = loadYaml(yamlContent) as Map;
      final version = yaml['version'].toString().split('+').first;
      final currentVersionFormate = version.split('.');

      // check new version
      if (iosVersion == null || androidVerion == null) {
        return AppVersion(updateAvailable: false);
      }
      final versionFormateIos = iosVersion.split('.');
      final versionFormatAndroid = androidVerion.split('.');

      // check update
      if (Platform.isIOS) {
        const appUrl = "https://apps.apple.com/in/app/4kids/id6443693224";
        _checkVersion(currentVersionFormate, versionFormateIos, appUrl);
      } else if (Platform.isAndroid) {
        const appUrl =
            'https://play.google.com/store/apps/details?id=com.cookee.fourkids';
        return _checkVersion(
            currentVersionFormate, versionFormatAndroid, appUrl);
      }
    } catch (_) {}
    return AppVersion(updateAvailable: false);
  }

  static AppVersion _checkVersion(
    List<String> current,
    List<String> update,
    String url,
  ) {
    if (update[0].toInt() == current[0].toInt() &&
            update[1].toInt()! > current[1].toInt()! ||
        update[0].toInt() == current[0].toInt() &&
            update[2].toInt()! > current[1].toInt()!) {
      return AppVersion(
        appUrl: url,
        updateAvailable: true,
        isDismissable: true,
      );
    } else if (update[0].toInt()! > current[0].toInt()!) {
      return AppVersion(
        appUrl: url,
        isDismissable: false,
        updateAvailable: true,
      );
    }
    return AppVersion(updateAvailable: false);
  }
}

class AppVersion {
  AppVersion({this.appUrl, this.isDismissable, this.updateAvailable});
  String? appUrl;
  bool? isDismissable;
  bool? updateAvailable;
}

extension on String {
  int? toInt() {
    return int.tryParse(this);
  }
}
