import 'package:cabinet/utils/Config.dart';
import 'package:flutter/material.dart';

import '../application.dart';

class DarkMode with ChangeNotifier {
  bool _isDark = false;

  get isDark => _isDark;

  void updateDarkMode(isDark) {
    _isDark = isDark;
    notifyListeners();
    Application.sp.putBool(Config.SP_DARK_MODEL, isDark);
  }
}
