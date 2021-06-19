class LoginData {
  int userId;
  String token;
  String userMail;
  String nickname;

  LoginData.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
    userMail = json['userMail'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['token'] = this.token;
    data['userMail'] = this.userMail;
    data['nickname'] = this.nickname;
    return data;
  }
}
