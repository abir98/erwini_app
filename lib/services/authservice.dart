import 'dart:convert';

import 'package:erwini/models/login_request_model.dart';
import 'package:erwini/models/login_response_model.dart';
import 'package:erwini/services/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:erwini/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authservice {
  static var client = http.Client();
  static Future<bool> login(login_request_model model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    print('success');
    var response = await client.post(
      Uri.parse(config.url),
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(response.body);
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      final token = data['accessToken'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      return true;
    } else {
      return false;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  Future<http.Response> get(String url) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    return http.get(Uri.parse(config.url), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
  }
  Future<http.Response> post(String url, dynamic body) async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    return http.post(Uri.parse(config.url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body));
  }
}
