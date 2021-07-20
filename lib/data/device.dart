import 'dart:convert';

import 'package:flutter/cupertino.dart';

class DeviceData{
  String deviceId;
  String createTime;
  int createUid;
  String createUser;
  String updateTime;
  String updateUser;
  int updateUid;
  int status;
  String remark;
  ShadowData shadow;

  DeviceData.fromJson(Map<String, dynamic> json1) {
    deviceId = json1['deviceId'];
    createTime = json1['createTime'];
    createUid = json1['createUid'];
    createUser = json1['createUser'];
    updateTime = json1['updateTime'];
    updateUser = json1['updateUser'];
    updateUid = json1['updateUid'];
    status = json1['status'];
    remark = json1['remark'];
    shadow = ShadowData.fromJson(json.decode(json1['shadow']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceId'] = this.deviceId;
    data['createTime'] = this.createTime;
    data['createUid'] = this.createUid;
    data['createUser'] = this.createUser;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    data['updateUid'] = this.updateUid;
    data['status'] = this.status;
    data['remark'] = this.remark;
    data['shadow'] = this.shadow;
    return data;
  }
}

class DeviceProvider with ChangeNotifier{
  List _devices;
  get devices => _devices;

  void updateDevice(List newDevices) {
    this._devices = newDevices;
    notifyListeners();
  }
}

class ShadowData{
  List lock;
  ShadowData.fromJson(Map<String, dynamic> json1) {
    lock = json1['lock'];
  }
}