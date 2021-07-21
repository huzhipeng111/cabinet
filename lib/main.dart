import 'dart:io';
import 'package:cabinet/splash.dart';
import 'package:cabinet/theme/dark_model.dart';
import 'package:cabinet/theme/locale_model.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/sp_util.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application.dart';
import 'generated/l10n.dart';
import 'theme/font_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Application.sp = await SpUtil.getInstance();
  final appTheme = ThemeModel();
  final darkMode = DarkMode();
  final fontMode = FontModel();
  final localeMode = LocaleModel();
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }

  // Permission check
  Future<void> getPermission() async {
    //请求权限
    Map<Permission, PermissionStatus> statuses = await [
      Permission.notification,
      Permission.storage,
    ].request();
    //校验权限
    if (statuses[Permission.notification] != PermissionStatus.granted) {
      Fluttertoast.showToast(
          msg: "需要打开通知权限",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
      openAppSettings();
    }
    if (statuses[Permission.storage] != PermissionStatus.granted) {
      Fluttertoast.showToast(
          msg: "需要打开允许访问存储权限",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
      openAppSettings();
    }
  }

  Future.wait([getPermission()]).then((result) {
    runApp(
      MultiProvider(
        // 接受监听
        providers: [
          ChangeNotifierProvider(create: (_) => appTheme),
          ChangeNotifierProvider(create: (_) => darkMode),
          ChangeNotifierProvider(create: (_) => fontMode),
          ChangeNotifierProvider(create: (_) => localeMode),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Application.eventBus = EventBus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Application.eventBus.destroy();
  }

  @override
  Widget build(BuildContext context) {
    var localeMode = Provider.of<LocaleModel>(context, listen: false);
    return ScreenUtilInit(
      designSize: Size(750, 1624),
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: true,
              locale: localeMode.locale,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              // 设置中文为首选项
              supportedLocales: [
                const Locale('de', ''),
                ...S.delegate.supportedLocales
              ],
              home: SplashView(),
            ));
  }
}
