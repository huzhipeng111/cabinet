class BaseResponse {
  Object data;
  int resultCode;
  String resultMsg;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"];
    resultCode = json["resultCode"];
    resultMsg = json["resultMsg"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["data"] = this.data;
    data["resultCode"] = this.resultCode;
    data["resultMsg"] = this.resultMsg;
    return data;
  }
}
