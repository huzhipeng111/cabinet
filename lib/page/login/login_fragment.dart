import 'package:cabinet/generated/l10n.dart';
import 'package:cabinet/http/api.dart';
import 'package:cabinet/http/http_request.dart';
import 'package:cabinet/page/register/register_form.dart';
import 'package:cabinet/theme/dark_model.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:cabinet/utils/common.dart';
import 'package:cabinet/utils/login_event.dart';
import 'package:cabinet/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../application.dart';
import 'login_form.dart';

class LoginFragment extends StatefulWidget {
  @override
  _LoginFragmentState createState() => _LoginFragmentState();
}

class _LoginFragmentState extends State<LoginFragment>
    with AutomaticKeepAliveClientMixin {
  String _name;
  String _pwd;

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<ThemeModel>(context, listen: false);
    bool isDarkMode = Provider.of<DarkMode>(context, listen: false).isDark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Material(
          // child: Flex(direction: Axis.vertical, clipBehavior: Clip.antiAlias, children: <Widget>[
          child: Stack(children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: Image(
                image: AssetImage("assets/img/icon_login_bg.png"),
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
                    borderRadius: BorderRadius.vertical(top: Radius.circular(ScreenUtil().setWidth(80)), bottom: Radius.zero)
                  ),
                  child: LoginForm(),
                ),
              )
            )
          ]),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
