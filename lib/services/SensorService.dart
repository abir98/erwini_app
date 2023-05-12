import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:erwini/config.dart';
import 'package:erwini/services/authservice.dart';

class SensorService {
  static const refreshInterval = Duration(seconds: 3); // Refresh every 30 seconds
  late Timer _timer;
  List<dynamic> sensorData = [];


  Future<List<dynamic>> getCapteurData() async {
    if (sensorData.isEmpty) {
      await refreshData();
    }
    print(sensorData);
    return sensorData;
  }


  Future<void> refreshData() async {
    final  authservice Authservice = authservice();
    final token = await Authservice.getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    final response = await http.get(Uri.parse(config.urlsensors), headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      sensorData = jsonData;

    } else {
      throw Exception('Failed to load data');
    }
  }



  void startRefreshTimer() {
    _timer = Timer.periodic(refreshInterval, (timer) async {
      await refreshData();
    });
  }

  void stopRefreshTimer() {
    _timer.cancel();
  }
}
