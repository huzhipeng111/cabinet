import 'dart:convert';

import 'package:cabinet/data/login.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/theme/dark_model.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../application.dart';
import '../../../splash.dart';

class MeFragment extends StatefulWidget {
  @override
  _MeFragmentState createState() => _MeFragmentState();
}

class _MeFragmentState extends State<MeFragment>
    with AutomaticKeepAliveClientMixin {
  var userName = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String info = Application.sp.getString(Config.SP_USER_INFO);
    if (info != null && info.isNotEmpty) {
      Map userMap = json.decode(info);
      LoginData userEntity = new LoginData.fromJson(userMap);
      userName = userEntity.userMail;
    }
  }
  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeModel>(context, listen: false);
    bool isDarkMode = Provider.of<DarkMode>(context, listen: false).isDark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Material(
          // child: Flex(direction: Axis.vertical, clipBehavior: Clip.antiAlias, children: <Widget>[
          child: Stack(alignment: Alignment.center, children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: Image(
                image: AssetImage("assets/img/iocn_me_top.png"),
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(364),
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.srcIn,
              ),
            ),
            Positioned(
                left: 0,
                top: ScreenUtil().setHeight(303),
                child: Container(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(1320),
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
                          margin: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(0),
                              ScreenUtil().setHeight(163),
                              ScreenUtil().setWidth(0),
                              ScreenUtil().setHeight(64)),
                          child: Text(
                              userName.isEmpty ? "" : userName
                          ),
                        ),
                        Divider(
                          thickness: ScreenUtil().setHeight(20),
                          color: MyColor.color_E1E3E6,
                        ),
                        Container(
                          height: ScreenUtil().setHeight(119),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    ScreenUtil().setWidth(85),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setWidth(0),
                                    ScreenUtil().setHeight(0)),
                                child: Image(
                                  image: AssetImage(
                                      "assets/img/icon_user_guide.png"),
                                  width: ScreenUtil().setWidth(30),
                                  height: ScreenUtil().setHeight(36),
                                  fit: BoxFit.fill,
                                  colorBlendMode: BlendMode.srcIn,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    ScreenUtil().setWidth(23),
                                    ScreenUtil().setHeight(0),
                                    ScreenUtil().setWidth(0),
                                    ScreenUtil().setHeight(0)),
                                child: Text(
                                  "使用手册",
                                  style: TextStyle(
                                    color: MyColor.color_2B2D33,
                                    fontSize: ScreenUtil().setSp(28),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(85),
                              ScreenUtil().setHeight(0),
                              ScreenUtil().setWidth(85),
                              ScreenUtil().setHeight(0)),
                          child: Divider(
                            thickness: ScreenUtil().setHeight(1),
                            color: MyColor.color_E1E3E6,
                          ),
                        ),
                        // Expanded(
                        //   flex: 1,
                        //   child: Text(""),
                        // ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(85),
                              ScreenUtil().setWidth(440),
                              ScreenUtil().setWidth(85),
                              ScreenUtil().setWidth(0)),
                          width: ScreenUtil().setWidth(580),
                          height: ScreenUtil().setHeight(90),
                          child: ElevatedButton(
                            onPressed: () {
                              Application.sp.putString(Config.SP_USER_INFO, "");
                              Application.sp.putString(Config.SP_USER_INFO, "");
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => SplashView()),
                                    (route) => route == null,
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              side: MaterialStateProperty.all(
                                  BorderSide(width: 1, color: MyColor.color_E1E3E6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "退出登录",
                                  style: TextStyle(
                                      color: MyColor.color_515561,
                                      fontSize: ScreenUtil().setSp(28),
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: ScreenUtil().setHeight(213),
                child: ClipOval(
                  child: Image(
                    image: AssetImage("assets/img/iocn_me_top.png"),
                    width: ScreenUtil().setWidth(180),
                    height: ScreenUtil().setHeight(196),
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ))
          ]),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
