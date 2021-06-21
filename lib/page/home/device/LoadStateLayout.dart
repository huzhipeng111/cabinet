import 'dart:convert';

import 'package:cabinet/data/eventbus/deviceEvent.dart';
import 'package:cabinet/data/login.dart';
import 'package:cabinet/http/api.dart';
import 'package:cabinet/http/http_request.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:cabinet/utils/common.dart';
import 'package:cabinet/utils/login_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application.dart';

///四种视图状态
enum LoadState { State_Success, State_Error, State_Loading, State_Empty }

///根据不同状态来展示不同的视图
class LoadStateLayout extends StatefulWidget {

  final LoadState state; //页面状态
  final Widget successWidget;//成功视图
  final VoidCallback errorRetry; //错误事件处理

  LoadStateLayout(
      {Key key,
        this.state = LoadState.State_Loading,//默认为加载状态
        this.successWidget,
        this.errorRetry})
      : super(key: key);

  @override
  _LoadStateLayoutState createState() => _LoadStateLayoutState();
}

class _LoadStateLayoutState extends State<LoadStateLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //宽高都充满屏幕剩余空间
      color: MyColor.color_F5F6F7,
      width: ScreenUtil().screenWidth,
      child: _buildWidget,
    );
  }

  ///根据不同状态来显示不同的视图
  Widget get _buildWidget {
    switch (widget.state) {
      case LoadState.State_Success:
        return widget.successWidget;
        break;
      case LoadState.State_Error:
        return _errorView;
        break;
      case LoadState.State_Loading:
        return _loadingView;
        break;
      case LoadState.State_Empty:
        return _emptyView;
        break;
      default:
        return null;
    }
  }

  ///加载中视图
  Widget get _loadingView {
    return Container(
      color: MyColor.color_F5F6F7,
      width: ScreenUtil().screenWidth,
      alignment: Alignment.center,
      child: Container(
        height: ScreenUtil().setHeight(240),
        width: ScreenUtil().setWidth(320),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0x88000000), borderRadius: BorderRadius.circular(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[CircularProgressIndicator(), Text('正在加载')],
        ),
      ),
    );
  }

  ///错误视图
  Widget get _errorView {
    return Container(
      color: MyColor.color_F5F6F7,
      width: ScreenUtil().screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/img/icon_device_empty.png',
            height: 80,
            width: 100,
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: ScreenUtil().setHeight(20)),
          ),
          Text("加载失败，请重试"),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: ScreenUtil().setHeight(60)),
          ),
          RaisedButton(
            color: MyColor.color_FFD200,
            onPressed: widget.errorRetry,
            child: Text(
              '重新加载',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  ///数据为空的视图
  Widget get _emptyView {
    return Container(
      color: MyColor.color_F5F6F7,
      width: ScreenUtil().screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(0),
                ScreenUtil().setWidth(280),
                ScreenUtil().setWidth(0),
                ScreenUtil().setWidth(0)),
            child: Image.asset(
              'assets/img/icon_device_empty.png',
              width: ScreenUtil().setWidth(492),
              height: ScreenUtil().setHeight(110),
              fit: BoxFit.fill,
              colorBlendMode: BlendMode.srcIn,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(0),
                ScreenUtil().setWidth(52),
                ScreenUtil().setWidth(0),
                ScreenUtil().setWidth(0)),
            child: Text('暂无设备'),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(0),
                  ScreenUtil().setWidth(117),
                  ScreenUtil().setWidth(40),
                  ScreenUtil().setWidth(0)),
              width: ScreenUtil().setWidth(679),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/icon_scan_qr_device_bg.png")),
              ),
              height: ScreenUtil().setHeight(196),
              child: TextButton(
                onPressed: () {
                  // doBand("test2");
                  Application.eventBus.fire(EventScan());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/icon_scan_qr_device.png',
                      width: ScreenUtil().setWidth(29),
                      height: ScreenUtil().setHeight(29),
                      fit: BoxFit.fill,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: ScreenUtil().setWidth(19)),
                      child: Text(
                        "扫码添加",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                            color: MyColor.color_312f23),
                      ),
                    ),
                  ],
                )
              )),
        ],
      ),
    );
  }

  doBand(String _deviceId) {
    print("开始绑定");
    String info = Application.sp.getString(Config.SP_USER_INFO);
    print(info);
    // info = "";
    if (info != null && info.isNotEmpty) {
      Map userMap = json.decode(info);
      LoginData userEntity = new LoginData.fromJson(userMap);
      String _name = userEntity.userMail;
      int _userId = userEntity.userId;
      if (_name != null && _name.isNotEmpty) {
        var url = "device/${_deviceId}/bind/${_userId}";
        HttpRequest.getInstance().post(url,
            successCallBack: (data) {
              Application.eventBus.fire(LoginEvent());
            }, errorCallBack: (code, msg) {
              CommonUtils.toast(code.toString() + msg);
            });
      }
    }
  }
}