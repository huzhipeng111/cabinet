import 'package:cabinet/generated/l10n.dart';
import 'package:cabinet/http/api.dart';
import 'package:cabinet/http/http_request.dart';
import 'package:cabinet/page/registerconfirm/register_confirm.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/theme/dark_model.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm>
    with AutomaticKeepAliveClientMixin {
  String _name;
  String _pwd;
  String _pwd2;

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeModel>(context, listen: false);
    bool isDarkMode = Provider.of<DarkMode>(context, listen: false).isDark;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(80),
                      ScreenUtil().setWidth(0),
                      ScreenUtil().setWidth(80),
                      ScreenUtil().setWidth(0)),
                  child: TextField(
                    cursorColor: appTheme.themeColor,
                    keyboardType: TextInputType.emailAddress,
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
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(80),
                      ScreenUtil().setWidth(0),
                      ScreenUtil().setWidth(80),
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
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(80),
                      ScreenUtil().setWidth(0),
                      ScreenUtil().setWidth(80),
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
                      _pwd2 = val;
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(40),
                        ScreenUtil().setWidth(40),
                        ScreenUtil().setWidth(40),
                        ScreenUtil().setWidth(40)),
                    width: ScreenUtil().setWidth(679),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/icon_login_op_bg.png")),
                    ),
                    height: ScreenUtil().setHeight(196),
                    child: TextButton(
                      onPressed: () {
                        if (_name == null || _name.isEmpty) {
                          CommonUtils.toast(S.of(context).username);
                          return;
                        }
                        if (_pwd == null ||
                            _pwd.isEmpty ||
                            _pwd2 == null ||
                            _pwd2.isEmpty) {
                          CommonUtils.toast(S.of(context).password);
                        }
                        doRegister();
                      },
                      child: Text(
                        S.of(context).register,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            color: MyColor.color_312f23),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void doRegister() {
    var data;
    var userKey = _name + "(mailto:" + _name + ")";
    data = {'nickname': "hzp", 'userMail': userKey, "password": _pwd};
    print(data);
    HttpRequest.getInstance().post(Api.REGISTER, data: data,
        successCallBack: (data) {
      print("注册成功。。。");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterConfirmFragment()),
      );
    }, errorCallBack: (code, msg) {
      print("注册失败。。。");
    });
  }

  @override
  bool get wantKeepAlive => true;
}
