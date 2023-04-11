import 'dart:convert';

login_response_model loginResponseJson(String str)=>
    login_response_model.fromJson(json.decode(str));

class login_response_model {
  String? accessToken;
  String? refreshToken;

  login_response_model({required this.accessToken, required this.refreshToken});

  login_response_model.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }


}
