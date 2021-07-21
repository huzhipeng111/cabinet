import 'dart:convert';
import 'dart:ffi';

import 'package:cabinet/data/device.dart';
import 'package:cabinet/data/eventbus/deviceEvent.dart';
import 'package:cabinet/data/login.dart';
import 'package:cabinet/generated/l10n.dart';
import 'package:cabinet/http/api.dart';
import 'package:cabinet/http/http_request.dart';
import 'package:cabinet/theme/colors.dart';
import 'package:cabinet/utils/Config.dart';
import 'package:cabinet/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../application.dart';
import 'LoadStateLayout.dart';

import 'package:qrscan/qrscan.dart' as scanner;

class DeviceFragment extends StatefulWidget {
  @override
  _DeviceFragmentState createState() => _DeviceFragmentState();
}

class _DeviceFragmentState extends State<DeviceFragment>
    with AutomaticKeepAliveClientMixin {
  LoadState _layoutState = LoadState.State_Loading;
  var isLoading = false;
  var showScanDialog = false;
  var scanResult = "";
  var selectedLock = -1;
  List<DeviceData> deviceDatas = List();
  var eventBusDevice = null;
  var eventBusScan = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData(false);
    eventBusDevice = Application.eventBus.on<DeviceEvent>().listen((event) {
      loadData(true);
    });
    eventBusScan = Application.eventBus.on<EventScan>().listen((event) {
      scan();
    });
  }

  @override
  void dispose() {
    eventBusDevice.cancel();
    eventBusScan.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
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
                    ScreenUtil().setWidth(0),
                    ScreenUtil().setWidth(0)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      S.of(context).menu,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(36),
                          color: MyColor.color_2B2D33,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: Text("")),
                    TextButton(
                        onPressed: () {
                          scan();
                        },
                        child: Container(
                          child: Image(
                            image: AssetImage("assets/img/icon_scan_qr.png"),
                            width: ScreenUtil().setWidth(40),
                            height: ScreenUtil().setHeight(40),
                            fit: BoxFit.contain,
                            colorBlendMode: BlendMode.srcIn,
                          ),
                        ))
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
                      Application.eventBus.fire(GetDevice());
                    }, //错误按钮点击过后进行重新加载
                    successWidget: Stack(
                      children: [
                        Container(
                          color: Colors.white,
                          width: ScreenUtil().screenWidth,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: RefreshIndicator(
                                onRefresh: _refresh,
                                child: ListView.builder(
                                  itemCount: deviceDatas == null
                                      ? 0
                                      : deviceDatas.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        height: ScreenUtil().setHeight(209),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(""),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(
                                                          start: ScreenUtil()
                                                              .setWidth(74)),
                                                ),
                                                Image(
                                                  image: AssetImage(
                                                      "assets/img/icon_device_default.png"),
                                                  height: ScreenUtil()
                                                      .setHeight(120),
                                                  width: ScreenUtil()
                                                      .setWidth(148),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(
                                                          start: ScreenUtil()
                                                              .setWidth(30)),
                                                ),
                                                Container(
                                                  width: ScreenUtil()
                                                      .setWidth(160),
                                                  child: Text(deviceDatas[index]
                                                      .deviceId),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .only(
                                                          start: ScreenUtil()
                                                              .setWidth(70)),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: ScreenUtil()
                                                      .setWidth(200),
                                                  height: ScreenUtil()
                                                      .setHeight(160),
                                                child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Positioned(
                                                        left: ScreenUtil()
                                                            .setWidth(74),
                                                        right: ScreenUtil()
                                                            .setWidth(21),
                                                        top: ScreenUtil()
                                                            .setHeight(17),
                                                        child: Container(
                                                          //Expanded(flex: 1, child: Text("")),
                                                            height: ScreenUtil().setHeight(20),
                                                            alignment: Alignment.center,
                                                            child: ListView.builder(
                                                                itemCount: deviceDatas[index].shadow.lock.length,
                                                                scrollDirection: Axis.horizontal,
                                                                itemBuilder: (context, positon) {
                                                                  return Container(
                                                                    margin: EdgeInsets.fromLTRB(
                                                                        ScreenUtil().setWidth(4),
                                                                        ScreenUtil().setHeight(0),
                                                                        ScreenUtil().setWidth(4),
                                                                        ScreenUtil().setHeight(0)),
                                                                    width: ScreenUtil().setWidth(18),
                                                                    height: ScreenUtil().setHeight(4),
                                                                    decoration: BoxDecoration(
                                                                        color: deviceDatas[index].shadow.lock[positon] == 0 ? MyColor.color_34BD15 : MyColor.color_FF6418,
                                                                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8))),
                                                                  );
                                                                })),
                                                      ),
                                                      Positioned(
                                                          left: ScreenUtil()
                                                              .setWidth(21),
                                                          right: ScreenUtil()
                                                              .setWidth(21),
                                                          top: ScreenUtil()
                                                              .setHeight(54),
                                                          child: Visibility(
                                                            visible: getVisible(deviceDatas[index]),
                                                            child: Container(
                                                              width: ScreenUtil()
                                                                  .setWidth(134),
                                                              height: ScreenUtil()
                                                                  .setHeight(70),
                                                              child: ElevatedButton(
                                                                onPressed: () {
                                                                  showModalBottomSheet(
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius
                                                                                  .circular(
                                                                                  10),
                                                                              topRight: Radius
                                                                                  .circular(
                                                                                  10),
                                                                              bottomLeft:
                                                                              Radius.circular(
                                                                                  0),
                                                                              bottomRight:
                                                                              Radius.circular(
                                                                                  0))),
                                                                      context: context,
                                                                      builder:
                                                                          (BuildContext
                                                                      context) {
                                                                        return StatefulBuilder(
                                                                            builder: (context,
                                                                                setState1) {
                                                                              return Container(
                                                                                  height: ScreenUtil()
                                                                                      .setHeight(
                                                                                      720),
                                                                                  //对话框高度就是此高度
                                                                                  child:
                                                                                  Column(
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex:
                                                                                        1,
                                                                                        child:
                                                                                        Text(""),
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.only(start: ScreenUtil().setWidth(74)),
                                                                                          ),
                                                                                          Image(
                                                                                            image: AssetImage("assets/img/icon_device_default.png"),
                                                                                            height: ScreenUtil().setHeight(120),
                                                                                            width: ScreenUtil().setWidth(148),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.only(start: ScreenUtil().setWidth(30)),
                                                                                          ),
                                                                                          Container(
                                                                                            width: ScreenUtil().setWidth(160),
                                                                                            child: Text(deviceDatas[index].deviceId),
                                                                                          ),
                                                                                          Container(
                                                                                            alignment: Alignment.center,
                                                                                            width: ScreenUtil().setWidth(120),
                                                                                            height: ScreenUtil().setHeight(40),
                                                                                            decoration: BoxDecoration(color: deviceDatas[index].shadow.lock == 0 ? MyColor.color_34BD15 : MyColor.color_FF6418, borderRadius: BorderRadius.circular(ScreenUtil().setWidth(6))),
                                                                                            child: Text(
                                                                                              deviceDatas[index].shadow.lock == 0 ? S.of(context).close : S.of(context).open_drawer,
                                                                                              style: TextStyle(
                                                                                                fontSize: ScreenUtil().setSp(12),
                                                                                                color: Colors.white,
                                                                                              ),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(
                                                                                            ScreenUtil().setWidth(85),
                                                                                            ScreenUtil().setHeight(50),
                                                                                            ScreenUtil().setWidth(85),
                                                                                            ScreenUtil().setHeight(0)),
                                                                                        child:
                                                                                        Divider(
                                                                                          thickness:
                                                                                          ScreenUtil().setHeight(1),
                                                                                          color:
                                                                                          MyColor.color_E1E3E6,
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(
                                                                                            ScreenUtil().setWidth(90),
                                                                                            ScreenUtil().setWidth(0),
                                                                                            ScreenUtil().setWidth(90),
                                                                                            ScreenUtil().setWidth(0)),
                                                                                        width:
                                                                                        ScreenUtil().setWidth(570),
                                                                                        height:
                                                                                        ScreenUtil().setHeight(220),
                                                                                        child: GridView.builder(
                                                                                            itemCount: deviceDatas[index].shadow.lock.length,
                                                                                            // itemCount: 6,
                                                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                crossAxisCount: 3,
                                                                                                //横轴3个子组件
                                                                                                childAspectRatio: 1.5 //宽高比为1
                                                                                            ),
                                                                                            itemBuilder: (count, positon) {
                                                                                              return Stack(
                                                                                                alignment: Alignment.center,
                                                                                                children: [
                                                                                                  Positioned(
                                                                                                      left: ScreenUtil().setWidth(21),
                                                                                                      right: ScreenUtil().setWidth(21),
                                                                                                      top: ScreenUtil().setHeight(17),
                                                                                                      child: Container(
                                                                                                        width: ScreenUtil().setWidth(140),
                                                                                                        height: ScreenUtil().setHeight(65),
                                                                                                        child: ElevatedButton(
                                                                                                          onPressed: () {
                                                                                                            if (deviceDatas[index].shadow.lock[positon] == 0) {
                                                                                                              setState1(() {
                                                                                                                this.selectedLock = positon;
                                                                                                              });
                                                                                                            }
                                                                                                          },
                                                                                                          style: ButtonStyle(
                                                                                                            backgroundColor: MaterialStateProperty.all(positon == this.selectedLock
                                                                                                                ? MyColor.color_0E5C67
                                                                                                                : deviceDatas[index].shadow.lock[positon] == 0
                                                                                                                ? MyColor.color_white
                                                                                                                : MyColor.color_F5F7FA),
                                                                                                            elevation: MaterialStateProperty.all(0),
                                                                                                            side: MaterialStateProperty.all(BorderSide(width: 1, color: positon == this.selectedLock ? MyColor.color_0E5C67 : MyColor.color_E1E3E6)),
                                                                                                          ),
                                                                                                          child: Text(
                                                                                                            S.of(context).lock + (positon + 1).toString(),
                                                                                                            style: TextStyle(
                                                                                                                color: positon == this.selectedLock
                                                                                                                    ? MyColor.color_white
                                                                                                                    : deviceDatas[index].shadow.lock[positon] == 0
                                                                                                                    ? MyColor.color_2B2D33
                                                                                                                    : MyColor.color_86888F,
                                                                                                                fontSize: ScreenUtil().setSp(24),
                                                                                                                decoration: TextDecoration.none),
                                                                                                          ),
                                                                                                        ),
                                                                                                      )),
                                                                                                  Positioned(
                                                                                                    right: ScreenUtil().setWidth(4),
                                                                                                    top: 0,
                                                                                                    child: Container(
                                                                                                      alignment: Alignment.center,
                                                                                                      width: ScreenUtil().setWidth(40),
                                                                                                      height: ScreenUtil().setHeight(34),
                                                                                                      decoration: BoxDecoration(color: deviceDatas[index].shadow.lock[positon] == 0 ? MyColor.color_34BD15 : MyColor.color_FF6418, borderRadius: BorderRadius.circular(ScreenUtil().setWidth(6))),
                                                                                                      child: Text(
                                                                                                        deviceDatas[index].shadow.lock[positon] == 0 ? S.of(context).close1 : S.of(context).open,
                                                                                                        style: TextStyle(
                                                                                                          fontSize: ScreenUtil().setSp(12),
                                                                                                          color: Colors.white,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            }),
                                                                                      ),
                                                                                      Container(
                                                                                          margin: EdgeInsets.fromLTRB(
                                                                                              ScreenUtil().setWidth(40),
                                                                                              ScreenUtil().setWidth(0),
                                                                                              ScreenUtil().setWidth(40),
                                                                                              ScreenUtil().setWidth(0)),
                                                                                          width: ScreenUtil().setWidth(679),
                                                                                          decoration: BoxDecoration(
                                                                                            image: DecorationImage(image: AssetImage("assets/img/icon_login_op_bg.png")),
                                                                                          ),
                                                                                          height: ScreenUtil().setHeight(196),
                                                                                          child: TextButton(
                                                                                            onPressed: () {
                                                                                              if (selectedLock != -1) {
                                                                                                Navigator.pop(context);
                                                                                                unLockDevice(deviceDatas[index], selectedLock);
                                                                                              }
                                                                                            },
                                                                                            child: Text(
                                                                                              S.of(context).unlock,
                                                                                              style: TextStyle(fontSize: ScreenUtil().setSp(30), color: MyColor.color_white),
                                                                                            ),
                                                                                          )),
                                                                                      Expanded(
                                                                                        flex:
                                                                                        1,
                                                                                        child:
                                                                                        Text(""),
                                                                                      ),
                                                                                      Divider(
                                                                                          color:
                                                                                          MyColor.color_E1E3E6,
                                                                                          height: ScreenUtil().setHeight(1)),
                                                                                    ],
                                                                                  ));
                                                                            });
                                                                      });
                                                                },
                                                                style: ButtonStyle(
                                                                  padding:
                                                                  MaterialStateProperty.all(
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0)),
                                                                  backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(Colors
                                                                      .white),
                                                                  elevation:
                                                                  MaterialStateProperty
                                                                      .all(0),
                                                                  side: MaterialStateProperty
                                                                      .all(BorderSide(
                                                                      width: 1,
                                                                      color: MyColor
                                                                          .color_E1E3E6)),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: <Widget>[
                                                                    Image(
                                                                        height:
                                                                        ScreenUtil()
                                                                            .setHeight(
                                                                            24),
                                                                        width:
                                                                        ScreenUtil()
                                                                            .setWidth(
                                                                            28),
                                                                        image: AssetImage(
                                                                            "assets/img/icon_lock_op.png")),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.only(
                                                                          start:
                                                                          ScreenUtil()
                                                                              .setWidth(
                                                                              4)),
                                                                    ),
                                                                    Text(
                                                                      S
                                                                          .of(context)
                                                                          .unlock,
                                                                      style: TextStyle(
                                                                          color: MyColor
                                                                              .color_515561,
                                                                          fontSize:
                                                                          ScreenUtil()
                                                                              .setSp(
                                                                              24),
                                                                          decoration:
                                                                          TextDecoration
                                                                              .none),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                    ])),
                                              ],
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(""),
                                            ),
                                            Divider(
                                                color: MyColor.color_E1E3E6,
                                                height:
                                                    ScreenUtil().setHeight(1)),
                                          ],
                                        ));
                                  },
                                )),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        Visibility(
            visible: isLoading,
            child: Container(
              color: Colors.transparent,
              width: ScreenUtil().screenWidth,
              alignment: Alignment.center,
              child: Container(
                height: ScreenUtil().setHeight(240),
                width: ScreenUtil().setWidth(320),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0x88000000),
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text(S.of(context).loading)
                  ],
                ),
              ),
            )),
        Visibility(
            visible: showScanDialog,
            child: Container(
              color: Colors.transparent,
              width: ScreenUtil().screenWidth,
              alignment: Alignment.center,
              child: Container(
                height: ScreenUtil().setHeight(400),
                width: ScreenUtil().setWidth(600),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0x88000000),
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      S.of(context).scan_reslut,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      scanResult,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(""),
                          flex: 1,
                        ),
                        Container(
                          width: ScreenUtil().setWidth(134),
                          height: ScreenUtil().setHeight(70),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                scanResult = "";
                                showScanDialog = false;
                              });
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              side: MaterialStateProperty.all(BorderSide(
                                  width: 1, color: MyColor.color_E1E3E6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  S.of(context).cancel,
                                  style: TextStyle(
                                      color: MyColor.color_515561,
                                      fontSize: ScreenUtil().setSp(24),
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: ScreenUtil().setWidth(100)),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(134),
                          height: ScreenUtil().setHeight(70),
                          child: ElevatedButton(
                            onPressed: () {
                              doBand(scanResult);
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              side: MaterialStateProperty.all(BorderSide(
                                  width: 1, color: MyColor.color_E1E3E6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  S.of(context).binding,
                                  style: TextStyle(
                                      color: MyColor.color_515561,
                                      fontSize: ScreenUtil().setSp(24),
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(""),
                          flex: 1,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }

  doBand(String _deviceId) {
    setState(() {
      showScanDialog = false;
      isLoading = true;
    });
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
        HttpRequest.getInstance().post(url, successCallBack: (data) {
          setState(() {
            isLoading = false;
          });
          fetchData();
          CommonUtils.toast(S.of(context).binding_succeeded);
        }, errorCallBack: (code, msg) {
          CommonUtils.toast(code.toString() + " " + msg);
          setState(() {
            isLoading = false;
          });
          fetchData();
        });
      }
    }
  }

  //扫码函数,最简单的那种
  Future scan() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      String cameraScanResult = await scanner.scan(); //通过扫码获取二维码中的数据
      if (cameraScanResult != null) {
        print(cameraScanResult); //在控制台打印
        scanResult = cameraScanResult;
        setState(() {
          showScanDialog = true;
        });
      }
    }
  }

  Future<Void> _refresh() async {
    fetchData();
    await Future.delayed(Duration(seconds: 3));
    return null;
  }

  void unLockDevice(DeviceData deviceData, int lockId) {
    // device/{deviceId}/open
    setState(() {
      isLoading = true;
    });
    HttpRequest.getInstance()
        .post("device/${deviceData.deviceId}/open/${lockId + 1}",
            successCallBack: (data) {
      if (data.toString() == "true") {
        print("开锁成功");
        CommonUtils.toast(S.of(context).unlocking_succeeded);
        fetchData();
        setState(() {
          isLoading = false;
        });
      } else {
        CommonUtils.toast(S.of(context).unlocking_failed);
        setState(() {
          isLoading = false;
        });
      }
    }, errorCallBack: (code, msg) {
      Provider.of<DeviceProvider>(context, listen: false).updateDevice(null);
      loadData(false);
      CommonUtils.toast(S.of(context).unlocking_failed);
      setState(() {
        isLoading = false;
      });
    });
  }

  bool getVisible(DeviceData data) {
    var hasLocked = false;
    data.shadow.lock.forEach((element) {
      if(element == 0) {
        hasLocked = true;
      }
    });
    return hasLocked;
  }
  void fetchData() {
    String info = Application.sp.getString(Config.SP_USER_INFO);
    print(info);
    if (info != null && info.isNotEmpty) {
      Map userMap = json.decode(info);
      LoginData userEntity = new LoginData.fromJson(userMap);
      HttpRequest.getInstance().options.headers = {"token": userEntity.token};
      HttpRequest.getInstance().get(Api.GET_DEVICES, successCallBack: (data) {
        List<DeviceData> deviceDatas = List();
        deviceDatas.clear();
        print(data.toString());
        List devicesJson = json.decode(data);
        print("设备的数量为：" + devicesJson.length.toString());
        devicesJson.forEach((element) {
          deviceDatas.add(DeviceData.fromJson(element));
        });
        Provider.of<DeviceProvider>(context, listen: false)
            .updateDevice(deviceDatas);
        loadData(false);
      }, errorCallBack: (code, msg) {
        Provider.of<DeviceProvider>(context, listen: false).updateDevice(null);
        loadData(false);
      });
    } else {}
  }

  // scan2() async {
  //   var status = await Permission.camera.request();
  //   if(status.isGranted){
  //     App.go(
  //         context,
  //         ScanPage(widget.countyCode,widget.phoneNumber)
  //     );
  //   }
  // }

  void loadData(bool fromEvent) {
    var devices = Provider.of<DeviceProvider>(context, listen: false);
    deviceDatas = devices.devices;
    if (deviceDatas == null) {
      if (fromEvent) {
        setState(() {
          _layoutState = LoadState.State_Error;
        });
      }
    } else if (deviceDatas.isEmpty) {
      setState(() {
        //如果加载结束后的数据为空，则状态改为空
        _layoutState = LoadState.State_Empty;
      });
    } else {
      setState(() {
        _layoutState = LoadState.State_Success;
      });
    }
  }

  @override
  bool get wantKeepAlive => true;
}
