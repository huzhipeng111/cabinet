import 'dart:convert';

import 'package:cabinet/generated/l10n.dart';
import 'package:cabinet/http/api.dart';
import 'package:cabinet/http/http_request.dart';
import 'package:cabinet/page/register/regisger_fragment.dart';
import 'package:cabinet/page/tabs.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/theme/dark_model.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:cabinet/utils/common.dart';
import 'package:cabinet/utils/login_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import '../../application.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm>
    with AutomaticKeepAliveClientMixin {
  String _name;
  String _pwd;

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeModel>(context, listen: false);
    bool isDarkMode = Provider.of<DarkMode>(context, listen: false).isDark;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 20,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(85),
                      ScreenUtil().setWidth(0),
                      ScreenUtil().setWidth(85),
                      ScreenUtil().setWidth(0)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "登录",
                        style: TextStyle(
                            color: MyColor.color_2B2D33,
                            fontSize: ScreenUtil().setSp(48),
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Color(0xff7E838F),
                              fontSize: ScreenUtil().setSp(30)),
                        ),
                        margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(16), 0,
                            0, ScreenUtil().setWidth(4)),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(60),
                      ScreenUtil().setWidth(0),
                      ScreenUtil().setWidth(60),
                      ScreenUtil().setWidth(0)),
                  child: TextField(
                    cursorColor: appTheme.themeColor,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: S.of(context).username,
                        hintStyle: TextStyle(color: MyColor.color_999EAD),
                        fillColor: Colors.transparent,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColor.color_E1E3E6),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColor.color_E1E3E6),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: MyColor.color_2B2D33,
                        )),
                    onChanged: (val) {
                      _name = val;
                    },
                  ),
                ),
                Container(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(60),
                      ScreenUtil().setWidth(0),
                      ScreenUtil().setWidth(60),
                      ScreenUtil().setWidth(0)),
                  child: TextField(
                    cursorColor: appTheme.themeColor,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: S.of(context).password,
                        fillColor: Colors.transparent,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColor.color_E1E3E6),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColor.color_E1E3E6),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: MyColor.color_2B2D33,
                        )),
                    onChanged: (val) {
                      _pwd = val;
                    },
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(460),
                  height: ScreenUtil().setHeight(50),
                  margin:
                      EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(47), 0, 0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "忘记密码？",
                    style: TextStyle(
                        color: MyColor.color_7E838F,
                        fontSize: ScreenUtil().setSp(26)),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(40),
                        ScreenUtil().setWidth(0),
                        ScreenUtil().setWidth(40),
                        ScreenUtil().setWidth(0)),
                    width: ScreenUtil().setWidth(679),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/icon_login_op_bg.png")),
                    ),
                    height: ScreenUtil().setHeight(196),
                    child: TextButton(
                      onPressed: () {
                        // if (_name == null || _name.isEmpty) {
                        //   CommonUtils.toast(S.of(context).username);
                        //   return;
                        // }
                        // if (_pwd == null || _pwd.isEmpty) {
                        //   CommonUtils.toast(S.of(context).password);
                        // }
                        doLogin();
                      },
                      child: Text(
                        S.of(context).login,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            color: MyColor.color_312f23),
                      ),
                    )),
                Container(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(85),
                      ScreenUtil().setWidth(0),
                      ScreenUtil().setWidth(85),
                      ScreenUtil().setWidth(0)),
                  width: ScreenUtil().setWidth(580),
                  height: ScreenUtil().setHeight(90),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                          MaterialPageRoute(builder: (context) => RegisterFragment()),
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
                        Visibility(
                          visible: true,
                          child: IconButton(
                            icon: Icon(Icons.arrow_right),
                            disabledColor: Color(int.parse("0x00000000")),
                            onPressed: null,
                          ),
                        ),
                        Text(
                          "没有账号，去注册",
                          style: TextStyle(
                              color: MyColor.color_515561,
                              fontSize: ScreenUtil().setSp(28),
                              decoration: TextDecoration.none),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_right),
                          disabledColor: MyColor.color_515561,
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "登录即代表同意六勤智能柜",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            color: MyColor.color_7E838F),
                      ),
                      TextButton(
                          onPressed: null,
                          child: Text(
                            "《用户协议》",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                color: MyColor.color_FFD200),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void doLogin() {
    var data;
    var userKey = _name + "(mailto:" + _name + ")";
    data = {"userKey": userKey, "password": _pwd};
    print(data);
    HttpRequest.getInstance().post(
        Api.LOGIN,
        data: data,
        successCallBack: (data) {
      Application.eventBus.fire(LoginEvent());
      saveUserInfo(data);
      Application.sp.putString(Config.SP_PWD, _pwd);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Tabs()),
            (route) => route == null,
      );
    }, errorCallBack: (code, msg) {});
  }

  void saveUserInfo(data) {
    print(data);
    Application.sp.putString(Config.SP_USER_INFO, data);
    Application.sp.putString(Config.SP_PWD, _pwd);
  }

  @override
  bool get wantKeepAlive => true;
}
