import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../theme/theme_enum.dart';

class HiveMethods {
  static final _box = Hive.box('app');

  static String getLang() {
    return _box.get('lang', defaultValue: 'en');
  }

  static void updateLang(Locale locale) {
    _box.put('lang', locale.languageCode);
  }

  static String? getAccessToken() => _box.get('accessToken');

  static void updateAccessToken(String accessToken) {
    _box.put('accessToken', accessToken);
  }

  static String? getRefreshToken() => _box.get('refreshToken');

  static void updateRefreshToken(String refreshToken) {
    _box.put('refreshToken', refreshToken);
  }

  static void deleteTokens() {
    _box.delete('accessToken');
    _box.delete('refreshToken');
  }

  static bool isFirstTime() {
    return _box.get('isFirstTime', defaultValue: true);
  }

  static void updateFirstTime() {
    _box.put('isFirstTime', false);
  }

  static int getBusinessId() {
    return _box.get('businessId', defaultValue: null);
  }

  static void updateBusinessId(int businessId) {
    _box.put('businessId', businessId);
  }

  static ThemeEnum getTheme() {
    return _box.get('theme', defaultValue: ThemeEnum.light);
  }

  static void updateThem(ThemeEnum theme) {
    _box.put('theme', theme);
  }
}
