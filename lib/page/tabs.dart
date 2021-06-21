import 'dart:convert';

import 'package:cabinet/data/device.dart';
import 'package:cabinet/data/eventbus/deviceEvent.dart';
import 'package:cabinet/data/login.dart';
import 'package:cabinet/generated/l10n.dart';
import 'package:cabinet/http/api.dart';
import 'package:cabinet/http/http_request.dart';
import 'package:cabinet/page/home/device/device_fragment.dart';
import 'package:cabinet/page/home/me/me_fragment.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/theme/theme_model.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../application.dart';

class Tabs extends StatefulWidget {
  final index;

  Tabs({Key key, this.index = 0}) : super(key: key);

  _TabsState createState() => _TabsState(this.index);
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  DeviceProvider deviceProvider = new DeviceProvider();
  var eventBusGetDevice = null;
  _TabsState(index) {
    this._currentIndex = index;
  }

  List _pageList = [DeviceFragment(), MeFragment()];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => deviceProvider),
        ],
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Scaffold(
            body: this._pageList[this._currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: this._currentIndex,
              backgroundColor: Colors.white,
              //配置对应的索引值选中
              onTap: (int index) {
                setState(() {
                  //改变状态
                  this._currentIndex = index;
                });
              },
              fixedColor: MyColor.color_2B2D33,
              //选中的颜色
              type: BottomNavigationBarType.fixed,
              //配置底部tabs可以有多个按钮
              items: [
                BottomNavigationBarItem(
                    icon: Image(
                        width: ScreenUtil().setWidth(46),
                        height: ScreenUtil().setHeight(40),
                        image:
                            AssetImage("assets/img/icon_device_unselecte.png")),
                    activeIcon: Image(
                        width: ScreenUtil().setWidth(46),
                        height: ScreenUtil().setHeight(40),
                        image: AssetImage("assets/img/icon_device_select.png")),
                    title: Text(S.of(context).tab_device)),
                BottomNavigationBarItem(
                    icon: Image(
                        width: ScreenUtil().setWidth(34),
                        height: ScreenUtil().setHeight(38),
                        image: AssetImage("assets/img/icon_me_unselecte.png")),
                    activeIcon: Image(
                        width: ScreenUtil().setWidth(34),
                        height: ScreenUtil().setHeight(38),
                        image: AssetImage("assets/img/icon_me_select.png")),
                    title: Text(S.of(context).tab_me))
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBusGetDevice = Application.eventBus.on<GetDevice>().listen((event) {
      print("监听到数据");
      loadData();
    });
    loadData();
  }

  @override
  void dispose() {
    eventBusGetDevice.cancel();
    super.dispose();
  }

  void loadData() {
    String info = Application.sp.getString(Config.SP_USER_INFO);
    print(info);
    if (info != null && info.isNotEmpty) {
      Map userMap = json.decode(info);
      LoginData userEntity = new LoginData.fromJson(userMap);
      HttpRequest.getInstance().options.headers = {"token": userEntity.token};
      HttpRequest.getInstance().get(Api.GET_DEVICES, successCallBack: (data) {
        if(data == null) {
          deviceProvider.updateDevice(null);
          Application.eventBus.fire(DeviceEvent());
        } else {
          List<DeviceData> deviceDatas = List();
          deviceDatas.clear();
          print(data.toString());
          List devicesJson = json.decode(data);
          print("设备的数量为：" + devicesJson.length.toString());
          devicesJson.forEach((element) {
            deviceDatas.add(DeviceData.fromJson(element));
          });
          deviceProvider.updateDevice(deviceDatas);
          print("发送eventbus");
          Application.eventBus.fire(DeviceEvent());
        }
      }, errorCallBack: (code, msg) {
        deviceProvider.updateDevice(null);
        Application.eventBus.fire(DeviceEvent());
      });
    }
  }
}
