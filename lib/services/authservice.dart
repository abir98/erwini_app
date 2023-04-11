import 'dart:convert';

import 'package:erwini/models/login_request_model.dart';
import 'package:erwini/models/login_response_model.dart';
import 'package:erwini/services/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:erwini/config.dart';

class authservice {
  static var client = http.Client();
  static Future<bool> login(login_request_model model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var response = await client.post(
      Uri.parse(config.url),
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(response.body);

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }
}
