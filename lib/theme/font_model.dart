import 'package:cabinet/utils/Config.dart';
import 'package:flutter/material.dart';

import '../application.dart';

class FontModel with ChangeNotifier {
  int _fontIndex = 0;

  get fontIndex => _fontIndex;

  void updateFontIndex(int fontIndex) {
    this._fontIndex = fontIndex;
    notifyListeners();
    Application.sp.putInt(Config.SP_FONT_INDEX, fontIndex);
  }
}
