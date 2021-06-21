import 'dart:async';
import 'dart:convert';
import 'package:cabinet/http/api.dart';
import 'package:cabinet/http/http_request.dart';
import 'package:cabinet/page/login/login_fragment.dart';
import 'package:cabinet/page/tabs.dart';
import 'package:cabinet/routes/routes.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/theme/dark_model.dart';
import 'package:cabinet/theme/font_model.dart';
import 'package:cabinet/theme/locale_model.dart';
import 'package:cabinet/theme/theme_colors.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:cabinet/utils/common.dart';
import 'package:cabinet/utils/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application.dart';
import 'constant/Constants.dart';
import 'data/login.dart';
import 'generated/l10n.dart';
import 'main_page.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    queryThemeColor().then((index) {
      Provider.of<ThemeModel>(context, listen: false)
          .updateThemeColor(getThemeColors()[index]);
    });
    queryDark().then((value) {
      Provider.of<DarkMode>(context, listen: false).updateDarkMode(value);
      if (value) {
        Provider.of<ThemeModel>(context, listen: false)
            .updateThemeColor(Color(0xff323638));
      }
    });
    queryFontIndex().then((index) {
      Provider.of<FontModel>(context, listen: false).updateFontIndex(index);
    });
    getUserInfo();
  }

  queryThemeColor() async {
    int themeColorIndex = Application.sp.getInt(Config.SP_THEME_COLOR) ?? 0;
    return themeColorIndex;
  }

  /// 查询暗黑模式
  queryDark() async {
    bool isDark = Application.sp.getBool(Config.SP_DARK_MODEL) ?? false;
    return isDark;
  }

  /// 查询字体模式
  queryFontIndex() async {
    int fontIndex = Application.sp.getInt(Config.SP_FONT_INDEX) ?? 0;
    return fontIndex;
  }

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeModel>(context, listen: false);
    var darkMode = Provider.of<DarkMode>(context, listen: false);
    var fontMode = Provider.of<FontModel>(context, listen: false);
    var localeMode = Provider.of<LocaleModel>(context, listen: false);
    return MaterialApp(
      theme: getTheme(appTheme.themeColor,
          isDarkMode: darkMode.isDark, fontIndex: fontMode.fontIndex),
      locale: localeMode.locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      // 设置中文为首选项
      supportedLocales: [
        const Locale('zh', ''),
        ...S.delegate.supportedLocales
      ],
      // home: Tabs(),
      // initialRoute: '/',
      // onGenerateRoute: onGenerateRoute,
      home: Stack(
        children: [
          Image(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              fit: BoxFit.fill,
              image: AssetImage("assets/img/icon_splash.png")),
          Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(420)),
              child: Image(
                width: ScreenUtil().setWidth(220),
                height: ScreenUtil().setHeight(330),
                image: AssetImage("assets/img/icon_splash_bg.png"),
              ))
        ],
      ),
    );
  }

  getTheme(Color themeColor, {bool isDarkMode = false, int fontIndex = 0}) {
    return ThemeData(
      fontFamily: Constants.FontList[fontIndex],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
  }

  getUserInfo() async {
    // Application.sp.putString(Config.SP_USER_INFO, "");
    String info = Application.sp.getString(Config.SP_USER_INFO);
    print(info);
    // info = "";
    if (info != null && info.isNotEmpty) {
      Map userMap = json.decode(info);
      LoginData userEntity = new LoginData.fromJson(userMap);
      String _name = userEntity.userMail;
      String _pwd = Application.sp.getString(Config.SP_PWD);
      if (_pwd != null && _pwd.isNotEmpty) {
        doLogin(_name, _pwd);
      }
    } else {
      print("没有登录,");
      countdownToLogin();
      // countdown();
    }
  }

//  登录
  doLogin(String _name, String _pwd) {
    var data;
    data = {'userkey': _name, 'password': _pwd};
    print("开始登录");
    HttpRequest.getInstance().post(Api.LOGIN, data: data,
        successCallBack: (data) {
      Application.eventBus.fire(LoginEvent());
      saveInfo(data);
      print("登录成功");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Tabs()),
        (route) => route == null,
      );
    }, errorCallBack: (code, msg) {
      CommonUtils.toast(code + msg);
    });
  }

//  保存用户信息
  void saveInfo(data) async {
    await Application.sp.putString(Config.SP_USER_INFO, data);
  }

  void countdown() {
    Timer(new Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
        (route) => route == null,
      );
    });
  }

  void countdownToLogin() {
    Timer(new Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginFragment()),
        (route) => route == null,
      );
    });
  }
}
