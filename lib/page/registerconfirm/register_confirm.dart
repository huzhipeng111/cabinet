import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterConfirmFragment extends StatefulWidget {
  @override
  _RegisterConfirmFragmentState createState() => _RegisterConfirmFragmentState();
}

class _RegisterConfirmFragmentState extends State<RegisterConfirmFragment>
    with AutomaticKeepAliveClientMixin {
  var _pageController = new PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeModel>(context, listen: false);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Material(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  centerTitle: true,
                  title: Text("注册", style: TextStyle(color: MyColor.color_2B2D33, fontSize: ScreenUtil().setSp(36))),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: MyColor.color_2B2D33),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                body: Material(
                  color: Colors.white,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: ScreenUtil().setHeight(100),
                        ),
                        Image(
                          image: AssetImage("assets/img/icon_register_confirm.png"),
                          width: ScreenUtil().setWidth(393),
                          height: ScreenUtil().setHeight(253),
                          fit: BoxFit.fill,
                          colorBlendMode: BlendMode.srcIn,
                        ),
                        Container(
                          height: ScreenUtil().setHeight(40),
                        ),
                        Text("请登录邮箱后确认"),
                        Container(
                          height: ScreenUtil().setHeight(40),
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
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "我已确认",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(30),
                                    color: MyColor.color_white),
                              ),
                            )),
                      ],
                    ),
                  ),
                ))));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
