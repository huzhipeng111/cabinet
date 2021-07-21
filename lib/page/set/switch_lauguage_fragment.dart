import 'package:cabinet/application.dart';
import 'package:cabinet/constant/Constants.dart';
import 'package:cabinet/generated/l10n.dart';
import 'package:cabinet/page/login/login_form.dart';
import 'package:cabinet/page/register/register_form.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/theme/locale_model.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:cabinet/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../splash.dart';

class ChooseLanguageFragment extends StatefulWidget {
  @override
  _ChooseLanguageFragmentState createState() => _ChooseLanguageFragmentState();
}

class _ChooseLanguageFragmentState extends State<ChooseLanguageFragment>
    with AutomaticKeepAliveClientMixin {
  var _pageController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeModel>(context, listen: false);
    var localeMode = Provider.of<LocaleModel>(context, listen: false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Material(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  centerTitle: true,
                  title: Text(S.of(context).select_lauguage, style: TextStyle(color: MyColor.color_2B2D33, fontSize: ScreenUtil().setSp(36))),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: MyColor.color_2B2D33),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                body: Material(
                  child: Material(
                    color: Colors.white,
                    shape: ContinuousRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(ScreenUtil().setWidth(80)),
                            bottom: Radius.zero)),
                    child: Column(
                      children: [
                        Container(
                            height: ScreenUtil().setHeight(70),
                            child: ElevatedButton(
                                onPressed: () {
                                  Application.sp.putInt(Config.SP_LOCALE_INDEX, 0);
                                  localeMode.updateLocaleIndex(0);
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashView()),
                                        (route) => route == null,
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          ScreenUtil().setWidth(23),
                                          ScreenUtil().setHeight(0),
                                          ScreenUtil().setWidth(0),
                                          ScreenUtil().setHeight(0)),
                                      child: Text(
                                        S.of(context).following_system,
                                        style: TextStyle(
                                          color: localeMode.localeIndex == 0? MyColor.color_0E5C67 : MyColor.color_2B2D33,
                                          fontSize: ScreenUtil().setSp(28),
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(23),
                              ScreenUtil().setHeight(0),
                              ScreenUtil().setWidth(0),
                              ScreenUtil().setHeight(0)),
                          child: Divider(
                            thickness: ScreenUtil().setHeight(1),
                            color: MyColor.color_E1E3E6,
                          ),
                        ),
                        Container(
                            height: ScreenUtil().setHeight(70),
                            child: ElevatedButton(
                                onPressed: () {
                                  Application.sp.putInt(Config.SP_LOCALE_INDEX, 1);
                                  localeMode.updateLocaleIndex(1);
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashView()),
                                        (route) => route == null,
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          ScreenUtil().setWidth(23),
                                          ScreenUtil().setHeight(0),
                                          ScreenUtil().setWidth(0),
                                          ScreenUtil().setHeight(0)),
                                      child: Text(
                                        "中文",
                                        style: TextStyle(
                                          color: localeMode.localeIndex == 1? MyColor.color_0E5C67 : MyColor.color_2B2D33,
                                          fontSize: ScreenUtil().setSp(28),
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(23),
                              ScreenUtil().setHeight(0),
                              ScreenUtil().setWidth(0),
                              ScreenUtil().setHeight(0)),
                          child: Divider(
                            thickness: ScreenUtil().setHeight(1),
                            color: MyColor.color_E1E3E6,
                          ),
                        ),
                        Container(
                            height: ScreenUtil().setHeight(70),
                            child: ElevatedButton(
                                onPressed: () {
                                  Application.sp.putInt(Config.SP_LOCALE_INDEX, 2);
                                  localeMode.updateLocaleIndex(2);
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashView()),
                                        (route) => route == null,
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          ScreenUtil().setWidth(23),
                                          ScreenUtil().setHeight(0),
                                          ScreenUtil().setWidth(0),
                                          ScreenUtil().setHeight(0)),
                                      child: Text(
                                        "English",
                                        style: TextStyle(
                                          color: localeMode.localeIndex == 2? MyColor.color_0E5C67 : MyColor.color_2B2D33,
                                          fontSize: ScreenUtil().setSp(28),
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(23),
                              ScreenUtil().setHeight(0),
                              ScreenUtil().setWidth(0),
                              ScreenUtil().setHeight(0)),
                          child: Divider(
                            thickness: ScreenUtil().setHeight(1),
                            color: MyColor.color_E1E3E6,
                          ),
                        ),
                        Container(
                            height: ScreenUtil().setHeight(70),
                            child: ElevatedButton(
                                onPressed: () {
                                  Application.sp.putInt(Config.SP_LOCALE_INDEX, 3);
                                  localeMode.updateLocaleIndex(3);
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SplashView()),
                                        (route) => route == null,
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          ScreenUtil().setWidth(23),
                                          ScreenUtil().setHeight(0),
                                          ScreenUtil().setWidth(0),
                                          ScreenUtil().setHeight(0)),
                                      child: Text(
                                        "Deutsch",
                                        style: TextStyle(
                                          color: localeMode.localeIndex == 3? MyColor.color_0E5C67 : MyColor.color_2B2D33,
                                          fontSize: ScreenUtil().setSp(28),
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(23),
                              ScreenUtil().setHeight(0),
                              ScreenUtil().setWidth(0),
                              ScreenUtil().setHeight(0)),
                          child: Divider(
                            thickness: ScreenUtil().setHeight(1),
                            color: MyColor.color_E1E3E6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                ))));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
