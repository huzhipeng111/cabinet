import 'package:cabinet/generated/l10n.dart';
import 'package:cabinet/page/login/login_form.dart';
import 'package:cabinet/page/register/register_form.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterFragment extends StatefulWidget {
  @override
  _RegisterFragmentState createState() => _RegisterFragmentState();
}

class _RegisterFragmentState extends State<RegisterFragment>
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
                  title: Text(S.of(context).register, style: TextStyle(color: MyColor.color_2B2D33, fontSize: ScreenUtil().setSp(36))),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: MyColor.color_2B2D33),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                body: Material(
                  child: RegisterForm(),
                  color: Colors.white,
                ))));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
