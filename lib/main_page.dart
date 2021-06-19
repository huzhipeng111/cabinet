import 'package:cabinet/generated/l10n.dart';
import 'package:cabinet/page/tabs.dart';
import 'package:cabinet/routes/routes.dart';
import 'package:cabinet/theme/dark_model.dart';
import 'package:cabinet/theme/font_model.dart';
import 'package:cabinet/theme/locale_model.dart';
import 'package:cabinet/theme/theme_colors.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application.dart';
import 'constant/Constants.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeModel>(context, listen: false);
    var darkMode = Provider.of<DarkMode>(context, listen: false);
    var fontMode = Provider.of<FontModel>(context, listen: false);
    var localeMode = Provider.of<LocaleModel>(context, listen: false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
      child: MaterialApp(
        theme: getTheme(appTheme.themeColor, isDarkMode: darkMode.isDark, fontIndex: fontMode.fontIndex),
        locale: localeMode.locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        // 设置中文为首选项
        supportedLocales: [const Locale('zh', ''), ...S.delegate.supportedLocales],
        home: Tabs(),
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
      )
    );
  }

  getTheme(Color themeColor, {bool isDarkMode = false, int fontIndex = 0}) {
    return ThemeData(
      fontFamily: Constants.FontList[fontIndex],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
  }
}
