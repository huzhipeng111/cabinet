import 'dart:convert';

import 'package:cabinet/data/login.dart';
import 'package:cabinet/http/api.dart';
import 'package:cabinet/http/http_request.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:cabinet/utils/common.dart';
import 'package:cabinet/utils/login_event.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../application.dart';
import 'LoadStateLayout.dart';

class DeviceFragment extends StatefulWidget {

  @override
  _DeviceFragmentState createState() => _DeviceFragmentState();

}

class _DeviceFragmentState extends State<DeviceFragment> with AutomaticKeepAliveClientMixin {
  LoadState _layoutState = LoadState.State_Loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: ScreenUtil().statusBarHeight,
          ),
          Container(
            height: ScreenUtil().setHeight(140),
            margin: EdgeInsets.fromLTRB(
                ScreenUtil().setWidth(77),
                ScreenUtil().setWidth(0),
                ScreenUtil().setWidth(77),
                ScreenUtil().setWidth(0)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("设备", style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: MyColor.color_2B2D33,
                    fontWeight: FontWeight.bold
                ),),
                Expanded(child: Text("")),
                Image(
                  image: AssetImage("assets/img/icon_scan_qr.png"),
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setHeight(40),
                  fit: BoxFit.contain,
                  colorBlendMode: BlendMode.srcIn,
                )
              ],
            ),
          ),
          Divider(
            height: ScreenUtil().setHeight(1),
            color: MyColor.color_E1E3E6,
          ),
          Expanded(
            flex: 1,
            child: LoadStateLayout(
              state: _layoutState,
              errorRetry: () {
                setState(() {
                  _layoutState = LoadState.State_Loading;
                });
                loadData();
              }, //错误按钮点击过后进行重新加载
              successWidget: Center(
                child: Text('加载成功'),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void loadData() {
    String info = Application.sp.getString(Config.SP_USER_INFO);
    print(info);
    if (info != null && info.isNotEmpty) {
      Map userMap = json.decode(info);
      LoginData userEntity = new LoginData.fromJson(userMap);
      HttpRequest.getInstance().options.headers = {"token": userEntity.token};
      HttpRequest.getInstance().get(
          Api.GET_DEVICES,
          successCallBack: (data) {
            print(data.toString());
            List devices = json.decode(data);
            if(devices.isEmpty) {
              setState(() {
                //如果加载结束后的数据为空，则状态改为空
                _layoutState = LoadState.State_Empty;
              });
            } else {
              setState(() {
                //如果加载结束后的数据为空，则状态改为空
                _layoutState = LoadState.State_Success;
              });
            }
          }, errorCallBack: (code, msg) {});
    }
  }
  @override
  bool get wantKeepAlive => true;

}